extends Node2D

var manzana = preload("res://escenas/manzana.tscn")

var grilla_x = []
var grilla_y = []

func _ready():
	llenar_grillas()
	randomize()
	pass 

func _process(delta):
	pass

func llenar_grillas():
	var x = 32 + 16
	var y = x
	while x < 1024:
		grilla_x.append(x)
		x += 32
	while y < 608:
		grilla_y.append(y)
		y += 32

func generar_manzanas():
	pass


