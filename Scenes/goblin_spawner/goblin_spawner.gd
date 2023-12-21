extends Node2D

@export var goblin : PackedScene
@export var goblin_place: Node2D
@onready var path_follow_2d = $Path2D/PathFollow2D
@onready var navigation_region_2d = $".."

@export var arr_house: Array

func _ready():
	randomize()
	pass
	#Events.send_robber_to_house.connect(create_robber)

func _process(delta):
	pass

func create_robber(pos):
	var _goblin = goblin.instantiate()
	path_follow_2d.progress_ratio = randf()
	_goblin.global_position = path_follow_2d.global_position
	#navigation_region_2d.add_child(_goblin)
	goblin_place.add_child(_goblin)
	_goblin.nav.target_position = pos
	path_follow_2d.progress_ratio = randf()
	_goblin.target2 = path_follow_2d.global_position
	#_robber.global_position = pos
	


func _on_timer_spawn_goblin_timeout():
	var current_house = get_node(String(arr_house[randi_range(0,3)]))
	
	#print(current_house.position)
	create_robber(current_house.position)
	pass # Replace with function body.
