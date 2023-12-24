extends Node2D

@onready var target_robbery = $target_robbery


func _ready():
	Global.targets_for_goblins.append(target_robbery.global_position)
	pass

func _on_send_robber_timeout():
	var house_entrance_position = target_robbery.global_position
	#print(house_entrance_position)

