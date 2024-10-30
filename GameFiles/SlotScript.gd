extends Panel


# Called when the node enters the scene tree for the first time.
var testnumber

var default_tex = preload("res://GameFiles/tile_grass_normal.png")
var default_tex2 = preload("res://GameFiles/tile_grass_cracked.png")
var empty_tex = preload("res://GameFiles/tile_grass_normal.png")

var default_style: StyleBoxTexture = null
var default_style2: StyleBoxTexture = null
var empty_style: StyleBoxTexture = null

var ItemClass = preload("res://GameFiles/Item.tscn")
var item = null

func _ready() -> void:
	testnumber = randi_range(0, 2)
	default_style = StyleBoxTexture.new()
	default_style2 = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	
	default_style.texture = default_tex
	default_style2.texture = default_tex2
	empty_style.texture = empty_tex
	if randi() % 2 == 0:
		item = ItemClass.instantiate()
		add_child(item)
	refresh_style()

#func refresh_style():
	#if item == null:
		#set("theme_override_styles/panel", empty_style)
	#else:
		#set("theme_override_styles/panel", default_style)

func refresh_style():
	if testnumber == 0:
		set("theme_override_styles/panel", empty_style)
	if testnumber == 1:
		set("theme_override_styles/panel", default_style)
	if testnumber == 2:
		set("theme_override_styles/panel", default_style2)

func pickFromSlot():
	remove_child(item)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.add_child(item)
	item = null
	refresh_style()

func putIntoSlot(new_item):
	item = new_item
	item.position = Vector2.ZERO
	var inventoryNode = find_parent("Inventory")
	inventoryNode.remove_child(item)
	add_child(item)
	refresh_style()
