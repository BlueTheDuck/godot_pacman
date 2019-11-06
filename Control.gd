extends Control

signal draw_point(where);

onready var pacman: Area2D = get_node("/root/Node/Game/Pacman");
onready var blinky: Area2D = get_node("/root/Node/Game/Blinky");
#const control = preload("res://src/remote.gd");
var last_update_from: String = "";
var entities_nodes: Dictionary = {
	"Pacman": -1,
	"Blinky": -1,
};
var Colors: Dictionary = {
	"Pacman": Color.yellow,
	"Blinky": Color.red,
};
var points: Array = [];

func _input(event):
	if Input.is_action_just_pressed("Click"):
		var node = nodes.find_closest_node(event.position);
		print("Click: ",event.position);
		print("Click: ",node);
		print("Click: ",nodes.list[node.id]);

func _draw():
	for i in range(nodes.list.size()):
		var here = nodes.list[i];
		var color := Color.blue;
		for entity in entities_nodes:
			if entities_nodes.get(entity)==i:
				color = Colors.get(entity);
		draw_circle(here.pos,2,color);
		if here.get_id_on(nodes.Directions.UP)!=-1:
			draw_line(here.pos,here.pos+Vector2(0,-8),color);
		if here.get_id_on(nodes.Directions.RIGHT)!=-1:
			draw_line(here.pos,here.pos+Vector2(8,0),color);
		if here.get_id_on(nodes.Directions.DOWN)!=-1:
			draw_line(here.pos,here.pos+Vector2(0,8),color);
		if here.get_id_on(nodes.Directions.LEFT)!=-1:
			draw_line(here.pos,here.pos+Vector2(-8,0),color);
	for i in range(points.size()):
		var point: Vector2 = points[i];
		draw_circle(point,2,Color.orange);


func _ready():
	pacman.connect("change_node",self,"_on_change_node");
	blinky.connect("change_node",self,"_on_change_node");
	self.connect("draw_point",self,"_add_point");
	
func _add_point(where: Vector2):
	points.append(where);
	
	

func _on_change_node(node,name):
	entities_nodes[name] = node;
	update();
