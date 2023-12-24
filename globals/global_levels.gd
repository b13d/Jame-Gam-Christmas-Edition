extends Node

var hardcore_levels = 1
var levels = 1



var level_settings = {
	"level01": {
	"time": 20,
	"count_gift": 9	
	},
	"level02": {
	"time": 40,
	"count_gift": 7	
	},
	"level03": {
	"time": 60,
	"count_gift": 5	
	},
	"level04": {
	"time": 90,
	"count_gift": 3	
	},
}


var hardcore_level_settings = {
	"level01": {
	"time": 20,
	"count_gift": 1	
	},
	"level02": {
	"time": 40,
	"count_gift": 1	
	},
	"level03": {
	"time": 60,
	"count_gift": 1	
	},
	"level04": {
	"time": 90,
	"count_gift": 1	
	},
}

func set_settings_on_level(number_level, is_hardcore):
	if is_hardcore:
		Global.is_hardcore = true
		pass
	else:
		Global.is_hardcore = false
		Global.time = level_settings["level0%s" % number_level].time
		Global.count_gifts = level_settings["level0%s" % number_level].count_gift
		Global.count_gifts_start = level_settings["level0%s" % number_level].count_gift
		pass
	pass
