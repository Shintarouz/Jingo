extends Node2D
var menu_buttons: Array[Control]


func _ready():
	PopUpAnimation("Label", Vector2(0, 0), 1)
	#PopUpAnimation("Panel2", Vector2(0, -200), 1)
	menu_buttons.assign(find_children("menu_button_*"))
	_menu_color_picker()

func _menu_color_picker():
	if DictionaryData.ColorDict == 1:
		var StyleBoxHiraN = load("res://Assets/Tres/HiraButtons/Hira_Button_Normal.tres")
		var StyleBoxHiraH = load("res://Assets/Tres/HiraButtons/Hira_Button_Hover.tres")
		var StyleBoxHiraP = load("res://Assets/Tres/HiraButtons/Hira_Button_Pressed.tres")
		$Control/VBoxContainer/Label.add_theme_stylebox_override("normal", StyleBoxHiraN)
		$Control/VBoxContainer/Label.set("theme_override_colors/font_color",Color("00c6bd"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_pressed_color",Color("00c6bd"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_hover_color",Color("00c6bd"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_hover_pressed_color", Color("00c6bd"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_focus_color", Color("00c6bd"))
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
		$Control/VBoxContainer/Label.add_theme_stylebox_override("normal", StyleBoxKataN)
		$Control/VBoxContainer/Label.set("theme_override_colors/font_color",Color("158eba"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_pressed_color",Color("158eba"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_hover_color",Color("158eba"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_hover_pressed_color", Color("158eba"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_focus_color", Color("158eba"))
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
		$Control/VBoxContainer/Label.add_theme_stylebox_override("normal", StyleBoxKanjiN)
		$Control/VBoxContainer/Label.set("theme_override_colors/font_color",Color("940079"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_pressed_color",Color("940079"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_hover_color",Color("940079"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_hover_pressed_color", Color("940079"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_focus_color", Color("940079"))
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
		$Control/VBoxContainer/Label.add_theme_stylebox_override("normal", StyleBoxVocabN)
		$Control/VBoxContainer/Label.set("theme_override_colors/font_color",Color("816BB0"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_pressed_color",Color("816BB0"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_hover_color",Color("816BB0"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_hover_pressed_color", Color("816BB0"))
		$Control/VBoxContainer/Label.set("theme_override_colors/font_focus_color", Color("816BB0"))
		for btn in menu_buttons:
			btn.add_theme_stylebox_override("normal", StyleBoxVocabN)
			btn.add_theme_stylebox_override("hover", StyleBoxVocabH)
			btn.add_theme_stylebox_override("pressed", StyleBoxVocabP)
			btn.set("theme_override_colors/font_color",Color("816BB0"))
			btn.set("theme_override_colors/font_pressed_color",Color("816BB0"))
			btn.set("theme_override_colors/font_hover_color",Color("816BB0"))
			btn.set("theme_override_colors/font_hover_pressed_color", Color("816BB0"))
			btn.set("theme_override_colors/font_focus_color", Color("816BB0"))

func _on_hiragana_pressed():
	DictionaryData.TextCheck = 1
	DictionaryData.ColorDict = 1
	get_tree().change_scene_to_file("res://Scenes/Level_Menu.tscn")


func _on_katakana_pressed():
	DictionaryData.TextCheck = 2
	DictionaryData.ColorDict = 2
	get_tree().change_scene_to_file("res://Scenes/Level_Menu.tscn")
	

func _on_kanji_pressed():
	DictionaryData.TextCheck = 3
	DictionaryData.ColorDict = 3
	get_tree().change_scene_to_file("res://Scenes/Level_Menu.tscn")


func _on_vocab_pressed():
	DictionaryData.TextCheck = 4
	DictionaryData.ColorDict = 4
	get_tree().change_scene_to_file("res://Scenes/Level_Menu.tscn")


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func PopUpAnimation(panel_path: String, target_position: Vector2, duration: float = 1.0):
	var panel = get_node(panel_path)
	if panel:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_CIRC)
		tween.tween_property(panel, "position", target_position, duration)
	else:
		print("Panel node not found at path: ", panel_path)
