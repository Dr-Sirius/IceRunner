extends CharacterBody3D

signal passed_ring

# PreLoad
@onready var gravity: float =  ProjectSettings.get_setting("physics/3d/default_gravity")

@export var race_path: Array[RaceRing]

@export var speed: float = 5
@export var sprint_speed: float = 5

# Export/Speed
@export var air_move_speed:float = 600.0
# Export/HeadBob
# Export/Acceleration
@export var air_accel: float = 800.0
@export var ground_accel: float = 14.0
# Export/Misc
@export var ground_decel: float = 10.0
@export var ground_friction: float = 6.0
@export var air_cap: float = 0.85
@export var auto_behop: bool = true


var desire_dir: Vector3 = Vector3.ZERO
var base_speed: float = 7
var current_speed: float = base_speed
var current_point: int = 0

func _ready():
	base_speed = randf_range(1,speed*2)
	#ground_accel = randf_range(ground_accel/2,ground_accel*2)
	print(base_speed)
	velocity.y = 0
	passed_ring.connect(
	func():
		current_point+=1
		)
	#camera.fov = Config.config_file.get_value("VideoSettings","Fov")

func _physics_process(delta: float) -> void:
	var dir_to: Vector3
	
	if current_point == len(race_path):
	
		dir_to = Vector3.ZERO
		ground_friction  = 0.01
	else:
		
		dir_to = global_position.direction_to(race_path[current_point].global_position)
	
	current_speed = base_speed
	desire_dir = global_transform.basis * Vector3(randf_range(dir_to.x-0.3,dir_to.x+0.3),0,randf_range(dir_to.z-0.1,dir_to.z+0.1))
	
	if is_on_floor():
		
		handle_ground_physics(delta)
	else:
		handle_air_physics(delta)

	move_and_slide()

func handle_ground_physics(delta) -> void:

	
	var cur_speed_in_d_dir: float = velocity.dot(desire_dir)
	var add_speed_untill_cap = current_speed - cur_speed_in_d_dir
	if add_speed_untill_cap > 0:
		var accel_speed = ground_accel * delta * current_speed
		accel_speed = min(accel_speed,add_speed_untill_cap)
		velocity += accel_speed * desire_dir
	
	var control_decel: float = max(velocity.length(),ground_decel)
	var drop_decel: float = control_decel * ground_friction * delta
	var new_speed:float = max(velocity.length() - drop_decel, 0.0)
	if velocity.length() > 0:
		new_speed /= velocity.length()
	velocity *= new_speed
	
	#headbob(delta)
	
func handle_air_physics(delta) -> void:
	velocity.y -= gravity * delta
	# just_on_ground is meant to allow late jumping

		
			
	
	var cur_speed_in_d_dir: float = velocity.dot(desire_dir)
	var capped_speed = min((air_move_speed * desire_dir).length(), air_cap)
	var add_speed_untill_cap = capped_speed - cur_speed_in_d_dir
	
	if add_speed_untill_cap > 0:
		var accel_speed = air_accel * air_move_speed * delta
		accel_speed = min(accel_speed,add_speed_untill_cap)
		velocity += accel_speed * desire_dir
	
func handle_ground_dash(delta):
	var cur_speed_in_d_dir: float = velocity.dot(desire_dir)
	var add_speed_untill_cap = current_speed - cur_speed_in_d_dir
	#if Input.is_action_just_pressed("move_dash") and dash_timer.is_stopped():
		#
		#dash_timer.start()
		#var accel_speed = ground_accel * delta * current_speed
		#accel_speed = min(accel_speed,add_speed_untill_cap)
		#velocity += (accel_speed * desire_dir * (current_speed/3) * 20) 
		
	

func handle_air_dash(delta):
	var cur_speed_in_d_dir: float = velocity.dot(desire_dir)
	var capped_speed = min((air_move_speed * desire_dir).length(), air_cap)
	var add_speed_untill_cap = capped_speed - cur_speed_in_d_dir
	
	#if Input.is_action_just_pressed("move_dash") and dash_timer.is_stopped():
		#dash_timer.start()
		#var accel_speed = air_accel * air_move_speed * delta
		##accel_speed = min(accel_speed,add_speed_untill_cap)
		#velocity += accel_speed * desire_dir * (current_speed/6) * 0.001 

func interact_with_rigidbody():
	var push_force: float = 4.0
	for i in get_slide_collision_count():
		var collider := get_slide_collision(i).get_collider()
		var collider_normal := get_slide_collision(i).get_normal()
		if collider is RigidBody3D:
			collider.apply_central_impulse(-collider_normal * push_force)
		
			
			
