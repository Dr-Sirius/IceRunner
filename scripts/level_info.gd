class_name LevelInfo extends Resource

@export var name: String = ""
@export var current_level: PackedScene
@export var next_level: LevelInfo

var race_results: Array[String] = []
var race_time: String = ""
var _result_json: Dictionary

func _init() -> void:
	
	var results_json = _get_results()
	_result_json = results_json
	if results_json.has(name):
		race_results = results_json[name]["results"]
		race_time = results_json[name]["time"]
	

func _get_results() -> Dictionary:
	if not FileAccess.file_exists("user://savegame.save"):
		return {}
	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()

		# Creates the helper class to interact with JSON.
		var json = JSON.new()
	
		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		print(json.data)
		return json.data
	return {}
	
func get_results() -> Array:
	if _result_json.has(name):
		return _result_json[name]["results"]
	return []
	
func get_time():
	if _result_json.has(name):
		return _result_json[name]["time"]
	return ""
	
func save_results():
	
	LevelLoader.save_data[name] = {
		"results": race_results,
		"time": race_time
	}
	
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	
	# JSON provides a static method to serialized JSON string.
	var json_string = JSON.stringify(LevelLoader.save_data)
	

	# Store the save dictionary as a new line in the save file.
	save_file.store_line(json_string)
