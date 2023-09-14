extends Node2D


@export var track_rotaion = false
@export var debug_mode = true
@export var offset = Vector2.ZERO
@export var zoom = 0.3*Vector2.ONE
@export var target: Node2D
# Called when the node enters the scene tree for the first ti

func _ready():
	assert(target.is_inside_tree(), "Target must be in the scene tree.")
	assert(target is Node2D, "Target must be or inherit from Node2D.")
	
	var old_canvas_transform = get_viewport().canvas_transform
	var new_canvas_transform = Transform2D(
		zoom.x*old_canvas_transform.x,
		zoom.y*old_canvas_transform.y,
		old_canvas_transform.origin)
	get_viewport().canvas_transform = new_canvas_transform
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var screen_center = get_viewport_transform().affine_inverse()*get_viewport_rect().get_center()
	var target_global = target.get_global_transform()
	var translated_canvas = get_viewport().canvas_transform.translated_local(-target_global.origin+screen_center)	


	get_viewport().canvas_transform = translated_canvas
	
