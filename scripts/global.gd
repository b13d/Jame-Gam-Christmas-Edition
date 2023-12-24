extends Node

var time := 0
var gifts := {
	"red": 3,
	"yellow": 3,
	"blue": 3
}

var targets_for_goblins = []

var count_gifts = 9
var count_gifts_lost = 0

var arr_gift_ui = []

@onready var canvas_message = get_node("/root/Main")

func _ready():
	pass
