extends Node2D
#var mergetest
#var playerobject = preload("res://DelFolder/player.tscn")

func _ready():
	pass

#func _spawn_lvl2():
	#var instance = playerobject.instantiate()
	#add_child(instance)
	#if mergetest == true:
		#mergetest = false
#
#func _on_area_2d_area_entered(area):
	#mergetest = true
	#_spawn_lvl2()
	#print(mergetest)


func _on_button_pressed():
	move_local_x(50)
	move_local_y(50)
	$Button.scale.x *= 2
	$Button.scale.y *= 2
	$Button.position.x = 100
	
