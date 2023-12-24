extends Button

@export var number_level := 0

func _ready():
	self.text = str(number_level)
	pass # Replace with function body.


func _process(delta):
	pass
