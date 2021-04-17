extends KinematicBody2D



enum acciones {
	MOVER,
	ELEGIR
}

onready var timer = $Timer

export var rapidez = 3000;

var destino = Vector2();

var estado_actual = acciones.ELEGIR

var velocidad = Vector2();

func _ready():
	randomize()
	pass

func _physics_process(delta):
	print(timer.time_left)
	match estado_actual:
		acciones.ELEGIR:
			elegir_destino();
		acciones.MOVER:
			movimiento(delta);
	pass

func elegir_destino():
	if timer.time_left == 0:
		destino.x = rand_range(-200,200); 
		destino.y = rand_range(-200,200);
		velocidad = Vector2(1,0)
		velocidad = velocidad.rotated(destino.angle()).normalized();
		estado_actual = acciones.MOVER;
		destino = global_position + destino
	pass

func movimiento(delta):
	move_and_slide(velocidad * rapidez * delta)
	
	if abs(destino.length() - global_position.length()) < 2:
		velocidad = Vector2()
		estado_actual = acciones.ELEGIR
		timer.start()
	pass
