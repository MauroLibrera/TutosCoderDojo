extends KinematicBody2D

#######################################################################
# La idea del movimiento aleatorio es que el NPC elija un punto cerca,
# y se mueva hacia ese punto en línea recta.
 
# La diferencia con el movimiento rectilíneo básico es que 
# el camino de nuestro NPC tiene un final, llega a un destino 
######################################################################

########################################################################
# Nuestro NPC tendrá 2 acciones: Moverse y elegir un punto al que moverse
# ¿Por que tiene estas 2 acciones? Porque son acciones que no se pueden
# ejecutar al mismo tiempo
#########################################################################

###############################################################################
# Para definir las acciones que hace nuestro NPC usamos ENUM, que hace una
# lista, y podemos coincidir lo que queremos hacer con los estados
#############################################################################



enum acciones {
	MOVER,
	ELEGIR
}

export var rapidez = 3000;

var destino = Vector2();

var estado_actual = acciones.ELEGIR

var velocidad = Vector2();

func _ready():
	#Podemos inicializar el origen de nuestro NPC
	randomize()
	pass

##############################################################################
# En nuestro proceso lo que vamos a hacer es ver cual es el estado actual
# y según en que estado esté, vamos a hacer las acciones
##############################################################################

func _physics_process(delta):
	match estado_actual:
		acciones.ELEGIR:
			elegir_destino();
		acciones.MOVER:
			movimiento(delta);
	pass

###################################
# La función de abajo nos va a elegir un punto cerca de nuestro npc y va a
# cambiar la direccion de la velocidad para llegar a ese destino
###################################

func elegir_destino():
	#
	# Elijo un punto  que esté a dentro de 200 pixeles alrededor del NPC
	#
	destino.x = rand_range(-200,200); 
	destino.y = rand_range(-200,200);
	#
	# Para poder dar direccion a la velocidad, la velocidad tiene que ser mayor
	# a 0, por eso siempre le doy un nuevo valor
	#
	velocidad = Vector2(1,0)
	velocidad = velocidad.rotated(destino.angle()).normalized();
	#
	# Una vez que se elige el destino y la direccion, se cambia de modo a MOVER
	#
	estado_actual = acciones.MOVER;
	#
	# Para poder decirle al NPC que se detenga cuando esté cerca del destino, 
	# se tiene que llevar todo a una referencia global (Más explicación 
	# necesaria)
	#
	destino = global_position + destino
	pass

########################################################
# La funcion movimento va a hacer que nuestro personaje se mueva
# y se detenga cuando llegue a su destino
########################################################
func movimiento(delta):
	move_and_slide(velocidad * rapidez * delta)
	#
	# Esta condicion nos dice que si la distancia del NPC al destino, en un
	# marco de referencia global, es menor a 2 pixeles, que se detenga.
	# La velocidad se hace nula y se cambia la accion a elegir
	#
	if abs(destino.length() - global_position.length()) < 2:
		velocidad = Vector2()
		estado_actual = acciones.ELEGIR
	pass
