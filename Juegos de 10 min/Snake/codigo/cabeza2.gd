extends KinematicBody2D



const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0)
const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)

var last_pos := Vector2()
var current_pos := Vector2()
var next_pos := Vector2()
var last_dir := Vector2()
var current_dir := Vector2()
var next_dir := Vector2()
var changed_next_pos := false

onready var contenedor = $"../contenedor_cuerpo"

func _ready():
	current_pos = position
	reset()


func _unhandled_key_input(event):
	if event.scancode == KEY_A or event.scancode == KEY_LEFT:
		if current_dir != RIGHT:
			next_dir = LEFT
	elif event.scancode == KEY_D or event.scancode == KEY_RIGHT:
		if current_dir != LEFT:
			next_dir = RIGHT
	elif event.scancode == KEY_W or event.scancode == KEY_UP:
		if current_dir != DOWN:
			next_dir = UP
	elif event.scancode == KEY_S or event.scancode == KEY_DOWN:
		if current_dir != UP:
			next_dir = DOWN


func _process(delta):
	if Autocarga.moving:
		var collision = move_and_collide(Autocarga.snake_speed * current_dir)
		if position.distance_to(current_pos) >= Autocarga.tile_size:
			position = next_pos
		
		if position == next_pos:
			changed_next_pos = true
			last_dir = current_dir
			current_dir = next_dir
			last_pos = current_pos
			current_pos = position
			next_pos += next_dir * Autocarga.tile_size
			pos_change(next_pos)
		if changed_next_pos:
			for tail_part in range(0, contenedor.get_child_count()):
				var tail = contenedor.get_child(tail_part)
				tail.positions.append(current_pos)
				tail.directions.append(current_dir)
			changed_next_pos = false
		if collision != null:
			pass


func pos_change(vector):
	next_pos = vector


func reset():
	last_pos = Vector2(80, 320)
	position = current_pos
	next_pos = current_pos + Vector2(Autocarga.tile_size, 0)
	last_dir = RIGHT
	current_dir = RIGHT
	next_dir = RIGHT
	Autocarga.moving = true


