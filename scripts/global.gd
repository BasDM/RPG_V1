extends Node

var player_current_attack = false

var current_scene = "world"
var transition_scene = false
var transition_scene_name: String = ""
var transition_from: String = ""

#Where the player should exit  when coming back from another scene
#cliffside
var player_exit_cliffside_posX = 217
var player_exit_cliffside_posY = 15
#plains
var player_exit_plains_posX = 404
var player_exit_plains_posY = 102
#global starting position (if first time)
var player_start_posX = 6
var player_start_posY = 39

var game_first_loadin = true
