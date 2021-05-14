extends Node2D

################## Nodos
onready var pos1 = $Position2D
onready var pos2 = $Position2D2
onready var pos3 = $Position2D3
##################

var auto_enemigo = preload("res://escenas/AutoEnemigo.tscn")

############### Posiciones
var posiciones

func _ready():
	randomize()
	posiciones =[pos1.position, pos2.position, pos3.position]
#################################


func _process(delta):
	pass

func generador():
	var posicion_generador = randi() %3
	var instancia_auto = auto_enemigo.instance()
	
	var rapidez_auto = instancia_auto.get_rapidez()
	
	var tiempo_minimo =  0.8
	var tiempo = rand_range(tiempo_minimo,tiempo_minimo + 1)
	
	$Timer.wait_time = tiempo
	
	instancia_auto.position = posiciones[posicion_generador]
	self.add_child(instancia_auto)
	
	$Timer.start()
