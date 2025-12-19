extends Node

var current_level_info: LevelInfo

signal next_level
signal restart_level
signal start
signal main_menu


func _ready() -> void:
	
	start.connect(
		func():
			current_level_info = load("res://Levels/Level_info/level_1.tres")
			get_tree().change_scene_to_packed(current_level_info.current_level)
	)
	
	next_level.connect(
		func():
			current_level_info = current_level_info.next_level
			get_tree().change_scene_to_packed(current_level_info.current_level)
	)
	
	restart_level.connect(
		func():
			get_tree().reload_current_scene()
	)
	
	main_menu.connect(
		func():
			get_tree().change_scene_to_packed(load("res://UI/main_menu.tscn"))
	)
