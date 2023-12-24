extends CanvasLayer

var time := 90
var winner_window = preload("res://scenes/winner_window/winner_window.tscn")


func _ready():
	time = Global.time
	$Label_Time.text = str(time)
	pass

func _on_timer_time_timeout():
	if Global.game_is_over:
		return
		
	Global.time -= 1
	time -= 1
	
	$Label_Time.text = str(time)
	
	if Global.time == 0:
		Global.game_is_over = true
		get_node("/root/Main").add_child(winner_window.instantiate())
#		Победное окно
		pass
	pass # Replace with function body.

