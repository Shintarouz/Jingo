extends Node2D

#
#func _ready() -> void:
	#if randi() % 2 == 0:
		#$TextureRect.texture = load("res://GameFiles/wood.png")
	#else:
		#$TextureRect.texture = load("res://GameFiles/wood_packets.png")
		##$TextureRect.texture= load("res://lessons/items/potion.png")
var type_value: int
var item_name
var item_quantity

func _ready():
	type_value = randi() % 4
	updateTextures()

func updateTextures():
	if type_value == 0:
		item_name = "Wood Log"
	elif type_value == 1:
		item_name = "Wooden Packets"
	elif type_value == 2:
		item_name = "Other Item"
	elif type_value == 3:
		item_name = "Rock"
	
	$TextureRect.texture = load("res://GameFiles/item_icons/" + item_name + ".png")

	#item_quantity = randi() % stack_size + 1
	
	#if stack_size == 1:
		#$Label.visible = false
	#else:
		#$Label.text = str(item_quantity)

#func add_item_quantity(amount_to_add):
	#item_quantity += amount_to_add
	#$Label.text = str(item_quantity)
#
#func decrease_item_quantity(amount_to_remove):
	#item_quantity -= amount_to_remove
	#$Label.text = str(item_quantity)



func _on_timer_timeout():
	print("+5")
	JsonData.WoodCount += 5
	print(JsonData.WoodCount)
