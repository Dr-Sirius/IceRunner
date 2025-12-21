extends Node

const DEBUG: bool = false

signal player_finished

signal player_wrong_way

signal race_start(val:float)
signal race_finished(results:Array[String],time:float)

var race_results: Array[String] = []
var rings_passed: int = 0
var n_rings: int = 0
var race_fin: bool = false
var time: float = 0



func _ready() -> void:
	DebugConsole.set_pause_on_open(true)
	DebugConsole.add_command_setvar("race_start", start_race,self,DebugCommand.ParameterType.Float)

func _process(delta: float) -> void:
	if !race_fin:
		time += delta
	
	if rings_passed + 1 == n_rings * len(race_results) and !race_fin and rings_passed != 0:
		print(race_results)
		race_fin = true
		race_finished.emit(race_results,time)
		
		

func start_race(val:float):
	race_start.emit(val)
	race_fin = false
	race_results = []
