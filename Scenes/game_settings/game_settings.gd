extends Node2D

@export var anvils: Node2D 
@export var anvil: PackedScene

func _input(event):
	if event.is_action_pressed("click"):
		var new_anvil = anvil.instantiate()
		new_anvil.position = get_global_mouse_position()
		anvils.add_child(new_anvil)
		pass
	pass
