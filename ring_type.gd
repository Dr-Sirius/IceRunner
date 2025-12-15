extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.player_wrong_way.connect(
		func():
			$Wrong.visible = true
			await get_tree().create_timer(1).timeout
			$Wrong.visible = false
	)
	
	Global.player_won.connect(
		func():
			$Win.visible = true
			
	)
