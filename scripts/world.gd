extends Node2D

func _ready():
	MusicController.play_music()
	
	if global.game_first_loadin == true:
		$player.position.x = global.player_start_posX
		$player.position.y = global.player_start_posY
	else:
		if global.transition_from == "cliff_side":
			$player.position.x = global.player_exit_cliffside_posX
			$player.position.y = global.player_exit_cliffside_posY
		else:
			$player.position.x = global.player_exit_plains_posX
			$player.position.y = global.player_exit_plains_posY

func _process(delta):
	if global.transition_scene_name == "cliff_side":
		change_scene_cliffside()
	else:
		change_scene_plains()

#CLIFFSIDE
#When collision entered, transition
func _on_cliffside_transition_point_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
		global.transition_scene_name = "cliff_side"

func _on_cliffside_transition_point_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false

func change_scene_cliffside():
	if global.transition_scene == true:
		if global.current_scene == "world":
			global.transition_from = global.current_scene
			get_tree().change_scene_to_file("res://scenes/cliff_side.tscn")
			global.game_first_loadin = false
			global.current_scene = "cliff_side"

#PLAINS


func _on_plains_transition_point_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
		global.transition_scene_name = "plains"


func _on_plains_transition_point_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false

func change_scene_plains():
	if global.transition_scene == true:
		if global.current_scene == "world":
			global.transition_from = global.current_scene
			get_tree().change_scene_to_file("res://scenes/plains.tscn")
			global.game_first_loadin = false
			global.current_scene = "plains"
