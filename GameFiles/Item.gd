extends Node2D

var Item_ID: int
var item_name
var item_quantity
var production_item
var amount : int
var production_speed : int

enum ITEM {WOOD_LOG, WOODEN_PACKET, OTHER_ITEM, ROCK, ROCKS_2, ROCKS_3, MINI_CHEST}

func _process(delta):
	pass

func _ready():
	#animation()
	Item_ID = randi() % 7
	updateTextures()

func updateTextures():
	match Item_ID:
		ITEM.WOOD_LOG:
			item_name = "Wood Log"
			production_item = 0
			production_speed = 3
		ITEM.WOODEN_PACKET:
			item_name = "Wooden Packets"
			production_item = 0
			production_speed = 3
		ITEM.OTHER_ITEM:
			item_name = "Other Item"
			production_item = 2
			production_speed = 5
		ITEM.ROCK:
			item_name = "Rock"
			production_item = 1
			production_speed = 5
		ITEM.ROCKS_2:
			item_name = "Rocks 2"
			production_item = 1
			production_speed = 5
		ITEM.ROCKS_3:
			item_name = "Rocks 3"
			production_item = 1
			production_speed = 5
		ITEM.MINI_CHEST:
			item_name = "Mini Chest"
			production_item = 1
			production_speed = 5
		_:
			print("Invalid item id")
			# als niks match in de lijst
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
func animation():
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	var node = get_node("TextureRect")
	var scale1 = Vector2(1.0, 1.0)
	var scale2 = Vector2(1.1, 1.1)
	var duration = 1.5
	tween.tween_property(node, "scale", scale1, duration)
	tween.tween_property(node, "scale", scale2, duration)
	tween.set_loops(-1)

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
