class_name Rings extends Node3D

@export var racers: Array[Racer]

var rings: Array[RaceRing]


func _ready() -> void:
	
	for c in get_children():
		rings.append(c)
	Global.n_rings = len(rings)
	rings[0].set_color.emit(RaceRing.CURRENT)
	rings[1].set_color.emit( RaceRing.NEXT)
	rings[len(rings)-1].set_color.emit( RaceRing.FINISH)
	

	for i in rings:
		i.player_passed.connect(ring_entered)
		i.racer_passed.connect(
		func(racer:String):
			if i == rings[len(rings)-1]:
				Global.race_results.append(racer)
			Global.rings_passed+=1
	)
	
func ring_entered(col: RaceRing):
	if col.current_color == RaceRing.CURRENT and len(rings) > 2:
		rings[1].set_color.emit(RaceRing.CURRENT)
		if len(rings) > 2 and rings[-1] != rings[2]:
			rings[2].set_color.emit(RaceRing.NEXT)
		
		rings[0].visible = false
		rings.remove_at(0)
		Global.rings_passed += 1
	elif col.current_color == RaceRing.CURRENT and len(rings) == 2:
		rings[0].visible = false
		rings.remove_at(0)
	elif col.current_color == RaceRing.FINISH and len(rings) == 1:
		
		Global.race_results.append("Player")
		Global.player_finished.emit()
		rings[0].visible = false
		Global.rings_passed += 1
	else:
		
		Global.player_wrong_way.emit()
		
		
