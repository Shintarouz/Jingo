extends CanvasLayer
var mistakes1 = 0
var mistakes2 = 0
var check1 = false
var check2 = false
var dict
var dictCopy
var count:int
@onready var DiffPanel = get_node("Panel")

func _ready():
	ShopMenuOpenAnimation()
	_first_time_check()
	_furigana_mode()
	_game_mode_picker()
	_menu_color_picker()
	dictCopy = dict.duplicate(true)
	dictCopy.shuffle()
	$Control/QuestionControl/Label/Label.text = str(", ").join(dictCopy[0]["pronoun"])
	$Control/QuestionControl/Label.text = str(",").join(dictCopy[0]["question"])
	if DictionaryData.RomajiOption == true:
		$Control/AnswerVbox/RomajiLineEdit.visible = true
	else:
		$Control/AnswerVbox/RomajiLineEdit.visible = false

func _first_time_check():
	if DictionaryData.FirstTimeKanjiCheck == false:
		$Panel.visible = true
	if DictionaryData.FirstTimeKanjiCheck == true:
		$Panel.visible = false

func _furigana_mode():
	if DictionaryData.FuriganaMode:
		$Control/QuestionControl/Label/Label.visible = true
	if DictionaryData.FuriganaMode == false:
		$Control/QuestionControl/Label/Label.visible = false

func _on_answer_line_edit_text_submitted(new_text):
	if new_text != str(",").join(dictCopy[0]["translation"]):
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("FF0000"))
		await get_tree().create_timer(0.5).timeout
		if DictionaryData.ColorDict == 3:
			$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("940079"))
		if DictionaryData.ColorDict == 4:
			$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
		mistakes1 += 1
		if mistakes1 == 3:
			$Control/AnswerVbox/AnswerLineEdit.placeholder_text = str(",").join(dictCopy[0]["translation"])
	for translation in dictCopy[0]["translation"]:
		if new_text == translation:
			$Control/AnswerVbox/AnswerLineEdit.editable = false
			$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("74de76"))
			check1 = true
			_answer_checker()


func _on_romaji_line_edit_text_submitted(new_text):
	if new_text != str(",").join(dictCopy[0]["romaji"]):
		$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("FF0000"))
		await get_tree().create_timer(0.5).timeout
		if DictionaryData.ColorDict == 3:
			$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("940079"))
		if DictionaryData.ColorDict == 4:
			$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
		mistakes2 += 1
		if mistakes2 == 3:
			$Control/AnswerVbox/RomajiLineEdit.placeholder_text = str(",").join(dictCopy[0]["romaji"])
	for romaji in dictCopy[0]["romaji"]:
		if new_text == romaji:
			$Control/AnswerVbox/RomajiLineEdit.editable = false
			$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("74de76"))
			check2 = true
			_answer_checker()

func _answer_checker():
	if DictionaryData.RomajiOption == true:
		if check1 and check2:
			$Control/NavBarTop/ProgressBar.value += 20
			if dictCopy.size() == 1:
				DictionaryData.FirstTimeKanjiCheck = true
				_level_completer()
				mistakes1 = 0
				mistakes2 = 0
				check1 = false
				check2 = false
				get_tree().change_scene_to_file("res://Scenes/victory_screen.tscn")
			if dictCopy.size() > 1:
				check1 = false
				check2 = false
				$Control/AnswerVbox/AnswerLineEdit.editable = true
				$Control/AnswerVbox/RomajiLineEdit.editable = true
				$Control/AnswerVbox/RomajiLineEdit.placeholder_text = "Translation"
				$Control/AnswerVbox/AnswerLineEdit.placeholder_text = "Romaji"
				if DictionaryData.ColorDict == 3:
					$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("940079"))
					$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("940079"))
				if DictionaryData.ColorDict == 4:
					$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
					$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
				mistakes1 = 0
				mistakes2 = 0
				dictCopy.remove_at(0)
				$Control/QuestionControl/Label.text = str(", ").join(dictCopy[0]["question"])
				$Control/QuestionControl/Label/Label.text = str(", ").join(dictCopy[0]["pronoun"])
				$Control/AnswerVbox/AnswerLineEdit.text = ""
				$Control/AnswerVbox/RomajiLineEdit.text = ""
	if DictionaryData.RomajiOption == false:
		if check1:
			$Control/NavBarTop/ProgressBar.value += 20
			if dictCopy.size() == 1:
				_level_completer()
				DictionaryData.FirstTimeKanjiCheck = true
				print(DictionaryData.FirstTimeKanjiCheck)
				mistakes1 = 0
				check1 = false
				get_tree().change_scene_to_file("res://Scenes/victory_screen.tscn")
			if dictCopy.size() > 1:
				$Control/AnswerVbox/AnswerLineEdit.editable = true
				$Control/AnswerVbox/AnswerLineEdit.placeholder_text = "猫"
				if DictionaryData.ColorDict == 3:
					$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("940079"))
				if DictionaryData.ColorDict == 4:
					$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
				mistakes1 = 0
				dictCopy.remove_at(0)
				$Control/QuestionControl/Label.text = str(", ").join(dictCopy[0]["question"])
				$Control/AnswerVbox/AnswerLineEdit.text = ""
				check1 = false

func _level_completer():
	if DictionaryData.GameDict == 21:
		if SaveGame.KanjiCheck1 == false:
			pgbar_adder_3(10)
			coins_adder(5)
			SaveGame.KanjiCheck1 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 22:
		if SaveGame.KanjiCheck2 == false:
			pgbar_adder_3(10)
			coins_adder(5)
			SaveGame.KanjiCheck2 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 23:
		if SaveGame.KanjiCheck3 == false:
			pgbar_adder_3(10)
			coins_adder(5)
			SaveGame.KanjiCheck3 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 24:
		if SaveGame.KanjiCheck4 == false:
			pgbar_adder_3(10)
			coins_adder(5)
			SaveGame.KanjiCheck4 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 25:
		if SaveGame.KanjiCheck5 == false:
			pgbar_adder_3(10)
			coins_adder(5)
			SaveGame.KanjiCheck5 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 26:
		if SaveGame.KanjiCheck6 == false:
			pgbar_adder_3(10)
			coins_adder(5)
			SaveGame.KanjiCheck6 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 27:
		if SaveGame.KanjiCheck7 == false:
			pgbar_adder_3(10)
			coins_adder(5)
			SaveGame.KanjiCheck7 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 28:
		if SaveGame.KanjiCheck8 == false:
			pgbar_adder_3(10)
			coins_adder(5)
			SaveGame.KanjiCheck8 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 29:
		if SaveGame.KanjiCheck9 == false:
			pgbar_adder_3(10)
			coins_adder(5)
			SaveGame.KanjiCheck9 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 30:
		if SaveGame.KanjiCheck10 == false:
			pgbar_adder_3(10)
			coins_adder(5)
			SaveGame.KanjiCheck10 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 31:
		if SaveGame.VocabCheck1 == false:
			pgbar_adder_4(10)
			coins_adder(5)
			SaveGame.VocabCheck1 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 32:
		if SaveGame.VocabCheck2 == false:
			pgbar_adder_4(10)
			coins_adder(5)
			SaveGame.VocabCheck2 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 33:
		if SaveGame.VocabCheck3 == false:
			pgbar_adder_4(10)
			coins_adder(5)
			SaveGame.VocabCheck3 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 34:
		if SaveGame.VocabCheck4 == false:
			pgbar_adder_4(10)
			coins_adder(5)
			SaveGame.VocabCheck4 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 35:
		if SaveGame.VocabCheck5 == false:
			pgbar_adder_4(10)
			coins_adder(5)
			SaveGame.VocabCheck5 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 36:
		if SaveGame.VocabCheck6 == false:
			pgbar_adder_4(10)
			coins_adder(5)
			SaveGame.VocabCheck6 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 37:
		if SaveGame.VocabCheck7 == false:
			pgbar_adder_4(10)
			coins_adder(5)
			SaveGame.VocabCheck7 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 38:
		if SaveGame.VocabCheck8 == false:
			pgbar_adder_4(10)
			coins_adder(5)
			SaveGame.VocabCheck8 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 39:
		if SaveGame.VocabCheck9 == false:
			pgbar_adder_4(10)
			coins_adder(5)
			SaveGame.VocabCheck9 = true
			SaveGame.save()
		else:
			coins_adder(1)

	if DictionaryData.GameDict == 40:
		if SaveGame.VocabCheck10 == false:
			pgbar_adder_4(10)
			coins_adder(5)
			SaveGame.VocabCheck10 = true
			SaveGame.save()
		else:
			coins_adder(1)

func coins_adder(amount):
	print("coins" + amount)
	SaveGame.Coins += amount

func pgbar_adder_3(amount):
	DictionaryData.ProgressBarValue3 += amount

func pgbar_adder_4(amount):
	DictionaryData.ProgressBarValue4 += amount

func _game_mode_picker():
# TODO: moet nog verandert worden naar kanji!!
	if DictionaryData.GameDict == 21:
		dict = DictionaryData.NOZW
	if DictionaryData.GameDict == 22:
		dict = DictionaryData.weekdays
	if DictionaryData.GameDict == 23:
		dict = DictionaryData.hira_sashisuseso
	if DictionaryData.GameDict == 24:
		dict = DictionaryData.hira_tachitsuteto
	if DictionaryData.GameDict == 25:
		dict = DictionaryData.hira_naninuneno
	if DictionaryData.GameDict == 26:
		dict = DictionaryData.hira_hahifuheho
	if DictionaryData.GameDict == 27:
		dict = DictionaryData.hira_mamimumemo
	if DictionaryData.GameDict == 28:
		dict = DictionaryData.hira_yayuyo
	if DictionaryData.GameDict == 29:
		dict = DictionaryData.hira_rarirurero
	if DictionaryData.GameDict == 30:
		dict = DictionaryData.hira_wanwo
	if DictionaryData.GameDict == 31:
		dict = DictionaryData.kata_aiueo
	if DictionaryData.GameDict == 32:
		dict = DictionaryData.kata_kakikukeko
	if DictionaryData.GameDict == 33:
		dict = DictionaryData.kata_sashisuseso
	if DictionaryData.GameDict == 34:
		dict = DictionaryData.kata_tachitsuteto
	if DictionaryData.GameDict == 35:
		dict = DictionaryData.kata_naninuneno
	if DictionaryData.GameDict == 36:
		dict = DictionaryData.kata_hahifuheho
	if DictionaryData.GameDict == 37:
		dict = DictionaryData.kata_mamimumemo
	if DictionaryData.GameDict == 38:
		dict = DictionaryData.kata_yayuyo
	if DictionaryData.GameDict == 39:
		dict = DictionaryData.kata_rarirurero
	if DictionaryData.GameDict == 40:
		dict = DictionaryData.kata_wanwo

func _menu_color_picker():
	if DictionaryData.ColorDict == 3: 
		var StyleBoxKanjiN = load("res://Assets/Tres/KanjiButtons/Kanji_Button_Normal.tres")
		var StyleBoxKanjiH = load("res://Assets/Tres/KanjiButtons/Kanji_Button_Hover.tres")
		var StyleBoxKanjiP = load("res://Assets/Tres/KanjiButtons/Kanji_Button_Pressed.tres")
		var StyleBoxKanjiGradient = load("res://Assets/Tres/KanjiButtons/Kanji_Gradient.tres")
		var StyleBoxKanjiProgressbarBg = load("res://Assets/Tres/KanjiButtons/Kanji_Progressbar_Bg.tres")
		var StyleBoxKanjiProgressbarFill = load("res://Assets/Tres/KanjiButtons/Kanji_Progressbar_Fill.tres")
		$Control/NavBarBottom.add_theme_stylebox_override("panel" ,StyleBoxKanjiGradient)
		$Control/NavBarTop.add_theme_stylebox_override("panel" ,StyleBoxKanjiGradient)
		$Control/NavBarTop/ProgressBar.set("theme_override_styles/background", StyleBoxKanjiProgressbarBg)
		$Control/NavBarTop/ProgressBar.set("theme_override_styles/fill", StyleBoxKanjiProgressbarFill)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("normal", StyleBoxKanjiN)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("hover", StyleBoxKanjiH)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("pressed", StyleBoxKanjiP)
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_color",Color("940079"))
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_pressed_color",Color("940079"))
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_hover_color",Color("940079"))
		$Control/QuestionControl/Label.add_theme_stylebox_override("normal", StyleBoxKanjiN)
		$Control/QuestionControl/Label.set("theme_override_colors/font_color",Color("940079"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_pressed_color",Color("940079"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_hover_color",Color("940079"))
		$Control/AnswerVbox/AnswerLineEdit.add_theme_stylebox_override("normal", StyleBoxKanjiN)
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("940079"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_selected_color",Color("940079"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_placeholder_color",Color("94007949"))
		$Control/AnswerVbox/AnswerLineEdit.add_theme_stylebox_override("read_only", StyleBoxKanjiN)
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_uneditable_color",Color("74de76"))
		$Control/AnswerVbox/RomajiLineEdit.add_theme_stylebox_override("normal", StyleBoxKanjiN)
		$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("940079"))
		$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_selected_color",Color("940079"))
		$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_placeholder_color",Color("94007949"))
		$Control/AnswerVbox/RomajiLineEdit.add_theme_stylebox_override("read_only", StyleBoxKanjiN)
		$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_uneditable_color",Color("74de76"))
		$Control/QuestionControl/Label/Label.set("theme_override_colors/font_color",Color("940079"))
	if DictionaryData.ColorDict == 4:
		var StyleBoxVocabN = load("res://Assets/Tres/VocabButtons/Vocab_Button_Normal.tres")
		var StyleBoxVocabH = load("res://Assets/Tres/VocabButtons/Vocab_Button_Hover.tres")
		var StyleBoxVocabP = load("res://Assets/Tres/VocabButtons/Vocab_Button_Pressed.tres")
		var StyleBoxVocabGradient = load("res://Assets/Tres/VocabButtons/Vocab_Gradient.tres")
		var StyleBoxVocabProgressbarBg = load("res://Assets/Tres/VocabButtons/Vocab_Progressbar_Bg.tres")
		var StyleBoxVocabProgressbarFill = load("res://Assets/Tres/VocabButtons/Vocab_Progressbar_Fill.tres")
		$Control/NavBarTop.add_theme_stylebox_override("panel" ,StyleBoxVocabGradient)
		$Control/NavBarBottom.add_theme_stylebox_override("panel" ,StyleBoxVocabGradient)
		$Control/NavBarTop/ProgressBar.set("theme_override_styles/background", StyleBoxVocabProgressbarBg)
		$Control/NavBarTop/ProgressBar.set("theme_override_styles/fill", StyleBoxVocabProgressbarFill)
		$Control/QuestionControl/Label.add_theme_stylebox_override("normal", StyleBoxVocabN)
		$Control/AnswerVbox/AnswerLineEdit.add_theme_stylebox_override("normal", StyleBoxVocabN)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("normal", StyleBoxVocabN)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("hover", StyleBoxVocabH)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("pressed", StyleBoxVocabP)
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_color",Color("816BB0"))
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_pressed_color",Color("816BB0"))
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_hover_color",Color("816BB0"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_color",Color("816BB0"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_pressed_color",Color("816BB0"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_hover_color",Color("816BB0"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_selected_color",Color("816BB0"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_placeholder_color",Color("816BB0"))
		$Control/QuestionControl/Label/Label.set("theme_override_colors/font_color",Color("816BB0"))


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level_Menu.tscn")


func _on_label_gui_input(event):
	if event is InputEventMouseButton:
		count += 1
		print(count)
		if count == 1:
			$Panel/Label.text = "Welcome to Kanji level 1! + Here you will find 2 answer lines + One will need the translation and the other will require the Romaji of the word."
		if count == 2:
			$Panel/Label.text = "Romaji is simply using English letters for Japanese words." + "Example : ありがとう + Translation : Thank you + Romaji : Arigatou"
		if count == 3:
			$Panel/Label.text = "test2"
		if count == 4:
			$Panel/Label.text = "test3"
		if count == 5:
			$Panel/Label.text = "test4"

func ShopMenuOpenAnimation():
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	var sprite_2d = DiffPanel
	var position = Vector2(131, 257)
	var duration = 1
	tween.tween_property(sprite_2d, "position", position, duration)
