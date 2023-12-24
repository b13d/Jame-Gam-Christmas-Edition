extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_return_pressed():
	get_parent().get_child(0).visible = true
	get_parent().get_child(1).call_deferred("queue_free")
	pass # Replace with function body.
