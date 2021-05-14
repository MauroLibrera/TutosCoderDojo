extends Node2D

var pared = preload("res://escenas/Paredes.tscn")


func _ready():
	randomize()

func crear_paredes():
	var instancia_pared = pared.instance()
	instancia_pared.position = Vector2(450,rand_range(-60,60))
	call_deferred("add_child",instancia_pared)
	
func _on_reseteador_body_entered(body):
	print(1)
	#if body.name == "Paredes":
	body.queue_free()
	crear_paredes()
