extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game_is_over = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_return_pressed():
	if get_parent() == get_node("/root"):
		get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")
	else:
		get_parent().get_child(0).visible = true
		get_parent().get_child(1).call_deferred("queue_free")
	pass # Replace with function body.


func _on_button_levels_pressed(id_level):
	Global.game_is_over = false
	Global.count_gifts_lost = 0
	
	Global.current_level = id_level
	GlobalLevels.set_settings_on_level(id_level, false)
	#print(GlobalLevels.level_settings["level0%s" % id_level].count_gift)
	Global.start_level(GlobalLevels.level_settings["level0%s" % id_level].count_gift)
	
	get_tree().change_scene_to_file("res://scenes/levels/level_0%s.tscn" % id_level)
	print(id_level)
	pass # Replace with function body.



func _on_button_hardcore_levels_pressed(id_hardcore_level):
	print(id_hardcore_level)
	pass # Replace with function body.
