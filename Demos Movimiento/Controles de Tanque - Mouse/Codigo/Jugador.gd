extends RigidBody2D

export var magnitud_fuerza = 10;
export var vel_rotacion = 5;

var fuerza = Vector2();
var posicion_mouse = Vector2();


func _ready():
	set_linear_damp(1)
	pass 

func _physics_process(delta):
	rotacion_jugador();
	get_input(delta);
	set_applied_force(fuerza);
	pass

func rotacion_jugador():
	posicion_mouse = get_local_mouse_position();
	rotation = rotation + posicion_mouse.angle();
	pass

func get_input(delta):
	fuerza = Vector2();
	if Input.is_mouse_button_pressed(1):
		fuerza.y = 1;
	fuerza = fuerza * magnitud_fuerza * delta; 
	fuerza = fuerza.rotated(rotation + PI/2);
