class_name Rings extends Node3D

@export var rings: Array[RaceRing]

func _ready() -> void:

	
	rings[0].set_color.emit(RaceRing.CURRENT)
	rings[1].set_color.emit( RaceRing.NEXT)
	rings[len(rings)-1].set_color.emit( RaceRing.FINISH)
	

	for i in rings:
		i.player_passed.connect(ring_entered)
	
func ring_entered(col: RaceRing):
	if col.current_color == RaceRing.CURRENT and len(rings) > 2:
		rings[1].set_color.emit(RaceRing.CURRENT)
		if len(rings) > 2 and rings[-1] != rings[2]:
			rings[2].set_color.emit(RaceRing.NEXT)
		
		rings[0].queue_free()
		rings.remove_at(0)
	elif col.current_color == RaceRing.CURRENT and len(rings) == 2:
		rings[0].queue_free()
		rings.remove_at(0)
	elif col.current_color == RaceRing.FINISH and len(rings) == 1:
		print("win")
		rings[0].queue_free()
	else:
		
		print("wrong")
		
		
