extends Node2D

@export var goblin : PackedScene
@export var goblin_place: Node2D
@onready var path_follow_2d = $Path2D/PathFollow2D
@onready var navigation_region_2d = $".."

@export var arr_house: Array

func _ready():
	randomize()
	pass


func create_goblin(pos):
	var _goblin = goblin.instantiate()
	path_follow_2d.progress_ratio = randf()
	_goblin.global_position = path_follow_2d.global_position
	
	var rnd_num_target = randi_range(0, Global.targets_for_goblins.size() - 1)
	_goblin.target = Global.targets_for_goblins[rnd_num_target]
	#_goblin.target = pos
	
	goblin_place.add_child(_goblin)
	path_follow_2d.progress_ratio = randf()
	_goblin.place_to_out = path_follow_2d.global_position

func _on_timer_spawn_goblin_timeout():
	if $TimerSpawnGoblin.wait_time != (1 - Global.current_level / 10):
		print(1 - Global.current_level / 10)
		$TimerSpawnGoblin.set_wait_time(1 - Global.current_level / 10)
		pass 
	
	if Global.game_is_over:
		return
	
	if Global.count_gifts_lost != Global.count_gifts_start:
		var current_house = get_node(String(arr_house[randi_range(0,arr_house.size() - 1)]))
		create_goblin(current_house.position)
	pass # Replace with function body.
