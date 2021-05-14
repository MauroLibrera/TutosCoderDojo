extends ParallaxBackground


func _ready():
	pass 

func _process(delta):
	$estrellas1.motion_offset.y -= 25 * delta
	$estrellas2.motion_offset.y -= 75 * delta
