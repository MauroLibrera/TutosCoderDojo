extends Area2D

var tamanio_grilla = 20;
var cambio_pos = Vector2();

func _ready():
	pass 

func _process(delta):
	get_input();
	pass

func get_input():
	cambio_pos = Vector2();
	if Input.is_action_pressed("ui_right"):
		cambio_pos.x = cambio_pos.x + tamanio_grilla;
	elif Input.is_action_pressed("ui_left"):
		cambio_pos.x = cambio_pos.x - tamanio_grilla;
	elif Input.is_action_pressed("ui_up"):
		cambio_pos.y = cambio_pos.y - tamanio_grilla;
	elif Input.is_action_pressed("ui_down"):
		cambio_pos.y = cambio_pos.y + tamanio_grilla;
	position = position + cambio_pos;
