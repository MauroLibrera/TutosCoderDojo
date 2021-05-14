extends KinematicBody2D

var rapidez = .5
var velocidad = Vector2()
var pantalla = Vector2()
var velocidad_real = Vector2()

var p_inicial = Vector2()
var p_medio = Vector2()
var p_final = Vector2()

var snake

var i = 0 

var detenido = false setget ,get_detenido

var tile = 32

var cambio_posicion = false

func _ready():
	snake = get_parent()
	pass 

func _physics_process(delta):
	get_input()
	movimiento()

func get_input():
	if Input.is_action_just_pressed("ui_left") and velocidad.x == 0:
		velocidad = Vector2(-1,0)
	elif Input.is_action_just_pressed("ui_right") and velocidad.x == 0:
		velocidad = Vector2(1,0)
	elif Input.is_action_just_pressed("ui_up") and velocidad.y == 0:
		velocidad = Vector2(0,-1)
	elif Input.is_action_just_pressed("ui_down") and velocidad.y == 0:
		velocidad = Vector2(0,1)

func movimiento():
	var colision = move_and_collide(velocidad_real * rapidez)
	if velocidad_real != Vector2():
		if position.distance_to(p_medio) > tile:
			position = p_final
		if position == p_final:
			cambio_posicion = true
			snake.actualizar_positions_velocidades(position,velocidad,i)
			velocidad_real = velocidad
			p_inicial = p_medio
			p_medio = position
			p_final += velocidad * tile
	else:
		p_final += velocidad * tile
		velocidad_real = velocidad

func get_detenido():
	return detenido
