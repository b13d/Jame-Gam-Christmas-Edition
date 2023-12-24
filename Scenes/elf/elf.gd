extends CharacterBody2D

var direction: Vector2
var current_pos: Vector2
var start_pos: Vector2
var current_gift: Area2D
var has_target := false
var home: Node2D
var stay := false

var gift_id 
@export var speed := 5


func _input(event):	
	if event.is_action_pressed("take_gift"):
		pass
	pass

func _ready():
	home = get_parent()
	start_pos = self.position
	pass

		
func _go_to(pos):
	if Global.game_is_over:
		return
	
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
	
	#print("global_position: %s" % global_position)
	#print("pos: %s " % pos)
	if global_position.x < pos.x:
		$SprPerson.flip_h = false
	else:
		$SprPerson.flip_h = true
		
	
	tween.tween_property(self, "global_position" ,pos, time_move)
	
	#print("has_target: %s" % has_target)
	
	if not has_target:
		await get_tree().create_timer(time_move).timeout
		queue_free()
	pass



func _on_area_2d_area_entered(area):
	if area == current_gift and has_target:
		$AudioTakedGift.play()
		
		$Gift.texture = area.get_node("Sprite").texture
		gift_id = area.gift_id
		#$Gift.self_modulate = area.get_node("Sprite").self_modulate
		area.queue_free()
		_go_to(get_parent().global_position)
		has_target = false
		current_gift = null
		
		$AreaHome.set_deferred("monitoring", true)
		$AreaHome.set_deferred("monitorable", true)
	#print(body)
	
#		вычисляю какой это был подарок, и возвращаю значение
#		удаляю эльфа
		pass
	pass # Replace with function body.


func _on_area_home_area_entered(area):
	if area.get_parent() == get_parent() and not has_target:
		if gift_id == 0:
			Global.gifts["red"] += 1
	
		if gift_id == 1:
			Global.gifts["yellow"] += 1
			
		if gift_id == 2:
			Global.gifts["blue"] += 1
		
		Global.count_gifts += 1
		
		#print(Global.count_gifts)
		
		for i in Global.arr_gift_ui:
			i.emit_signal("refresh_text")
			pass
		queue_free()
	pass # Replace with function body.
