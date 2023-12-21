extends CharacterBody2D

var direction: Vector2
var current_pos: Vector2
var start_pos: Vector2
var current_gift: StaticBody2D
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
	#print(current_gift)
	#print("self.position: %s" % self.position)
	#print("current_pos: %s" % current_pos)
	
	if not stay:
		if self.position != current_pos:
			self.position -= direction
		pass
		
func _go_to(pos):
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position" ,pos, 2)
	pass


func _on_area_2d_body_entered(body):
	#print(body == current_gift)

	if body == current_gift and has_target:
		$Gift.texture = body.get_node("Sprite").texture
		body.queue_free()
		_go_to(get_parent().global_position)
		has_target = false
		current_gift = null
		
	#print(body)
	
	if body.get_parent() == get_parent() and not has_target:
		stay = false
		queue_free()
#		вычисляю какой это был подарок, и возвращаю значение
#		удаляю эльфа

		#print("Я дома")
		pass
	pass # Replace with function body.
