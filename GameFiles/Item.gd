extends Node2D

var type_value: int
var item_name
var item_quantity
var production_item
var amount : int
var production_speed : int

func _ready():
	type_value = randi() % 6
	updateTextures()

func updateTextures():
	if type_value == 0:
		item_name = "Wood Log"
		production_item = 0
		production_speed = 3
		_on_timer_timeout()
	elif type_value == 1:
		item_name = "Wooden Packets"
		production_item = 0
		production_speed = 3
		_on_timer_timeout()
	elif type_value == 2:
		item_name = "Other Item"
		production_item = 2
		production_speed = 5
		_on_timer_timeout()
	elif type_value == 3:
		item_name = "Rock"
		production_item = 1
		production_speed = 5
		_on_timer_timeout()
	elif type_value == 4:
		item_name = "Rocks 2"
		production_item = 1
		production_speed = 5
		_on_timer_timeout()
	elif type_value == 5:
		item_name = "Rocks 3"
		production_item = 1
		production_speed = 5
		_on_timer_timeout()

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
	if production_item == 0:
		JsonData.WoodCount += production_speed
		#print(str(production_speed) + "wood")
	if production_item == 1:
		JsonData.RockCount += production_speed
		#print(str(production_speed) + "rock")
	if production_item == 2:
		JsonData.VoidCount += production_speed
		#print(str(production_speed) + "void")
