extends KinematicBody2D

var velocidad = Vector2()

func _ready():
	pass

func _physics_process(delta):
	var jugador = get_parent().get_node("player")
	
	position += (jugador.position - position)/50
	look_at(jugador.position)
	
	move_and_collide(velocidad)


func _on_Area2D_body_entered(body):
	if "bala" in body.name:
		queue_free()
