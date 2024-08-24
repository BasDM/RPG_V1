extends Node2D

func _process(delta):
	if global.transition_scene_name == "world":
		change_scene_world()
	#change_scene_to_test()


#When collision entered, transition
func _on_world_transition_point_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
		global.transition_scene_name = "world"

#Not necessary, just to be sure
func _on_world_transition_point_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false

func change_scene_world():
	if global.transition_scene == true:
		if global.current_scene == "plains":
			global.transition_from = global.current_scene
			get_tree().change_scene_to_file("res://scenes/world.tscn")
			global.current_scene = "world"

#FOR WHEN NEXT SCENE IS WANTED:

#func _on_test_transition_point_body_entered(body):
	#if body.has_method("player"):
		#global.transition_scene = true
#
#
#func _on_test_transition_point_body_exited(body):
	#if body.has_method("player"):
		#global.transition_scene = false
