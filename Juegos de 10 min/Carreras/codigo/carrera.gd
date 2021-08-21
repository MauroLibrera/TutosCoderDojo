extends Node2D

var puntos = 0

onready var etiqueta_puntos = $UI/MarginContainer/VBoxContainer/HBoxContainer2/puntos_valor
onready var etiqueta_highscore = $UI/MarginContainer/VBoxContainer/HBoxContainer/Highscore_valor

func _ready():
	etiqueta_highscore.text = str(Autoload.diccionario_highscore["highscore"])
	pass 

func _process(delta):
	var puntos_str = str(puntos)
	etiqueta_puntos.set_text(puntos_str)
		


func _on_Timer_timeout():
	puntos += 100
	if puntos > Autoload.diccionario_highscore["highscore"]:
		Autoload.guardar_puntos(puntos)
		etiqueta_highscore.text = str(puntos)
