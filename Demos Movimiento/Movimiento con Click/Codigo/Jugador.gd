extends KinematicBody2D

export var rapidez = 200;

var direccion = Vector2();
var posicion_mouse = null;

func _ready():
	pass 

func _physics_process(delta):
	get_input();
	movimiento();
	pass

func get_input():
	if Input.is_mouse_button_pressed(1):
		posicion_mouse = get_global_mouse_position();

func movimiento():
	if posicion_mouse:
		direccion = posicion_mouse - global_position
		
		if direccion.length() < 3:
			return
		
		var velocidad = move_and_slide(direccion.normalized()* rapidez)
		pass
	pass
