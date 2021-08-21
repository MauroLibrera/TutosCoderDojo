extends KinematicBody

var rapidez = 4
var sensibilidad = 0.5


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= sensibilidad * event.relative.x
		rotation_degrees.x -= sensibilidad * event.relative.y

func _process(delta):
	if Input.is_action_pressed("salir"):
		get_tree().quit()

func _physics_process(delta):
	controles(delta)

func controles(delta):
	var velocidad = Vector3()
	if Input.is_action_pressed("adelante"):
		velocidad.z -= 1
	if Input.is_action_pressed("atras"):
		velocidad.z += 1
	if Input.is_action_pressed("izquierda"):
		velocidad.x -= 1
	if Input.is_action_pressed("derecha"):
		velocidad.x += 1
	velocidad = velocidad.normalized()
	velocidad = velocidad.rotated(Vector3(0,1,0), rotation.y)
	move_and_collide(velocidad * rapidez * delta)
	
