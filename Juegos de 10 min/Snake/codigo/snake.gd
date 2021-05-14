extends Node2D


var snake_pos = [Vector2()] setget , get_positions
var pivote = Vector2() setget set_pivote, get_pivote
var velocidades = [Vector2()] setget set_velocidades, get_velocidades

var cuerpo = preload("res://escenas/cuerpo.tscn")
onready var contenedor = $contenedor_cuerpo

var cantidad_partes = 0
var j = [0]

var detencion

func _ready():
	crear_cuerpo()
	crear_cuerpo()
	crear_cuerpo()
	pass 

func _physics_process(delta):
	pass


func crear_cuerpo():
	var instancia_cuerpo = cuerpo.instance()
	instancia_cuerpo.position = snake_pos[0]
	cantidad_partes += 1
	instancia_cuerpo.set_i(cantidad_partes)
	snake_pos.append(Vector2())
	velocidades.append(Vector2())
	contenedor.call_deferred("add_child",instancia_cuerpo)


func actualizar_positions_velocidades(newPos,newVel,i):
	detencion = $cabeza.get_detenido()
	snake_pos[i] = newPos
	velocidades[i] = newVel
	var parte_cuerpo = contenedor.get_child(i)
	if parte_cuerpo != null :
		parte_cuerpo.set_detenido(detencion)
		parte_cuerpo.set_pFinal(newPos)
		parte_cuerpo.set_velocidad(newVel)
		print(parte_cuerpo.position,newPos)












func get_positions():
	return snake_pos

func set_pivote(newPivote):
	pivote = newPivote

func get_pivote():
	return pivote

func set_velocidades(newVelocidad):
	velocidades.append(newVelocidad)

func get_velocidades():
	return velocidades
