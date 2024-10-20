extends Node2D
var mergetest
var playerobject = preload("res://DelFolder/player.tscn")

func _ready():
	pass

func _spawn_lvl2():
	var instance = playerobject.instantiate()
	add_child(instance)
	if mergetest == true:
		mergetest = false

func _on_area_2d_area_entered(area):
	mergetest = true
	_spawn_lvl2()
	print(mergetest)
