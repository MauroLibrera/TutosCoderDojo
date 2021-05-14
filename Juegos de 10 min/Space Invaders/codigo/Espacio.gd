extends Node2D

func _ready():
	pass 


func _on_Killbox_body_entered(body):
	if body.is_in_group("enemigos"):
		get_tree().reload_current_scene()
