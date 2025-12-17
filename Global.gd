extends Node

signal player_finished

signal player_wrong_way

signal race_start

var race_results: Array[String] = []
var rings_passed: int = 0
var n_rings: int = 0
var race_fin: bool = false


func _ready() -> void:
	DebugConsole.set_pause_on_open(true)
	DebugConsole.add_command("race_start", start_race,self)

func _process(delta: float) -> void:
	
	if rings_passed + 1 == n_rings * len(race_results) and !race_fin and rings_passed != 0:
		print(race_results)
		race_fin = true
		print("WON")

func start_race():
	race_start.emit()
