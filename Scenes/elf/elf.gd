extends CharacterBody2D

var direction: Vector2
var current_pos: Vector2
var start_pos: Vector2
var current_gift: Area2D
var has_target := false
var home: Node2D
var stay := false

@export var speed := 5


func _input(event):	
	if event.is_action_pressed("take_gift"):
		pass
	pass

func _ready():
	home = get_parent()
	start_pos = self.position
	pass

func _physics_process(delta):
	pass
	#if not stay:
		#if self.position != current_pos:
			#self.position -= direction
		#pass
		
func _go_to(pos):
	var tween = get_tree().create_tween()
	
	var differenceX = (pos.x - global_position.x)**2
	var differenceY = (pos.y - global_position.y)**2
	var difference = abs(differenceX + differenceY)
	
	var time_move = 2
	
	if difference > 1000 and difference < 8000:
		time_move = 2.2
	
	if difference > 8000 and difference < 16000:
		time_move = 2.4
	
	if difference > 16000:
		time_move = 2.8
	
	#print(difference)
	
	tween.tween_property(self, "global_position" ,pos, time_move)
	
	print("has_target: %s" % has_target)
	
	if not has_target:
		await get_tree().create_timer(time_move).timeout
		queue_free()
	pass



func _on_area_2d_area_entered(area):
	
	if area == current_gift and has_target:
		$Gift.texture = area.get_node("Sprite").texture
		area.queue_free()
		_go_to(get_parent().global_position)
		has_target = false
		current_gift = null
		
		$AreaHome.set_deferred("monitoring", true)
		$AreaHome.set_deferred("monitorable", true)
	#print(body)
	
	

#		вычисляю какой это был подарок, и возвращаю значение
#		удаляю эльфа

		#print("Я дома")
		pass
	pass # Replace with function body.



func _on_area_2d_area_exited(area):
	print("aboba")
	pass # Replace with function body.


func _on_area_home_area_entered(area):
	if area.get_parent() == get_parent() and not has_target:
		queue_free()
	pass # Replace with function body.
