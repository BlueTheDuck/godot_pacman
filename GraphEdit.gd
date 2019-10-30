extends GraphEdit


onready var nodes = preload("res://src/nodes.gd").get_nodes();
onready var pacman: Area2D = get_node("/root/Node2D/Pacman");

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(nodes.size()):
		var here = nodes[i];
		draw_line(here.pos,nodes[here.left].pos,Color.yellow);

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
