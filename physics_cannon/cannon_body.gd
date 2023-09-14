extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

@export var torque_magnitude = 300000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _integrate_forces(state):
	var torque_sign = 0
	if Input.is_action_pressed("cannon_body_counter_clockwise"):
		torque_sign = 1
	if Input.is_action_pressed("cannon_body_clockwise"):
		torque_sign = -1
	state.apply_torque(torque_magnitude*torque_sign)
