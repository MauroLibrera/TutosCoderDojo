extends KinematicBody2D

var velocidad = Vector2()
var rapidez = 8

const GRAV = 32
const ARRIBA = Vector2.UP

var movimiento_derecha = true

onready var rayo_de = $rayo_derecho

func _ready():
	pass 

func _physics_process(delta):
	
	if rayo_de.is_colliding():
		movimiento_derecha = !movimiento_derecha
		rayo_de.scale.x =  -rayo_de.scale.x
	
	movimiento()

func movimiento():
	var colision = move_and_slide(velocidad*rapidez,ARRIBA)
	velocidad.x = rapidez if movimiento_derecha else -rapidez
	if not is_on_floor():
		velocidad.y += GRAV
	else:
		velocidad.y = 0


func _on_hurtbox_area_entered(area):
	if area.name == "hitbox_jugador":
		queue_free()
