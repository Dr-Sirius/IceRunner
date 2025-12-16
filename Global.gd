extends Node

signal player_won

signal player_wrong_way

signal race_start


func _ready() -> void:
	DebugConsole.set_pause_on_open(true)
	DebugConsole.add_command("race_start", start_race,self)

func start_race():
	race_start.emit()
