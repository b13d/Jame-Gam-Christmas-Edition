extends CharacterBody2D

@export var gift: PackedScene
var target = Vector2.ZERO
var place_to_out = Vector2.ZERO

var is_run := false
var was_hit := false

var direction

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

	elif area.is_in_group("entrance"):
		direction = (place_to_out - global_position).normalized()
		
		if $Gift != null:
			$Gift.visible = true
			$Gift.was_taked = true
		
		


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
