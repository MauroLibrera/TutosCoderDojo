extends KinematicBody2D

var rapidez = 500

var velocidad = Vector2()
var velocidad_bala = 2000

var bala = preload("res://Escenas/bala.tscn")

func _ready():
	pass

func _physics_process(delta):
	get_input()
	velocidad = move_and_slide(velocidad )
	look_at(get_global_mouse_position())

func get_input():
	velocidad = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocidad.x = velocidad.x + 1;
	if Input.is_action_pressed("ui_left"):
		velocidad.x = velocidad.x - 1;
	if Input.is_action_pressed("ui_up"):
		velocidad.y = velocidad.y - 1;
	if Input.is_action_pressed("ui_down"):
		velocidad.y = velocidad.y + 1;
	velocidad = velocidad.normalized() * rapidez;
	
	if Input.is_action_just_pressed("disparo"):
		disparo()

func disparo():
	var instancia_bala = bala.instance()
	instancia_bala.position = get_global_position()
	instancia_bala.rotation_degrees = rotation_degrees
	instancia_bala.apply_impulse(Vector2(),Vector2(velocidad_bala,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", instancia_bala)

func muerte():
	get_tree().reload_current_scene()


func _on_Area2D_body_entered(body):
	if "enemigo" in body.name:
		muerte()
