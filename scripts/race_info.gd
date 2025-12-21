extends Control

@onready var race_results_list: ItemList = %race_results_list
@onready var level_name: Label = %LevelName
@onready var n_rings: Label = %NRings
@onready var race_time: Label = %RaceTime

@export var countdown: Countdown


var nring_text: String = "There are _ Rings"
var prev_time: String = "Previous Time - _"
var b_mod: Color = Color(1.0, 1.0, 1.0, 0.0)
var a_mod: Color = Color(1.0, 1.0, 1.0, 1.0)


func load_results():
	var results: Array = []
	nring_text = nring_text.replace("_",str(Global.n_rings))
	if LevelLoader.current_level_info:
		results = LevelLoader.current_level_info.get_results()
		level_name.text = LevelLoader.current_level_info.name
		n_rings.text = nring_text
		prev_time = prev_time.replace("_",LevelLoader.current_level_info.get_time())
	for i in len(results):
		race_results_list.add_item(str(i+1)+":"+results[i])
	
	
	
	
	race_time.text = prev_time
	var tween = get_tree().create_tween()
	visible = true
	tween.tween_property(self,"modulate",a_mod,0.5)
	tween.stop()
	print("fin")
	tween.tween_property(self,"modulate",b_mod,0.5).set_delay(1) 
	tween.play()
	await tween.finished
	countdown.countdown()
	
	
	
	
	
