extends "res://src/Entities/Entity.gd"


var direction = 0;

func _ready():
	$Sprite/AnimationPlayer.play("up");
	connect("set_direction",self,"_on_set_direction");
	game_state.connect("change_node",self,"_change_dir");
	emit_signal("set_direction","right",get_name());
	
func _on_set_direction(direction,who):
	if who!=get_name():
		return;
	match direction:
		"up":
			velocity = BASE_SPEED_VEC.rotated(-PI/2);
		"right":
			velocity = BASE_SPEED_VEC.rotated(0);
		"down":
			velocity = BASE_SPEED_VEC.rotated(PI/2);
		"left":
			velocity = BASE_SPEED_VEC.rotated(PI);
	velocity.round();
	$Sprite/AnimationPlayer.play(direction);
	
func _change_dir(node,name):
	if name==get_name() and node!=-1:
		print("Blinky: Changing direction");
		var dirs = ["right","left","up","down"];
		emit_signal("set_direction",dirs[randi()%4],get_name());
		
func _process(delta):
	if velocity==Vector2.ZERO:
		var dirs = ["right","left","up","down"];
		emit_signal("set_direction",dirs[randi()%4],get_name());
	translate(velocity*delta);