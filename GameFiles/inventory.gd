extends Node2D

var ItemClass = preload("res://GameFiles/Item.tscn")
const SlotClass = preload("res://GameFiles/SlotScript.gd")
const EnemyClass = preload("res://GameFiles/enemy.tscn")
@onready var inventory_slots = $Control/GridContainer
var item = ItemClass
var holding = null
var current_enemy = null

func _process(delta):
	pass

func _ready() -> void:
	for inv_slot in inventory_slots.get_children():
		inv_slot.gui_input.connect(slot_gui_input.bind(inv_slot))
#		inv_slot.connect("gui_input", Callable(self, "slot_gui_inout").bind(inv_slot))

#func spawn_enemy():
	#current_enemy = EnemyClass.instantiate()
	#GridContainer.add_child(current_enemy)

func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# if holding is not empty
			if holding != null: 
				# if slot is not empty
				if slot.object == item:
					print("test1")
				if !slot.object:
					slot.putIntoSlot(holding)
					holding = null
				else:
					if holding.item_name != slot.object.item_name:
						var temp_item = slot.object
						slot.pickFromSlot()
						temp_item.global_position = get_global_mouse_position()
						slot.putIntoSlot(holding)
						holding = temp_item
						# Swaps items
					else:
						combining(slot)
			elif slot.object:
				holding = slot.object
				slot.pickFromSlot()
				holding.global_position = get_global_mouse_position()

func combining(slot):
	if slot.object.Item_ID == 0:
		slot.object.Item_ID = 1
		slot.object.updateTextures()
		holding.queue_free()
		holding = null
	elif slot.object.Item_ID == 1:
		slot.object.Item_ID = 2
		slot.object.updateTextures()
		holding.queue_free()
		holding = null
	elif slot.object.Item_ID == 2:
		slot.object.Item_ID = 3
		slot.object.updateTextures()
		holding.queue_free()
		holding = null
	elif slot.object.Item_ID == 3:
		slot.object.Item_ID = 4
		slot.object.updateTextures()
		holding.queue_free()
		holding = null
	elif slot.object.Item_ID == 4:
		slot.object.Item_ID = 5
		slot.object.updateTextures()
		holding.queue_free()
		holding = null

func _input(event):
	if holding:
		holding.global_position = get_global_mouse_position()



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

#func slot_gui_input(event: InputEvent, slot: SlotClass):
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#if holding_item != null:
				#if !slot.item:
					#slot.putIntoSlot(holding_item)
					#holding_item = null
				#else:
					#var temp_item = slot.item
					#slot.pickFromSlot()
					#temp_item.global_position = get_global_mouse_position()
					#slot.putIntoSlot(holding_item)
					#holding_item = temp_item
			#elif slot.item:
				#holding_item = slot.item
				#slot.pickFromSlot()
				#holding_item.global_position = get_global_mouse_position()

						#var Level = int(JsonData.item_data[slot.item.item_name]["Level"])
						#var stack_size = int(JsonData.item_data[slot.item.item_name]["StackSize"])
						#var able_to_add = stack_size - slot.item.item_quantity
						#if able_to_add >= holding_item.item_quantity:
							#slot.item.add_item_quantity(holding_item.item_quantity)
							#holding_item.queue_free()
							#holding_item = null


func _on_button_2_pressed():
	#if DictionaryData.Coins > 5:
		#DictionaryData.Coins -= 5
		for inv_slot in inventory_slots.get_children():
			if inv_slot.object != null:
				print(inv_slot.object)
				print("item inside")
			elif inv_slot.object == null:
				inv_slot.Spawn()
				return
			elif inv_slot.object == ItemClass:
				print("item test")

		#if slot.get_child_count() == 0:
			#var item_instance = ItemClass
			#item_instance.Spawn()
			#slot.add_child(item_instance)
