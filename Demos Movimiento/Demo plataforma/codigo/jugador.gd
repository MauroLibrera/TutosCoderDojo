extends KinematicBody2D

var velocidad = Vector2()
var rapidez = 200
var gravedad = 7
var fuerza_salto = 350

const ARRIBA = Vector2(0,-1)


func _ready():
	pass 

func _physics_process(delta):
	get_input()
	movimiento()
	pass

func get_input():
	if Input.is_action_pressed("ui_left"):
		velocidad.x = -1
	elif Input.is_action_pressed("ui_right"):
		velocidad.x = 1
	else:
		velocidad.x = 0
	if Input.is_action_just_pressed("salto"):
		salto()
	velocidad.x = velocidad.x * rapidez


func movimiento():
	var colision = move_and_slide(velocidad, ARRIBA)
	if not is_on_floor():
		velocidad.y += gravedad
	else:
		velocidad.y = 0

func salto():
	if is_on_floor():
		velocidad.y -= fuerza_salto
