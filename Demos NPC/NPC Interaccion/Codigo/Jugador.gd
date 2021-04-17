extends Area2D


export var rapidez = 100;

var velocidad = Vector2();

##############################################################
#
# Esta variable se encargara de llamar al nodo hijo interaccion. Así podemos
# usar todas las funciones que tiene
#
# Onready significa que la variable se cargara apenas comienze la ejecución
# de la escena
#
##############################################################

onready var interaccion = $Interacciones

func _ready():
	pass 

func _process(delta):
	get_input();
	position += velocidad * delta

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
		
	##############################################
	#
	# A nuestros controles le agragamos una tecla para manejar las interacciones
	# con NPC. Una vez se apreta esa tecla, se inicia la interaccion, llamando
	# a la funcion dentro del nodo "interacciones"
	#
	##############################################
	elif Input.is_action_pressed("interaccion"):
		interaccion.iniciar_interaccion()
	
	velocidad = velocidad.normalized() * rapidez;
	
	
