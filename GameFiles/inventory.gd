extends Node2D

const SlotClass = preload("res://GameFiles/SlotScript.gd")
@onready var inventory_slots = $GridContainer
var holding_item = null

func _ready() -> void:
	for inv_slot in inventory_slots.get_children():
		inv_slot.gui_input.connect(slot_gui_input.bind(inv_slot))
#		inv_slot.connect("gui_input", Callable(self, "slot_gui_inout").bind(inv_slot))

func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if holding_item != null:
				if !slot.item:
					slot.putIntoSlot(holding_item)
					holding_item = null
				else:
					var temp_item = slot.item
					slot.pickFromSlot()
					temp_item.global_position = get_global_mouse_position()
					slot.putIntoSlot(holding_item)
					holding_item = temp_item
			elif slot.item:
				holding_item = slot.item
				slot.pickFromSlot()
				holding_item.global_position = get_global_mouse_position()

func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
