extends RigidBody2D

@export var torque_magnitude = 40000

func _integrate_forces(state):
	var torque_sign = 0
	
	if Input.is_action_pressed("move_right"):
		torque_sign=1
	if Input.is_action_pressed("move_left"):
		torque_sign = -1
	
	state.apply_torque(torque_magnitude*torque_sign)
	
