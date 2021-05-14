extends KinematicBody2D

const ARRIBA = Vector2(0,-1)
const SALTO = 200
const VELOCIDAD_CAIDA = 200
const GRAVEDAD = 10

var puntos = 0

var movimiento = Vector2()

var pared = preload("res://escenas/Paredes.tscn")

func _ready():
	pass 

func _physics_process(delta):
	movimiento.y += GRAVEDAD
	if movimiento.y > VELOCIDAD_CAIDA:
		movimiento.y = VELOCIDAD_CAIDA
	
	if Input.is_action_just_pressed("salto"):
		movimiento.y = -SALTO
	
	movimiento = move_and_slide(movimiento, ARRIBA)
	
	
	get_parent().get_parent().get_node("CanvasLayer/RichTextLabel").text = str(puntos)

func crear_pared():
	var instancia_Pared = pared.instance()
	instancia_Pared.position = Vector2(450, rand_range(-50,50))
	get_parent().call_deferred("add_child", instancia_Pared)


func _on_resetter_body_entered(body):
	if body.name == "Paredes":
		crear_pared()
		body.queue_free()

func _on_Hitbox_area_entered(area):
	if area.name == "areaPuntos":
		puntos += 1

func _on_Hitbox_body_entered(body):
	if body.name == "Paredes":
		get_tree().reload_current_scene()
