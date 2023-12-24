extends CanvasLayer

func _on_button_return_pressed():
	if Global.is_hardcore:
		GlobalLevels.hardcore_levels += 1
		pass
	else:
		if Global.current_level == GlobalLevels.levels:
			GlobalLevels.levels += 1
			Global.current_level += 1
		pass
		
		
	Global.count_gifts_lost = 0 
	Global.targets_for_goblins.slice(0, 3)
	
	if Global.current_level != 4:
		get_tree().change_scene_to_file("res://scenes/levels/levels.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")
	pass # Replace with function body.
