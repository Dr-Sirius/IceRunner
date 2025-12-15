class_name RaceRing extends Node3D

const CURRENT: Color = Color.AQUA
const NORMAL: Color = Color.WHITE
const NEXT: Color = Color(0.976, 0.692, 0.772, 1.0)
const FINISH: Color = Color.BLACK

var ring: MeshInstance3D

var current_color: Color
var shader: ShaderMaterial
signal player_passed(current_ring:RaceRing)
signal set_color(col:Color)


func _ready() -> void:
	set_color.connect(set_colorf)
	ring = $CSGBakedMeshInstance3D
	$Area3D.area_entered.connect(on_entered)
	shader = ring.get_active_material(0)
	current_color = NORMAL

func set_colorf(col:Color):
	shader.set_shader_parameter("color",col)
	current_color = col
	
func on_entered(area: Area3D):
	
	if area.is_in_group("Player"):
		
		player_passed.emit(self)
