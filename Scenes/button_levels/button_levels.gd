extends Button

@export var number_level := 0
@export var level_is_open := false

func _ready():
	self.text = str(number_level)
	disabled = true
	pass # Replace with function body.


func _process(delta):
	pass
