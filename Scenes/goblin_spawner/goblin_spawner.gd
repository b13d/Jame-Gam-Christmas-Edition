extends Node2D

@export var goblin : PackedScene
@export var goblin_place: Node2D
@onready var path_follow_2d = $Path2D/PathFollow2D
@onready var navigation_region_2d = $".."

@export var arr_house: Array

func _ready():
	randomize()
	pass

func _process(delta):
	pass

func create_goblin(pos):
	var _goblin = goblin.instantiate()
	path_follow_2d.progress_ratio = randf()
	_goblin.global_position = path_follow_2d.global_position
	_goblin.target = pos
	
	goblin_place.add_child(_goblin)
	path_follow_2d.progress_ratio = randf()
	_goblin.place_to_out = path_follow_2d.global_position

func _on_timer_spawn_goblin_timeout():
	if Global.count_gifts > 0:
		var current_house = get_node(String(arr_house[randi_range(0,3)]))
		create_goblin(current_house.position)
	pass # Replace with function body.
