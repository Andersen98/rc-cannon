extends Sprite2D

signal shoot(bullet, rotation, direction, location)

var Bullet = preload("res://bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var direction = get_global_mouse_position()-global_position
			shoot.emit(Bullet, rotation, direction, position)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
		
