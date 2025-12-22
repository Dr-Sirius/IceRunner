extends Button


@onready var main_menu: PackedScene = load("res://UI/main_menu.tscn")

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(main_menu)
