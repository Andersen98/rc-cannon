extends Area2D

signal shoot(pos)

func _process(delta):
	var v = Input.get_vector("look_left","look_right","look_down","look_up")
	if !(v == Vector2.ZERO):
		rotation = atan2(-v.y,v.x)
		
