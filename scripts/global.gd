extends Node

var time := 0
var gifts := {
	"red": 3,
	"yellow": 3,
	"green": 3
}

var count_gifts = 9

var arr_gift_ui = []

@onready var canvas_message = get_node("/root/Main")

func _ready():
	pass
