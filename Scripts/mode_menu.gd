extends Node2D
const file_path = "user://savegame.json"
func _on_hiragana_pressed():
	get_tree().change_scene_to_file("res://Scenes/hiragana.tscn")

func _on_katakana_pressed():
	get_tree().change_scene_to_file("res://Scenes/katakana.tscn")

func _on_button_3_pressed():
	pass # Replace with function body.

func _on_kanji_pressed():
	get_tree().change_scene_to_file("res://Scenes/kanji_menu.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_button_pressed():
	var file = FileAccess.open(file_path, FileAccess.READ)
	var result = JSON.parse_string(file.get_as_text())
	print(result)
	var check1 = result[0]
