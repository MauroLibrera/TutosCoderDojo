extends Area2D

export var rapidez = 100;

var velocidad = Vector2();

func _ready():
	pass 

func _process(delta):
	get_input();
	position = position + velocidad * delta

func get_input():
	velocidad = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocidad.x = velocidad.x + 1;
	elif Input.is_action_pressed("ui_left"):
		velocidad.x = velocidad.x - 1;
	elif Input.is_action_pressed("ui_up"):
		velocidad.y = velocidad.y - 1;
	elif Input.is_action_pressed("ui_down"):
		velocidad.y = velocidad.y + 1;
	velocidad = velocidad.normalized() * rapidez;
