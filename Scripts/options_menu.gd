extends Node2D

func _ready():
	_button_checker()
	_furigana_checker()
\
func _button_checker():
	if DictionaryData.RomajiOption == true:
		$Control2/VBoxContainer/Control2/HBoxContainer/OnButton.modulate = Color(0, 1, 0)
		$Control2/VBoxContainer/Control2/HBoxContainer/OffButton.modulate = Color(1, 0, 0)
	if DictionaryData.RomajiOption == false:
		$Control2/VBoxContainer/Control2/HBoxContainer/OffButton.modulate = Color(0, 1, 0)
		$Control2/VBoxContainer/Control2/HBoxContainer/OnButton.modulate = Color(1, 0, 0)

func _on_button_pressed() -> void:
	DictionaryData.options_check1 = false
	$ColorRect1.visible = true
	$ColorRect2.visible = false

func _on_button_2_pressed() -> void:
	DictionaryData.options_check1 = true
	$ColorRect1.visible = false
	$ColorRect2.visible = true

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")





func _on_on_button_pressed():
	DictionaryData.RomajiOption = true
	_button_checker()
func _on_off_button_pressed():
	DictionaryData.RomajiOption = false
	_button_checker()




func _on_furigana_on_button_pressed():
	DictionaryData.FuriganaMode = true
	_furigana_checker()
func _on_furigana_off_button_pressed():
	DictionaryData.FuriganaMode = false
	_furigana_checker()


func _furigana_checker():
	if DictionaryData.FuriganaMode == true:
		$Control2/VBoxContainer/Control/HBoxContainer/FuriganaOnButton.modulate = Color(0, 1, 0)
		$Control2/VBoxContainer/Control/HBoxContainer/FuriganaOffButton.modulate = Color(1, 0, 0)
	if DictionaryData.FuriganaMode == false:
		$Control2/VBoxContainer/Control/HBoxContainer/FuriganaOffButton.modulate = Color(0, 1, 0)
		$Control2/VBoxContainer/Control/HBoxContainer/FuriganaOnButton.modulate = Color(1, 0, 0)


func _on_save_pressed():
	get_tree().change_scene_to_file("res://DelFolder/save_test.tscn")
