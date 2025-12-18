@tool
extends Path3D

@export_tool_button("Gen Rings") var gen_rings_action: Callable = gen_rings

func gen_rings():
	var rings = load("res://RaceRing.tscn")
	for i in curve.point_count:
		var ring:RaceRing = rings.instantiate()
		ring.position = curve.get_point_position(i)
		add_child(ring)
		ring.owner = get_tree().edited_scene_root
		
		
	for c in curve.point_count-1:
		get_child(c).look_at(get_child(c+1).global_position)
		
