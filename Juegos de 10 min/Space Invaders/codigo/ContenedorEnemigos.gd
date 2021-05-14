extends Node2D

onready var alien_1 = $tipo1 
onready var alien_2 = $tipo2
onready var alien_3 = $tipo3
onready var alien_4 = $tipo4
onready var alien_5 = $tipo5


export var omega_inicial = 0.3


var amplitud_x = 716
var amplitud_y = 1
var omega setget ,get_omega
var t = 0
var t2 = 0
var frecuencia = 0

func _ready():
	omega = omega_inicial
	pass 

func _process(delta):
	t += 1 * delta
	t2 += 1 * delta
	
	frecuencia = PI/omega
	if t2 >= frecuencia:
		t2 = 0
		position.y += 16

	if t >= frecuencia*2:
		t = 0
		omega += 0.2
	
	movimiento_pares(t)
	movimiento_impares(t)
	
	pass

func movimiento_pares(t):
	alien_2.position.x = amplitud_x * sin(t*omega)
	alien_4.position.x = amplitud_x * sin(t*omega)
	pass

func movimiento_impares(t):
	alien_1.position.x = -amplitud_x * sin(t*omega)
	alien_3.position.x = -amplitud_x * sin(t*omega)
	alien_5.position.x = -amplitud_x * sin(t*omega)
	pass

func get_omega():
	return omega
