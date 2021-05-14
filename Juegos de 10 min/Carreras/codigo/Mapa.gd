extends Node2D

var rapidez = 1500
var velocidad = Vector2(0,1)

func _ready():
	pass 

func _process(delta):
	velocidad.y = rapidez * delta
	position += velocidad

func _on_VisibilityNotifier2D_screen_exited():
	position = Vector2(0, -1280)
