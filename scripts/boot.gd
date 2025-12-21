extends Control

@onready var main_menu: PackedScene = load("res://UI/main_menu.tscn")
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("boot")
	await animation_player.animation_finished
	get_tree().change_scene_to_packed(main_menu)
