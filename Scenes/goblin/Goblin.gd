extends CharacterBody2D

@onready var nav = $NavigationAgent2D
var target = Vector2.ZERO
var target2 = Vector2.ZERO

var was_hit := false

func _ready():
	$AnimationPlayer.play("idle")

func _physics_process(delta):
	#if Input.is_action_just_pressed("click"):
		#target = get_global_mouse_position()
		#nav.target_position = target

	var direction = (nav.get_next_path_position() - global_position).normalized()
	
	#print(direction)
	
	if direction.x < 0:
		$Goblin_Icon.flip_h = true
	else:
		$Goblin_Icon.flip_h = false
	
	if not was_hit:	
		translate(direction * 100 * delta)


func _on_area_2d_area_entered(area):
	if area.is_in_group("anvil") and not area.was_hit and not was_hit:
		was_hit = true
		$AnimationPlayer.play("hit")
		await get_tree().create_timer(1).timeout
		was_hit = false
		$AnimationPlayer.play("idle")
		pass
	
	elif area.is_in_group("entrance"):
		nav.target_position = target2
		$Gift_Icon.visible = true
		
		


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
