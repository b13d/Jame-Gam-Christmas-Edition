extends CharacterBody2D

@export var gift: PackedScene
var target = Vector2.ZERO
var place_to_out = Vector2.ZERO

var is_run := false
var was_hit := false
var goblin_taked_gift = false

var direction
var id_gift = 0


func _ready():
	$AnimationPlayer.play("idle")
	direction = (target - global_position).normalized()
	

func _physics_process(delta):

	if direction.x < 0:
		$Goblin_Icon.flip_h = true
	else:
		$Goblin_Icon.flip_h = false
	
		
	#translate(direction * 100 * delta)
	if not was_hit:
		self.position += direction



func _on_area_2d_area_entered(area):
	if area.is_in_group("anvil") and not area.was_hit and not was_hit:
		was_hit = true
		$AnimationPlayer.play("hit")
		#is_run = true
		
		if $Gift.visible == true:
			var new_gift = gift.instantiate()
			var place_gifts = get_node("/root/Main/Gifts")
			
			
			new_gift.get_node("Sprite").texture = $Gift.get_node("Sprite").texture

			new_gift.gift_id = id_gift
			new_gift.position = self.position
			place_gifts.call_deferred("add_child", new_gift)
			$Gift.visible = false
			pass
		
		await get_tree().create_timer(1).timeout
		was_hit = false
		#is_run = false
		$AnimationPlayer.play("idle")
# 		Тут другая анимация нужна, того что гоблин убегает 
# 		от стыда после потери подарка
		pass

	elif area.is_in_group("entrance") and Global.count_gifts > 0 and not goblin_taked_gift:
		direction = (place_to_out - global_position).normalized()
		
		goblin_taked_gift = true
		
		var has_gift = [] 
		
		for i in Global.gifts:
			if Global.gifts.get(i) > 0:
				has_gift.append(i)
			pass

		if has_gift.size() == 0:
			return false

		var current_gift = has_gift[randi_range(0, has_gift.size() - 1)]
		
		print(current_gift)
		
		Global.gifts[current_gift] = Global.gifts.get(current_gift) - 1
		
		#var Global.gifts.values()[randi_range(0, Global.gifts.size())] 
		for i in Global.arr_gift_ui:
			#print(i)
			i.emit_signal("refresh_text")
			pass
		
		Global.count_gifts -= 1
		
		
		if current_gift == "red":
			id_gift = 0
		elif current_gift == "yellow":
			id_gift = 1
		elif current_gift == "blue":
			id_gift = 2
		
		if $Gift != null:
			$Gift.get_node("Sprite").texture = Global.arr_gift_ui[id_gift].texture
			$Gift.visible = true
			$Gift.was_taked = true
		
		


func _on_visible_on_screen_notifier_2d_screen_exited():
	if $Gift != null and $Gift.visible:
		get_parent().get_parent().emit_signal("show_message")
	queue_free()
