extends Node2D

@export var arr_houses := []

func _add_child():
	for i in get_children():
		arr_houses.append(i)
	pass

func _ready():
	_add_child()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
