extends KinematicBody2D

export var rapidez = 100;
export var vel_rotacion = 5;


var velocidad = Vector2();
var rotacion = 0;

func _ready():
	pass

func _physics_process(delta):
	get_input(delta);
	move_and_slide(velocidad);
	pass

func get_input(delta):
	velocidad = Vector2();
	rotacion = 0;
	if Input.is_action_pressed("ui_right"):
		rotacion += 1;
		pass
	if Input.is_action_pressed("ui_left"):
		rotacion -= 1;
		pass
	if Input.is_action_pressed("ui_up"):
		velocidad.y = -1;
	rotation = rotation + vel_rotacion * rotacion * delta;
	velocidad = velocidad.normalized() * rapidez;
	velocidad = velocidad.rotated(rotation)
