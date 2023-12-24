extends Node2D

@export var anvils: Node2D 
@export var anvil: PackedScene
@export var canvas_message: CanvasLayer

func _input(event):
	if event.is_action_pressed("click"):
		var new_anvil = anvil.instantiate()
		new_anvil.get_node("AnimationPlayer").play("idle")
		new_anvil.position = get_global_mouse_position()
		anvils.add_child(new_anvil)
		pass
	pass


func _on_main_show_message():
	canvas_message.show_message()
	pass # Replace with function body.
