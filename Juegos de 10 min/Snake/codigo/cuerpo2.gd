extends KinematicBody2D

var speed = Autocarga.snake_speed
var last_pos := Vector2()
var current_pos := Vector2()
var next_pos := Vector2()
var last_dir := Vector2()
var current_dir := Vector2()
var positions := []
var directions := []


func _ready():
	pass

func _process(delta):
	if Autocarga.moving:
		move_and_collide(speed * current_dir)
		if position.distance_to(current_pos) >= Autocarga.tile_size:
			position = next_pos
		if position == positions[0]:
			last_pos = current_pos
			current_pos = position
			last_dir = current_dir
			current_dir = directions[0]
			next_pos += directions[0] * Autocarga.tile_size
			clear_array()


func clear_array():
	positions.pop_front()
	directions.pop_front()

