extends CanvasLayer

@export var time := 90



func _ready():
	Global.time = time
	$Label_Time.text = str(time)
	pass

func _on_timer_time_timeout():
	Global.time -= 1
	time -= 1
	
	$Label_Time.text = str(time)
	pass # Replace with function body.

