extends KinematicBody2D

var rapidez = 80
var velocidad = Vector2() setget set_velocidad
var velocidad_real = Vector2()

var p_final = Vector2() setget set_pFinal

var i = 0 setget set_i

var snake

var detenido = false setget set_detenido

func _ready():
	snake = get_parent().get_parent()
	pass 

func _physics_process(delta):
	movimiento()


func movimiento():
	pass



func set_i(new_i):
	i = new_i

func set_velocidad(newVelocidad):
	velocidad = newVelocidad

func set_pFinal(newPFinal):
	p_final = newPFinal

func set_detenido(f):
	detenido = f
