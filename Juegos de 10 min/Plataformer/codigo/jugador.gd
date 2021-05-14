extends KinematicBody2D

const IZQUIERDA = Vector2(-1,0)
const DERECHA = Vector2(1,0)
const ARRIBA = Vector2(0,-1)
const ABAJO = Vector2(0,1)

export var gravedad = 2
export var salto_v = 4 * 0.33

const GRAVEDAD = Vector2(0,1)
const SALTO = Vector2(0,-1)

export var rapidez = 200

var velocidad = Vector2()

func _ready():
	pass 

func _physics_process(delta):
	get_input()
	movimiento(delta)
	pass

func get_input():
	if Input.is_action_pressed("ui_left"):
		velocidad.x = IZQUIERDA.x
	elif Input.is_action_pressed("ui_right"):
		velocidad.x = DERECHA.x
	else:
		velocidad.x = 0
	if Input.is_action_just_pressed("espacio"):
			salto()
	pass

func movimiento(delta):
	var colision = move_and_slide(velocidad * rapidez, SALTO)
	if not is_on_floor():
		velocidad.y += GRAVEDAD.y * gravedad * delta
	else:
		velocidad.y = 0

func salto():
	if is_on_floor():
		velocidad.y += SALTO.y * salto_v
	elif is_on_wall():
		velocidad.y = 0
		velocidad.y += SALTO.y * salto_v
		
