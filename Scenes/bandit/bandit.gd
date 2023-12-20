extends CharacterBody2D

@onready var nav = $NavigationAgent2D
var target = Vector2.ZERO
var target2 = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_just_pressed("click"):
		target = get_global_mouse_position()
		nav.target_position = target

	var direction = -(nav.get_next_path_position() - global_position).normalized()
	translate(direction * 100 * delta)


func _on_area_2d_area_entered(area):
	if area.is_in_group("entrance"):
		nav.target_position = target2
		
		


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
