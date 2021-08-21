extends Node

const CAMBIO_VELOCIDAD = 20

onready var archivo_guardado = File.new()

onready var direccion_guardado = "user://save.dat"

onready var diccionario_highscore = {"highscore": 0} setget guardar_puntos

func _ready():
	if not archivo_guardado.file_exists(direccion_guardado):
		crear_archivo_guardado()
	cargar_datos()

func crear_archivo_guardado():
	archivo_guardado.open(direccion_guardado,File.WRITE)
	archivo_guardado.store_var(diccionario_highscore)
	archivo_guardado.close()

func guardar_puntos(nuevoPuntaje):
	diccionario_highscore["highscore"] = nuevoPuntaje
	archivo_guardado.open(direccion_guardado, File.WRITE)
	archivo_guardado.store_var(diccionario_highscore)
	archivo_guardado.close()

func cargar_datos():
	archivo_guardado.open(direccion_guardado, File.READ)
	diccionario_highscore = archivo_guardado.get_var()
	if diccionario_highscore == null:
		diccionario_highscore = {
			"highscore": 0
		}
	archivo_guardado.close()
