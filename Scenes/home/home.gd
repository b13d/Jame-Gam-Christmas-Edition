extends Node2D

@onready var target_robbery = $target_robbery

func _on_send_robber_timeout():
	var house_entrance_position = target_robbery.global_position
	#print(house_entrance_position)
	Events.send_robber_to_house.emit(house_entrance_position)
