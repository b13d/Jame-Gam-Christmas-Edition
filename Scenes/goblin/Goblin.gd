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
		
	if not was_hit:
		self.position += direction

func _on_visible_on_screen_notifier_2d_screen_exited():
	if $Pocket.get_child_count() != 0:
		Global.count_gifts_lost += 1
		get_parent().get_parent().emit_signal("show_message")
	queue_free()

func _on_area_2d_area_entered(area):
	#print(area)
	if (area.is_in_group("anvil")):
		is_run = true
		$AnimationPlayer.play("hit")
		was_hit = true
		await get_tree().create_timer(1).timeout
		$AnimationPlayer.play("idle")
		was_hit = false
		
		if $Pocket.get_child_count() != 0:
			
			var fell_out_gift = gift.instantiate()
			fell_out_gift.get_node("Sprite").texture = $Pocket.get_child(0).get_node("Sprite").texture
			fell_out_gift.position = self.global_position
			fell_out_gift.gift_id = $Pocket.get_child(0).gift_id
			
			fell_out_gift.target_pos_for_goblins = self.global_position
			Global.targets_for_goblins.append(self.global_position)
			get_node("/root/Main/Gifts").add_child(fell_out_gift)
			
			#print(get_parent().position)
			if $Pocket.get_child_count() > 0:
				$Pocket.get_child(0).queue_free()
		pass
	
	elif (area.is_in_group("entrance") or area.is_in_group("gift")) and $Pocket.get_child_count() == 0:
		if check_count_gifts(area):
			if not is_run:
				if area.is_in_group("gift"):
					destory_gift_on_ground(area)
				else:
					create_gift(area)
			pass
	pass # Replace with function body.

func create_gift(area):
	var index = 0
	var count_gifts = []
	Global.count_gifts -= 1
	
	for i in Global.gifts:
		#print(Global.gifts[i])
		if Global.gifts[i] > 0:
			count_gifts.append(index)
		index += 1
	pass
	
	#print(count_gifts)
	
	if count_gifts.size() < 1:
		return
	
	var rnd_num

	if area.is_in_group("gift") and area.gift_id != null:
		rnd_num = area.gift_id
		print(rnd_num)
	else:	
		rnd_num = randi_range(0, count_gifts.size() - 1)
	
	var type_gift = Global.arr_gift_ui[count_gifts[rnd_num]]
	var new_gift = gift.instantiate()
	new_gift.was_taked = true
	new_gift.get_node("Sprite").texture = type_gift.texture
	new_gift.position = Vector2.ZERO 
	new_gift.gift_id = rnd_num
	
	subtraction_count_gift(count_gifts[rnd_num])
	
	$Pocket.call_deferred("add_child", new_gift) 
		
func subtraction_count_gift(num):
	Global.gifts[Global.gifts.keys()[num]] -= 1
	Global.arr_gift_ui[num].emit_signal("refresh_text")
	pass

func destory_gift_on_ground(old_gift):
	var new_gift = gift.instantiate()
	new_gift.get_node("Sprite").texture = old_gift.get_node("Sprite").texture
	new_gift.position = Vector2.ZERO
	new_gift.was_taked = true
	
	if old_gift.target_pos_for_goblins != null:
		delete_target_pos(old_gift.target_pos_for_goblins)
	
	
	print("old_gift.gift_id: %s"% old_gift.gift_id)
	
	new_gift.gift_id = old_gift.gift_id
	
	$Pocket.call_deferred("add_child", new_gift)
	
	old_gift.call_deferred("queue_free")
	pass

func check_count_gifts(area):
	if Global.count_gifts_lost == 9:
		return false
	if area.is_in_group("gift"):
		if area.was_taked:
			return false

	return true

	pass

var targets_pos = [Vector2.ONE, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]

func delete_target_pos(pos):
	var index_target = Global.targets_for_goblins.find(pos)
	Global.targets_for_goblins.remove_at(index_target)
	pass
