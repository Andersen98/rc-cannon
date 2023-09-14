extends Area2D

@export var speed = 300
var direction = Vector2.AXIS_X


func _physics_process(delta):
	position += delta*direction.normalized()*speed

