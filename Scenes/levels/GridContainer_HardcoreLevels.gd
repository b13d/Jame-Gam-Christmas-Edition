extends GridContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	var id_level = 10
	
	for i in get_children():
		if id_level <= GlobalLevels.hardcore_levels:
			i.get_child(i.get_child_count() - 1).queue_free()
			i.level_is_open = true
			i.disabled = false
		id_level += 1
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
