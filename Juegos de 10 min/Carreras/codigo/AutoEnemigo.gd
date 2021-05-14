extends Node2D

var rapidez = 500 setget ,get_rapidez
var velocidad = Vector2(0,1)

func _ready():
	pass 

func _process(delta):
	velocidad.y = rapidez * delta
	position += velocidad

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func get_rapidez():
	return rapidez
