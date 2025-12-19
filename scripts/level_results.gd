extends Control

@onready var race_time: Label = %Time
@onready var race_results: ItemList = %race_results_list
@onready var results_proc: Label = $"Background/Results Proc"


func _ready() -> void:
	
	Global.player_finished.connect(
		func():
			var time = Global.time
			race_results.clear()
			race_time.text = "%02d:%02d:%02d" % [time/60,fmod(time,60),fmod(time,1)*100]
			for i in len(Global.race_results):
				race_results.add_item(str(i+1) + ":"+Global.race_results[i])
			if !Global.race_fin:
				results_proc.visible = true
	)
	
	Global.race_finished.connect(
		func(results:Array[String],time:float):
			race_results.clear()
			race_time.text = "%02d:%02d:%02d" % [time/60,fmod(time,60),fmod(time,1)*100]
			for i in len(Global.race_results):
				race_results.add_item(str(i+1) + ":"+Global.race_results[i])
			print("Work")
			results_proc.visible = false
	)
