extends Area2D


signal change_node(node);

var velocity: Vector2 = Vector2(0,0);
const BASE_SPEED_VEC: Vector2 = Vector2(50.0,0);

var my_node_id: int = -1;

func _draw():
	draw_circle($Sprite.position,5,Color.orange);
	pass

func _ready():
	$Sprite/AnimationPlayer.play("eat");
	my_node_id = nodes.find_closest_node(position).id;
	position = nodes.list[my_node_id].pos;
	
func _process(delta):
	var node = nodes.find_closest_node(position);
	if node.dist < 2:
		if my_node_id!=node.id:
			emit_signal("change_node",my_node_id);
		my_node_id = node.id;
	else:
		if my_node_id!=node.id:
			emit_signal("change_node",my_node_id);
		my_node_id = -1;
	if my_node_id != -1:
		for action in ["up","right","down","left"]:
			if Input.is_action_pressed(action) && nodes.list[my_node_id].get_id_on(nodes.direction(action))!=-1:
				set_direction(action);
		if velocity.y < 0 && nodes.list[my_node_id].get_id_on(nodes.direction("up"))==-1:
			velocity = Vector2(0,0);
		if velocity.x > 0 && nodes.list[my_node_id].get_id_on(nodes.direction("right"))==-1:
			velocity = Vector2(0,0);
		if velocity.y > 0 && nodes.list[my_node_id].get_id_on(nodes.direction("down"))==-1:
			velocity = Vector2(0,0);
		if velocity.x < 0 && nodes.list[my_node_id].get_id_on(nodes.direction("left"))==-1:
			velocity = Vector2(0,0);
			
	else:
		var actions: Array = [];
		print(velocity);
		if velocity.x != 0:
			actions = ["left","right"];
		elif velocity.y != 0:
			actions = ["up","down"];
		assert(actions!=[]);
		for action in actions:
			if Input.is_action_pressed(action):
					set_direction(action);
	translate(velocity*delta);
	
func set_direction(name: String):
	var directions = {
		"up": -90,
		"right": 0,
		"down": 90,
		"left": 180
	};
	print("Setting to ",name);
	$Sprite.rotation_degrees = directions[name];
	velocity = BASE_SPEED_VEC.rotated(deg2rad(directions[name]));
	velocity = velocity.round();
