extends Node


const LENTO = 2.5
const NORMAL = 3.5
const RAPIDO = 4.5


var tile_size = 32
var snake_speed := NORMAL
var moving = true
var obstacle_positions = []
var all_last_pos = []
var all_current_pos = []
var all_next_pos := []


func _ready():
	pass 
