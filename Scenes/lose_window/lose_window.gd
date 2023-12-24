extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#var count_gifts_start = 0
#var count_gifts = 0
#var count_gifts_lost = 0

func _on_button_retry_pressed():
	Global.game_is_over = false
	Global.count_gifts = Global.count_gifts_start
	Global.count_gifts_lost = 0
	Global.time = GlobalLevels.level_settings["level0%s" % Global.current_level].time
	Global.start_level(123)
	
	get_tree().change_scene_to_file("res://scenes/levels/level_0%s.tscn" % Global.current_level)
	pass # Replace with function body.


func _on_button_go_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")
	pass # Replace with function body.
