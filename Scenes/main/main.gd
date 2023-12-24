extends Node2D

signal show_message



var music_01 = preload("res://sounds/music_game/01.1 Walking Theme.mp3")
var music_02 = preload("res://sounds/music_game/Gym Class.mp3")
@onready var musics = [music_01, music_02]
@onready var audio_music = $AudioMain

var last_music
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	last_music = randi_range(0, musics.size() - 1)
	audio_music.stream = musics[last_music]
	audio_music.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_music():
	var new_music = last_music
	
	while new_music == last_music:
		new_music = randi_range(0, musics.size() - 1) 
		pass
	
	audio_music.stream = musics[new_music]
	audio_music.play()
	last_music = new_music
	
	pass
