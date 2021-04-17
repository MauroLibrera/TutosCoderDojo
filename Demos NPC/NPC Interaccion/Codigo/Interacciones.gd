extends Area2D

############################################
#
# Definir la escena como nueva clase nos permite agregar nuevas propiedades
# al nodo del que lo creamos. 
# Es omo crear un nuevo nodo con más funciones
#
###########################################
class_name InteractionManager

#####################################################
#
# Escribir así la variable nos permite definir el tipo de variable que sea
# antes de darle un valor
# En este caso el tipo de variable será "InteractionManager" que es la clase que
# definimos antes
# 
# Esto quiere decir que la variable interaccion solo puede ser otro
# "InteractionManager". Esto va a pasar cuando se choquen dos areas de interaccion
#
#####################################################
var interaccion: InteractionManager

#######################################################
#
# Cuando nuestra "interaccion" sea otro NPC, se va a llamar a la función 
# recibir interacción del NPC
#
########################################################

func iniciar_interaccion():
	if interaccion != null:
		interaccion.recibir_interaccion()

#######################################################
#
# La función recibir_interaccion va a cambiar según el NPC que se trate
#
#######################################################
func recibir_interaccion():
	print("No definido")

############################################################
#
# Las últimas funciones manipulan señales
#
# Las señales son mensajes que los nodos envían, y que otros nodos pueden 
# recibir y responder
#
# En el case del nodo de CollisionShape2D, usamos 2 señales:
# AreaEntered: que nos dice cuando otra collision shape entra en el area
# AreaExited: que nos dice cuando otra collision shape sale del area
#
# Las funciones toman estas señales y se ejecutan apenas se detectan las señales
#
############################################################


func _on_Interacciones_area_entered(area):
	###########################################
	#
	# Cuando un area entra en otra (hablando de collision shapes siempre),
	# la señal envía también el identificador del área que entra.
	# Esto sería el nombre único que tiene el area entrante.
	# Así podemos identificar la variable interaccion como el area que entra
	#
	###########################################
	
	interaccion = area
	pass 


func _on_Interacciones_area_exited(area):
	######################################################
	#
	# Lo mismo que con el area entrante sucede cuando el area sale de la otra.
	#
	#####################################################
	
	
	
	if interaccion == area:
		interaccion = null
	pass
