extends Node2D
var menu_buttons: Array[Control]


func _ready():
	menu_buttons.assign(find_children("menu_button_*"))
	_menu_color_picker()

func _menu_color_picker():
	if DictionaryData.ColorDict == 1:
		var StyleBoxHiraN = load("res://Assets/Tres/HiraButtons/Hira_Button_Normal.tres")
		var StyleBoxHiraH = load("res://Assets/Tres/HiraButtons/Hira_Button_Hover.tres")
		var StyleBoxHiraP = load("res://Assets/Tres/HiraButtons/Hira_Button_Pressed.tres")
		for btn in menu_buttons:
			btn.add_theme_stylebox_override("normal", StyleBoxHiraN)
			btn.add_theme_stylebox_override("hover", StyleBoxHiraH)
			btn.add_theme_stylebox_override("pressed", StyleBoxHiraP)
			btn.set("theme_override_colors/font_color",Color("00c6bd"))
			btn.set("theme_override_colors/font_pressed_color",Color("00c6bd"))
			btn.set("theme_override_colors/font_hover_color",Color("00c6bd"))
			btn.set("theme_override_colors/font_hover_pressed_color", Color("00c6bd"))
			btn.set("theme_override_colors/font_focus_color", Color("00c6bd"))
	if DictionaryData.ColorDict == 2:
		var StyleBoxKataN = load("res://Assets/Tres/KataButtons/Kata_Button_Normal.tres")
		var StyleBoxKataH = load("res://Assets/Tres/KataButtons/Kata_Button_Hover.tres")
		var StyleBoxKataP = load("res://Assets/Tres/KataButtons/Kata_Button_Pressed.tres")
		for btn in menu_buttons:
			btn.add_theme_stylebox_override("normal", StyleBoxKataN)
			btn.add_theme_stylebox_override("hover", StyleBoxKataH)
			btn.add_theme_stylebox_override("pressed", StyleBoxKataP)
			btn.set("theme_override_colors/font_color",Color("158eba"))
			btn.set("theme_override_colors/font_pressed_color",Color("158eba"))
			btn.set("theme_override_colors/font_hover_color",Color("158eba"))
			btn.set("theme_override_colors/font_hover_pressed_color", Color("158eba"))
			btn.set("theme_override_colors/font_focus_color", Color("158eba"))
	if DictionaryData.ColorDict == 3:
		var StyleBoxKanjiN = load("res://Assets/Tres/KanjiButtons/Kanji_Button_Normal.tres")
		var StyleBoxKanjiH = load("res://Assets/Tres/KanjiButtons/Kanji_Button_Hover.tres")
		var StyleBoxKanjiP = load("res://Assets/Tres/KanjiButtons/Kanji_Button_Pressed.tres")
		for btn in menu_buttons:
			btn.add_theme_stylebox_override("normal", StyleBoxKanjiN)
			btn.add_theme_stylebox_override("hover", StyleBoxKanjiH)
			btn.add_theme_stylebox_override("pressed", StyleBoxKanjiP)
			btn.set("theme_override_colors/font_color",Color("940079"))
			btn.set("theme_override_colors/font_pressed_color",Color("940079"))
			btn.set("theme_override_colors/font_hover_color",Color("940079"))
			btn.set("theme_override_colors/font_hover_pressed_color", Color("940079"))
			btn.set("theme_override_colors/font_focus_color", Color("940079"))
	if DictionaryData.ColorDict == 4:
		var StyleBoxVocabN = load("res://Assets/Tres/VocabButtons/Vocab_Button_Normal.tres")
		var StyleBoxVocabH = load("res://Assets/Tres/VocabButtons/Vocab_Button_Hover.tres")
		var StyleBoxVocabP = load("res://Assets/Tres/VocabButtons/Vocab_Button_Pressed.tres")
		for btn in menu_buttons:
			btn.add_theme_stylebox_override("normal", StyleBoxVocabN)
			btn.add_theme_stylebox_override("hover", StyleBoxVocabH)
			btn.add_theme_stylebox_override("pressed", StyleBoxVocabP)
			btn.set("theme_override_colors/font_color",Color("816BB0"))
			btn.set("theme_override_colors/font_pressed_color",Color("816BB0"))
			btn.set("theme_override_colors/font_hover_color",Color("816BB0"))
			btn.set("theme_override_colors/font_hover_pressed_color", Color("816BB0"))
			btn.set("theme_override_colors/font_focus_color", Color("816BB0"))

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/mode_menu.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://GameFiles/inventory.tscn")
	#get_tree().change_scene_to_file("res://node_2d.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level_Menu.tscn")

