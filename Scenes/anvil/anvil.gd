extends Area2D

var on_ground = false

func _ready():
	$Sprite.scale = Vector2(4,4)
	$AudioAnvilDown.play()
	pass # Replace with function body.

func _physics_process(delta):
	if $Sprite.scale.x > .3:
		$Sprite.scale -= Vector2(.15,.15)
	elif not on_ground:
		$AnimationPlayer.stop()
		on_ground = true
	pass


func _on_area_entered(area):
	if area.is_in_group("goblin") and not on_ground:	
		on_ground = true
		
		area.get_parent().get_node("AnimationPlayer").play("hit")
	pass # Replace with function body.


func _on_timer_to_destroy_timeout():
	queue_free()
	pass # Replace with function body.
