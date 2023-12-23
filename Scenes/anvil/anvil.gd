extends Area2D

var was_hit = false

func _ready():
	$Sprite.scale = Vector2(4,4)
	$AudioAnvilDown.play()
	pass # Replace with function body.

func _physics_process(delta):
	if $Sprite.scale.x > .3:
		$Sprite.scale -= Vector2(.1,.1)
	elif not was_hit:
		was_hit = true
		await get_tree().create_timer(1).timeout
		queue_free()
	pass


func _on_area_entered(area):
	if area.is_in_group("goblin") and not was_hit:	
		was_hit = true
		
		area.get_parent().get_node("AnimationPlayer").play("hit")
	pass # Replace with function body.
