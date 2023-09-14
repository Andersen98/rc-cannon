class_name Cannon extends Node



const CannonBall = preload("res://cannons/base/cannon_ball.tscn")



func _on_shoot():
	var bi = CannonBall.instantiate()
	var tip:Node2D = get_node("Barrel/Tip")
	var barrel:Area2D = get_node("Barrel")
	var pos = tip.get_global_transform()*(30*Vector2.RIGHT)
	bi.position = pos
	
	get_parent().add_child(bi)
	
	bi.linear_velocity = Transform2D(barrel.transform.x,barrel.transform.y,Vector2.ZERO)*Vector2(300.0,0.0)
	
	
	
