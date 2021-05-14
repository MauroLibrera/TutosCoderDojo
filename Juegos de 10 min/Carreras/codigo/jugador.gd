extends KinematicBody2D


func _ready():
	pass

func _physics_process(delta):
	get_input()
	pass

func get_input():
	if Input.is_action_just_pressed("ui_left") and position.x > 160:
		position.x -= 192
	elif Input.is_action_just_pressed("ui_right") and position.x < 544:
		position.x += 192


func _on_Area2D_area_entered(area):
	if "AutoEnemigo" in area.name:
		get_tree().reload_current_scene()
