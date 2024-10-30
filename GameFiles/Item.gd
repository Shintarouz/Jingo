extends Node2D

#
#func _ready() -> void:
	#if randi() % 2 == 0:
		#$TextureRect.texture = load("res://GameFiles/wood.png")
	#else:
		#$TextureRect.texture = load("res://GameFiles/wood_packets.png")
		##$TextureRect.texture= load("res://lessons/items/potion.png")

var item_name
var item_quantity

func _ready():
	var rand_val = randi() % 3
	if rand_val == 0:
		item_name = "Wood Log"
	elif rand_val == 1:
		item_name = "Wooden Packets"
	else:
		item_name = "Other Item"
	
	$TextureRect.texture = load("res://GameFiles/item_icons/" + item_name + ".png")
	var stack_size = int(JsonData.item_data[item_name]["StackSize"])
	item_quantity = randi() % stack_size + 1
	
	if stack_size == 1:
		$Label.visible = false
	else:
		$Label.text = str(item_quantity)

func add_item_quantity(amount_to_add):
	item_quantity += amount_to_add
	$Label.text = str(item_quantity)

func decrease_item_quantity(amount_to_remove):
	item_quantity -= amount_to_remove
	$Label.text = str(item_quantity)
