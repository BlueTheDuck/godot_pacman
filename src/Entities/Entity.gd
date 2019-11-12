extends Area2D

signal set_direction(direction,who);

export var current_node: int = -1;
export var attach_to_node_threshold: int = 2;
export var BASE_SPEED_VEC: Vector2 = Vector2(75.0,0);
var velocity: Vector2 = Vector2(0,0);

func _ready():
	print("Loading ",get_name());
	if current_node == -1:
		current_node = nodes.find_closest_node(position).id;
	position = nodes.list[current_node].pos;

func _process(delta):
	# Attach to node
	var node = nodes.find_closest_node(position);
	if node.dist < attach_to_node_threshold:
		if current_node!=node.id:
			game_state.emit_signal("change_node",node.id,get_name());
		current_node = node.id;
		check_node_walls();
	else:
		if current_node!=node.id:
			game_state.emit_signal("change_node",current_node,get_name());
		current_node = -1;
	# Teleport entity
	if position.x > nodes.col10 + nodes.tile_size*2:
		position.x = 0;
	if position.x < 0:
		position.x += nodes.col10 + nodes.tile_size*2;

func check_node_walls():
	if velocity.y < 0 && nodes.list[current_node].get_id_on(nodes.direction("up"))==-1:
		velocity = Vector2(0,0);
		print("STOP ",get_name(),"! (u)");
	if velocity.x > 0 && nodes.list[current_node].get_id_on(nodes.direction("right"))==-1:
		velocity = Vector2(0,0);
		print("STOP ",get_name(),"! (r)");
	if velocity.y > 0 && nodes.list[current_node].get_id_on(nodes.direction("down"))==-1:
		velocity = Vector2(0,0);
		print("STOP ",get_name(),"! (d)");
	if velocity.x < 0 && nodes.list[current_node].get_id_on(nodes.direction("left"))==-1:
		velocity = Vector2(0,0);
		print("STOP ",get_name(),"! (l)");
