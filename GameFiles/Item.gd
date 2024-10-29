extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$TextureRect.texture = load("res://lessons/chest/lock.png")
	if randi() % 2 == 0:
		$TextureRect.texture = load("res://GameFiles/wood.png")
	else:
		$TextureRect.texture = load("res://GameFiles/wood_packets.png")
		#$TextureRect.texture= load("res://lessons/items/potion.png")
