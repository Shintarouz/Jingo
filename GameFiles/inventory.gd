extends Node2D

const SlotClass = preload("res://GameFiles/SlotScript.gd")
const EnemyClass = preload("res://GameFiles/enemy.tscn")
@onready var inventory_slots = $GridContainer

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
				if slot.item:
					print("test1")
				if !slot.item:
					slot.putIntoSlot(holding)
					holding = null
				else:
					if holding.item_name != slot.item.item_name:
						var temp_item = slot.item
						slot.pickFromSlot()
						temp_item.global_position = get_global_mouse_position()
						slot.putIntoSlot(holding)
						holding = temp_item
						# Swaps items
					else:
						combining(slot)
			elif slot.item:
				holding = slot.item
				slot.pickFromSlot()
				holding.global_position = get_global_mouse_position()

func combining(slot):
	if slot.item.type_value == 0:
		slot.item.type_value = 1
		slot.item.updateTextures()
		holding.queue_free()
		holding = null
	elif slot.item.type_value == 1:
		slot.item.type_value = 2
		slot.item.updateTextures()
		holding.queue_free()
		holding = null
	elif slot.item.type_value == 2:
		slot.item.type_value = 3
		slot.item.updateTextures()
		holding.queue_free()
		holding = null
	else:
		slot.item.type_value = 4
		slot.item.updateTextures()

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
