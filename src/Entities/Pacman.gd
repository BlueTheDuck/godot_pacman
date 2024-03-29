extends "res://src/Entities/Entity.gd"

var remote_control: RemoteControl = null;
onready var animation_player = get_node("Sprite/AnimationPlayer");
onready var nodes_rays: Dictionary = {
	"left":  $DotsRays/Left,
	"front": $DotsRays/Front,
	"right": $DotsRays/Right,
	"back":  $DotsRays/Back
};
onready var walls_rays: Dictionary = {
	"left":  $WallsRays/Left,
	"front": $WallsRays/Front,
	"right": $WallsRays/Right,
	"back":  $WallsRays/Back
};
onready var ghosts_rays: Dictionary = {
	"left":  $GhostsRays/Left,
	"front": $GhostsRays/Front,
	"right": $GhostsRays/Right,
	"back":  $GhostsRays/Back
};
var near_dots: Dictionary = {
	"left": 0,
	"front": 0,
	"right": 0,
	"back": 0
}
var near_walls: Dictionary = {
	"left": 0,
	"front": 0,
	"right": 0,
	"back": 0
}
var near_ghosts: Dictionary = {
	"left": 0,
	"front": 0,
	"right": 0,
	"back": 0
}
var direction: String = "right";
var machine_pressed_key: String = "";

func _ready():
	remote_control = RemoteControl.new(self);
	current_node = -1;
	animation_player.play("eat");
	game_state.connect("move_player",self,"_on_move_player");
	Input.action_press("left");
	
func _process(delta):
	._process(delta);
	remote_control.process_command(self);
	if current_node != -1:
		for action in ["up","right","down","left"]:
			if Input.is_action_pressed(action) && nodes.list[current_node].get_id_on(nodes.direction(action))!=-1:
				set_direction(action);
		.check_node_walls();
	else:
		var actions: Array = [];
		if velocity.x != 0:
			actions = ["left","right"];
		elif velocity.y != 0:
			actions = ["up","down"];
		assert(actions!=[]);
		for action in actions:
			if Input.is_action_pressed(action):
				set_direction(action);
				Input.action_release(action);
	translate(velocity*delta);

	# Can Pacman see any dot?
	for node_ray_name in nodes_rays.keys():
		var ray = nodes_rays.get(node_ray_name);
		if ray.is_colliding():
			if ray.get_collider() is TileMap:
				var tilemap: TileMap = ray.get_collider();
				var point = ray.get_collision_point();
				var map_point = tilemap.world_to_map(point);
				$"/root/Node/Debug".emit_signal("draw_point",point,Color.pink);
				var distance = self.position.distance_to(point);
				var distance_per = distance/game_state.BIGGEST_DISTANCE;
				# Rays are not 100% precise with tilemaps, just work with the entire region
				for v in [Vector2(0,0),Vector2(0,1),Vector2(1,0),Vector2(0,-1),Vector2(-1,0)]:
					var cell_id = tilemap.get_cellv(map_point+v);
					if cell_id!=tilemap.INVALID_CELL and tilemap.tile_set.tile_get_name(cell_id)=="small_dot":
						if distance<8:
							tilemap.set_cellv(map_point+v,-1)
							game_state.emit_signal("update_score",10);
							tilemap.set_cellv(map_point+v,-1);
						else:
							near_dots[node_ray_name] = 1 - distance_per;
						break
					else:
						near_dots[node_ray_name] = 0;
					
	# Can Pacman see any wall?
	for wall_ray_name in walls_rays.keys():
		var ray = walls_rays.get(wall_ray_name);
		if ray.is_colliding():
			if ray.get_collider() is TileMap:
				var tilemap: TileMap = ray.get_collider();
				var point = ray.get_collision_point();
				var map_point = tilemap.world_to_map(point+ray.position);
				$"/root/Node/Debug".emit_signal("draw_point",point,Color.blue);
				var distance = self.position.distance_to(point);
				var distance_per = distance/game_state.BIGGEST_DISTANCE;
				near_walls[wall_ray_name] = 1 - distance_per;
		else:
			near_walls[wall_ray_name] = 0;
				
	# Can Pacman see any ghost?
	for ghost_ray_name in ghosts_rays.keys():
		var ray = ghosts_rays.get(ghost_ray_name);
		if ray.is_colliding():
			if ray.get_collider() is Area2D:
				var ghost = ray.get_collider();
				print("Found ghost ",ghost.get_name());
				var point = ray.get_collision_point();
				$"/root/Node/Debug".emit_signal("draw_point",point,Color.red);
				var distance = self.position.distance_to(point);
				var distance_per = distance/game_state.BIGGEST_DISTANCE;
				near_ghosts[ghost_ray_name] = 1 - distance_per;
			else:
				near_ghosts[ghost_ray_name] = 0;
				

func _on_move_player(direction):
	print("Rotating ",direction);
	rotate_to(direction);

func rotate_to(name: String):
	var directions = {
		"up": 270,
		"right": 0,
		"down": 90,
		"left": 180,
	};
	var rotations = {
		"fwd": 0,
		"rot_left": -90,
		"bwd": 180,
		"rot_right": 90
	};
	
	if machine_pressed_key!="":
		Input.action_release(machine_pressed_key)
		machine_pressed_key = ""
		
	var rotation_degrees = (directions[direction] + rotations[name] + 360)%360;
	print("Degrees: ",rotation_degrees);
	for key in directions.keys():
		if directions[key]==rotation_degrees:
			print("Pressing ",key);
			Input.action_press(key);
			machine_pressed_key = key;
			return;
	assert(false);


func set_direction(name: String):
	direction = name
	var directions = {
		"up": -90,
		"right": 0,
		"down": 90,
		"left": 180
	};
	$Sprite.rotation_degrees = directions[name];
	$DotsRays.rotation_degrees = directions[name];
	$WallsRays.rotation_degrees = directions[name];
	velocity = BASE_SPEED_VEC.rotated(deg2rad(directions[name]));
	velocity = velocity.round();
