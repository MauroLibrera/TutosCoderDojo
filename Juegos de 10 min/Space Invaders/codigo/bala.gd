extends KinematicBody2D

var velocidad = Vector2(0,-1)
var rapidez = 700

func _ready():
	pass 

func _physics_process(delta):
	move_and_slide(velocidad * rapidez)


func _on_hitbox_body_entered(body):
	if body.is_in_group("enemigos"): 
		body.queue_free()
		queue_free()
