extends CanvasLayer
var mistakes1 = 0
var mistakes2 = 0
var check1 = false
var check2 = false
var dict
var dictCopy
var count:int

func _ready():
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
		if DictionaryData.KanjiCheck1 == false:
			DictionaryData.ProgressBarValue3 +=10
			DictionaryData.Coins += 5
			DictionaryData.KanjiCheck1 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 22:
		if DictionaryData.KanjiCheck2 == false:
			DictionaryData.ProgressBarValue3 +=10
			DictionaryData.Coins += 5
			DictionaryData.KanjiCheck2 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 23:
		if DictionaryData.KanjiCheck3 == false:
			DictionaryData.ProgressBarValue3 +=10
			DictionaryData.Coins += 5
			DictionaryData.KanjiCheck3 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 24:
		if DictionaryData.KanjiCheck4 == false:
			DictionaryData.ProgressBarValue3 +=10
			DictionaryData.Coins += 5
			DictionaryData.KanjiCheck4 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 25:
		if DictionaryData.KanjiCheck5 == false:
			DictionaryData.ProgressBarValue3 +=10
			DictionaryData.Coins += 5
			DictionaryData.KanjiCheck5 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 26:
		if DictionaryData.KanjiCheck6 == false:
			DictionaryData.ProgressBarValue3 +=10
			DictionaryData.Coins += 5
			DictionaryData.KanjiCheck6 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 27:
		if DictionaryData.KanjiCheck7 == false:
			DictionaryData.ProgressBarValue3 +=10
			DictionaryData.Coins += 5
			DictionaryData.KanjiCheck7 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 28:
		if DictionaryData.KanjiCheck8 == false:
			DictionaryData.ProgressBarValue3 +=10
			DictionaryData.Coins += 5
			DictionaryData.KanjiCheck8 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 29:
		if DictionaryData.KanjiCheck9 == false:
			DictionaryData.ProgressBarValue3 +=10
			DictionaryData.Coins += 5
			DictionaryData.KanjiCheck9 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 30:
		if DictionaryData.KanjiCheck10 == false:
			DictionaryData.ProgressBarValue3 +=10
			DictionaryData.Coins += 5
			DictionaryData.KanjiCheck10 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 31:
		if DictionaryData.VocabCheck1 == false:
			DictionaryData.ProgressBarValue4 +=10
			DictionaryData.Coins += 5
			DictionaryData.VocabCheck1 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 32:
		if DictionaryData.VocabCheck2 == false:
			DictionaryData.ProgressBarValue4 +=10
			DictionaryData.Coins += 5
			DictionaryData.VocabCheck2 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 33:
		if DictionaryData.VocabCheck3 == false:
			DictionaryData.ProgressBarValue4 +=10
			DictionaryData.Coins += 5
			DictionaryData.VocabCheck3 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 34:
		if DictionaryData.VocabCheck4 == false:
			DictionaryData.ProgressBarValue4 +=10
			DictionaryData.Coins += 5
			DictionaryData.VocabCheck4 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 35:
		if DictionaryData.VocabCheck5 == false:
			DictionaryData.ProgressBarValue4 +=10
			DictionaryData.Coins += 5
			DictionaryData.VocabCheck5 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 36:
		if DictionaryData.VocabCheck6 == false:
			DictionaryData.ProgressBarValue4 +=10
			DictionaryData.Coins += 5
			DictionaryData.VocabCheck6 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 37:
		if DictionaryData.VocabCheck7 == false:
			DictionaryData.ProgressBarValue4 +=10
			DictionaryData.Coins += 5
			DictionaryData.VocabCheck7 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 38:
		if DictionaryData.VocabCheck8 == false:
			DictionaryData.ProgressBarValue4 +=10
			DictionaryData.Coins += 5
			DictionaryData.VocabCheck8 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 39:
		if DictionaryData.VocabCheck9 == false:
			DictionaryData.ProgressBarValue4 +=10
			DictionaryData.Coins += 5
			DictionaryData.VocabCheck9 = true
		else:
			DictionaryData.Coins += 1
	if DictionaryData.GameDict == 40:
		if DictionaryData.VocabCheck10 == false:
			DictionaryData.ProgressBarValue4 +=10
			DictionaryData.Coins += 5
			DictionaryData.VocabCheck10 = true
		else:
			DictionaryData.Coins += 1

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
			$Panel/Label.hide()
			$Panel/Label2.show()
		if count == 2:
			$Panel/Label2.hide()
			$Panel/Label3.show()
		if count == 3:
			$Panel/Label3.hide()
			$Panel/Label4.show()
		if count == 4:
			$Panel/Label4.hide()
			$Panel/Label5.show()
		if count == 5:
			$Panel.hide()
