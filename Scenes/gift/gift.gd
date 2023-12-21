extends Area2D

var is_hover = false
var was_taked = false
var elf: PackedScene = preload("res://scenes/elf/elf.tscn")
var closest_point = {"home": null,
"point":null
}

# на эту строку будет ругаться
#@onready var houses = get_node("/root/TestScene/Houses")
@onready var houses = get_node("/root/Main/Houses")


func _input(event):
	if event.is_action_pressed("take_gift") and is_hover and not was_taked:
		was_taked = true
		
		for i in houses.get_children():
			var differenceX = (i.global_position.x - self.global_position.x)**2
			var differenceY = (i.global_position.y - self.global_position.y)**2
			var new_point = abs(differenceX + differenceY)
			
			#print(new_point)
			
			if closest_point.point == null or new_point < closest_point.point:
				closest_point.home = i
				closest_point.point = new_point
				pass
			
			#print(closest_point)
		
		var new_elf = elf.instantiate()
		new_elf.current_gift = self
		new_elf.has_target = true
		closest_point.home.add_child(new_elf)
		new_elf._go_to(self.position)
		pass
	pass

func _on_mouse_entered():
	is_hover = true

	#print("_on_mouse_entered")
	pass # Replace with function body.


func _on_mouse_exited():
	is_hover = false

	#print("_on_mouse_exited")
	pass # Replace with function body.


