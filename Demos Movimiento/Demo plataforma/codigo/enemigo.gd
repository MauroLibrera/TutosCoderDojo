extends KinematicBody2D

export var rapidez = 80
var velocidad = Vector2(1,0)

const GRAV = 32
const ARRIBA = Vector2.UP

var movimientoDerecha = true
onready var rayo = $RayCast2D


func _ready():
	pass 

func _physics_process(delta):
	
	if rayo.is_colliding():
		movimientoDerecha = !movimientoDerecha
		rayo.scale.x = -rayo.scale.x
	
	movimiento()

func movimiento():
	var colision = move_and_slide(velocidad * rapidez, ARRIBA)
	
	if movimientoDerecha:
		velocidad.x = 1
	else:
		velocidad.x = -1
	
	if not is_on_floor():
		velocidad.y += GRAV
	else:
		velocidad.y = 0
