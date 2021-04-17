extends KinematicBody2D
###################################################################################
#Codigo Para movimiento básico
#El movimiento se basa en series de movimientos rectilineos uniformes

#El NPC (Personaje no jugable) busca su posición objetivo
# y se traslada hasta ese punto en línea recta.

#Acá se explica la implementación del movimiento rectilíneo
#---------------------------------------------------------------------------------#

export var rapidez = 2000; #Esta rapidez va a depender d la resolución en la que se vea el juego?

var velocidad = Vector2(1,0); #Esto nos va a decir la dirección hacia donde queremos que se dirija


func _ready():
	#En esta función podemos poner la posición inicial donde queremos que esté nuestro NPC
	pass 

func _physics_process(delta):
	move_and_slide(velocidad*rapidez*delta)
	pass

# Este es el movimiento básico de un enemigo que se mueve en línea recta
# sin haber especificado todavía el objetivo, es por ejemplo, el movimiento
# de una bala
