extends Control

onready var game = preload("res://escenas/carrera.tscn")

func _ready():
	pass 


func _on_start_pressed():
	get_tree().change_scene("res://escenas/carrera.tscn")


func _on_exit_pressed():
	get_tree().quit()
	pass
