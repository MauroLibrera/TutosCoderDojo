extends KinematicBody2D


var amplitud = 50
var x = 0
var y = 0
var omega = 0.15

func _ready():
	add_to_group("enemigos")
	pass 

func _physics_process(delta):
	x = global_position.x
	y = -amplitud * sin(x*omega)
	
	position.y = y
	pass
