extends Node2D

@export var robber : PackedScene
@onready var path_follow_2d = $Path2D/PathFollow2D
@onready var navigation_region_2d = $".."

func _ready():
	Events.send_robber_to_house.connect(create_robber)

func _process(delta):
	pass

func create_robber(pos):
	var _robber = robber.instantiate()
	path_follow_2d.progress_ratio = randf()
	_robber.global_position = path_follow_2d.global_position
	navigation_region_2d.add_child(_robber)
	_robber.nav.target_position = pos
	path_follow_2d.progress_ratio = randf()
	_robber.target2 = path_follow_2d.global_position
	#_robber.global_position = pos
	
