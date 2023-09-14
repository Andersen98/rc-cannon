extends RigidBody2D

@export var impulse_magnitude = 2000

@export var torque_magnitude = 30000
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _integrate_forces(state):
	var impulse_direction = Vector2.ZERO
	var torque_sign = 0
	if Input.is_action_just_pressed("jump"):
		impulse_direction = Vector2.UP
	if Input.is_action_pressed("cannon_body_clockwise"):
		torque_sign = 1
	if Input.is_action_pressed("cannon_body_counter_clockwise"):
		torque_sign = -1
	
	state.apply_torque(torque_sign*torque_magnitude)
	state.apply_central_impulse(impulse_direction*impulse_magnitude)
