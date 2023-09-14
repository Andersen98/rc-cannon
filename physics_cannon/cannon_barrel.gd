extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



@export var torque_magnitude = 300000
@export var target_angle = 10*(PI/180)
@export var angle_tick_rate = .11
var top_angle = 0.009
var delta_angle = 0.3
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (-PI < target_angle) and Input.is_action_pressed("cannon_barrel_clockwise"):
		target_angle -=angle_tick_rate
	if (target_angle < top_angle ) and Input.is_action_pressed("cannon_barrel_counter_clockwise"):
		target_angle += angle_tick_rate

		
			

func _integrate_forces(state):
	var torque_sign = 0
	
	var rot = state.transform.get_rotation()

	if (rot - target_angle)**2 > delta_angle**2:
		if (rot < target_angle):
			torque_sign = 1
		if rot > target_angle:
			torque_sign = -1
	state.apply_torque(torque_sign*torque_magnitude)
	
	
