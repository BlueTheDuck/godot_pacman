extends "res://src/Entities/Entity.gd"

var remote_control: RemoteControl = null;
var dot_tile_id = -2;
onready var animation_player = get_node("Sprite/AnimationPlayer");
onready var rays: Dictionary = {
	"up":$RayUp,
	"right":$RayRight,
	"down":$RayDown,
	"left":$RayLeft
};
var near_dots: Dictionary = {
	"up": INF,
	"right": INF,
	"down": INF,
	"left": INF
}

func _ready():
	remote_control = RemoteControl.new(self);
	current_node = -1;
	animation_player.play("eat");
	var tilemap = get_node("/root/Node/Game/Board");
	dot_tile_id = tilemap.tile_set.find_tile_by_name("small_dot");
	
func _process(delta):
	._process(delta);
	remote_control.process_command();
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
	translate(velocity*delta);
	for ray_name in rays.keys():
		var ray = rays.get(ray_name);
		if ray.is_colliding():
			if ray.get_collider() is TileMap:
				var tilemap: TileMap = ray.get_collider();
				var point = ray.get_collision_point();
				var map_point = tilemap.world_to_map(point++ray.position);
				#$"/root/Node/Debug".emit_signal("draw_point",point);
				if(tilemap.get_cellv(map_point)==dot_tile_id):
					var distance = self.position.distance_to(point);
					var distance_per;
					if ["up","down"].has(ray_name):
						distance_per = distance/$"../Board".PIXELS_HEIGHT;
					elif ["right","left"].has(ray_name):
						distance_per = distance/$"../Board".PIXELS_WIDTH;
					if distance<6:
						$"/root/Node/UI/Score".emit_signal("update_score",10);
						tilemap.set_cellv(map_point,-1);
					else:
						near_dots[ray_name] = distance_per;
					#print(ray.get_name(),": ",self.position.distance_to(point));
				else:
					near_dots[ray_name] = INF;
			elif ray.get_collider() is Area2D:
				var ghost: Area2D = ray.get_collider();
				print(ghost.get_name());
	
func set_direction(name: String):
	var directions = {
		"up": -90,
		"right": 0,
		"down": 90,
		"left": 180
	};
	$Sprite.rotation_degrees = directions[name];
	velocity = BASE_SPEED_VEC.rotated(deg2rad(directions[name]));
	velocity = velocity.round();
#	$RayUp.cast_to = $RayUp.cast_to.rotated(deg2rad(directions[name]));
#	$RayRight.cast_to = $RayRight.cast_to.rotated(deg2rad(directions[name]));
#	$RayDown.cast_to = $RayDown.cast_to.rotated(deg2rad(directions[name]));
#	$RayLeft.cast_to = $RayLeft.cast_to.rotated(deg2rad(directions[name]));

