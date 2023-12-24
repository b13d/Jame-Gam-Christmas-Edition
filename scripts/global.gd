extends Node

var game_is_over := false
var time := 0
var gifts := {
	"red": 3,
	"yellow": 3,
	"blue": 3
}



var is_hardcore = false

var current_level = null

var targets_for_goblins = []

var count_gifts_start = 0
var count_gifts = 0
var count_gifts_lost = 0

var arr_gift_ui = []

#@onready var canvas_message = get_node("/root/Main")

func _ready():
	randomize()
	
func start_level(arg_count_gift):
	var count_gifts_now = 0
	
	var red_gifts = randi_range(0, count_gifts)
	count_gifts_now += red_gifts
	print("count_gifts_now %s" % count_gifts_now)

	var yellow_gifts = randi_range(0, count_gifts - count_gifts_now)
	count_gifts_now += yellow_gifts
	var blue_gifts = 0
	if (count_gifts_now < count_gifts):
		blue_gifts = count_gifts - count_gifts_now
		
	Global.gifts["red"] = red_gifts
	Global.gifts["yellow"] = yellow_gifts
	Global.gifts["blue"] = blue_gifts
	
	print(Global.gifts)
	pass
