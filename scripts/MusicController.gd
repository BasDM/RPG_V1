extends Node

var world_music = load("res://music/1 Adventure Begins/Adventure Begins (Loopable).wav")

func _ready():
	pass
	
func play_music():
	$Music.stream = world_music
	$Music.play()
