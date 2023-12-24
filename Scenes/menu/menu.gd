extends Control

var win_creators = preload("res://scenes/creators/creators.tscn")
var win_levels = preload("res://scenes/levels/levels.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_creators_pressed():
	$Menu_Elements.visible = false
	add_child(win_creators.instantiate())
	pass # Replace with function body.


func _on_button_start_pressed():
	$Menu_Elements.visible = false
	add_child(win_levels.instantiate())
	pass # Replace with function body.
