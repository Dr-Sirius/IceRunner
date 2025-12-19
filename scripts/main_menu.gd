extends Control

@onready var play: Button = $Background/Play
@onready var settings: Button = $Background/Settings
@onready var quit: Button = $Background/Quit


func _ready() -> void:
	play.pressed.connect(
		func():
			LevelLoader.start.emit()
	)
	
	quit.pressed.connect(get_tree().quit)
