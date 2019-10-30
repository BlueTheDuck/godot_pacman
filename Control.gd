extends Control

onready var pacman: Area2D = get_node("/root/Node2D/Pacman");

func _input(event):
	if Input.is_action_just_pressed("Click"):
		var node = nodes.find_closest_node(event.position);
		print(node);
		print(nodes.list[node.id]);
	if Input.is_key_pressed(KEY_R):
		update();

func _draw():
	for i in range(nodes.list.size()):
		var here = nodes.list[i];
		var color = Color.green if pacman.my_node_id==i else Color.red;
		draw_circle(here.pos,5,color);
		if here.get_id_on(nodes.Directions.UP)!=-1:
			draw_line(here.pos,here.pos+Vector2(0,-8),color);
		if here.get_id_on(nodes.Directions.RIGHT)!=-1:
			draw_line(here.pos,here.pos+Vector2(8,0),color);
		if here.get_id_on(nodes.Directions.DOWN)!=-1:
			draw_line(here.pos,here.pos+Vector2(0,8),color);
		if here.get_id_on(nodes.Directions.LEFT)!=-1:
			draw_line(here.pos,here.pos+Vector2(-8,0),color);



func _on_Pacman_change_node(node):
	update();
