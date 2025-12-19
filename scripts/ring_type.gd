extends Control

@export var LevelResults: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.player_wrong_way.connect(
		func():
			$Wrong.visible = true
			await get_tree().create_timer(1).timeout
			$Wrong.visible = false
	)
	
	Global.player_finished.connect(
		func():
			if Global.race_results[0] == "Player":
				$Win.visible = true
				await get_tree().create_timer(1).timeout
				var tween = get_tree().create_tween()
				tween.tween_property($Win,"modulate",Color(1.0, 1.0, 1.0, 0.0),0.5)
				await tween.finished
				$Win.visible = false
					
			else:
				$Lose.visible = true
				await get_tree().create_timer(0.8).timeout
				var tween = get_tree().create_tween()
				tween.tween_property($Lose,"modulate",Color(1.0, 1.0, 1.0, 0.0),0.5)
				await tween.finished
				$Lose.visible = false
			
			 
			
			LevelResults.visible = true
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			if !Global.race_fin:
				await Global.race_finished
			get_tree().paused = true
			
			
	)
