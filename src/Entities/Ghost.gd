extends "res://src/Entities/Entity.gd"


var direction = 0;

func _ready():
	$Node2D/AnimationPlayer.play("up");
	connect("set_direction",self,"_on_set_direction");
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
	$Node2D/AnimationPlayer.play(direction);

func _process(delta):
	translate(velocity*delta);