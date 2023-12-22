extends TextureRect

@export var color: Color
@export var count_gift := 0
@export var gift_id := 0

signal refresh_text
#var gifts := {
	#"red": 3,
	#"yellow": 3,
	#"green": 3
#}

func _ready():
	Global.arr_gift_ui.append(self)
	
	self.self_modulate = Global.gifts.keys()[gift_id]
	count_gift = Global.gifts.values()[gift_id]
	$Label_Count.text = str(count_gift)
	pass # Replace with function body.


func _process(delta):
	pass


func _on_refresh_text():
	self.self_modulate = Global.gifts.keys()[gift_id]
	count_gift = Global.gifts.values()[gift_id]
	$Label_Count.text = str(count_gift)
	pass # Replace with function body.
