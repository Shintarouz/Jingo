extends Node

var item_data: Dictionary
var WoodCount : int = 0
var RockCount : int = 0
var VoidCount : int = 0

func _ready():
	item_data = Load_data("res://Data/ItemData.json")

func Load_data(file_path : String):
	var file_data = FileAccess.get_file_as_string(file_path)
	var json_data = JSON.parse_string(file_data)
	return json_data
