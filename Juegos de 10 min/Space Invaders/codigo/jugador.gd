extends KinematicBody2D

var rapidez = 200
var velocidad = Vector2()

var vel_bala = 900

var bala = preload("res://escenas/bala.tscn")

func _ready():
	pass 

func _physics_process(delta):
	get_input(delta)
	pass

func get_input(delta):
	velocidad = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocidad.x -= 1
	elif Input.is_action_pressed("ui_right"):
		velocidad.x += 1
	velocidad = rapidez * velocidad
	velocidad = move_and_slide(velocidad)
	position.x = clamp(position.x, -460, 460)
	
	if Input.is_action_just_pressed("espacio"):
		if $cadencia.time_left == 0:
			disparo()

func disparo():
	var instancia_bala = bala.instance()
	instancia_bala.scale = Vector2(0.5,0.5)
	instancia_bala.position = position - Vector2(0,32)
	get_tree().get_root().call_deferred("add_child",instancia_bala)
	$cadencia.start() 
	pass
