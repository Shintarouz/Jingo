extends CanvasLayer
var mistakes = 0
var dict
var dictCopy

func _ready():
	PopUpAnimation("Control/NavBarTop", Vector2(0, 0), 1)
	PopUpAnimation("Control/NavBarBottom", Vector2(0, 2120), 1)
	PopUpAnimationScale("Control/QuestionControl", Vector2(1, 1), 1)
	PopInAnimation("Control/AnswerVbox", Vector2(40, 1272), 1)
	_game_mode_picker()
	_menu_color_picker()
	dictCopy = dict.duplicate(true)
	dictCopy.shuffle()
	$Control/QuestionControl/Label.text = str(",").join(dictCopy[0]["question"])

func _on_answer_line_edit_text_submitted(new_text):
	if new_text != str(",").join(dictCopy[0]["answer"]):
		mistakes += 1
		#if mistakes == 3:
	if new_text == str(",").join(dictCopy[0]["answer"]) and dictCopy.size() > 0:
		FinishAnimation("Control/AnswerVbox/AnswerLineEdit", Color.GREEN, 0.5)
		$Control/NavBarTop/ProgressBar.value += 20
		$Control/AnswerVbox/AnswerLineEdit.text = ""
		mistakes = 0
		dictCopy.remove_at(0)
		if dictCopy.size() > 0:
			$Control/QuestionControl/Label.text = str(",").join(dictCopy[0]["question"])
	if dictCopy.size() == 0:
		_level_completer()
		get_tree().change_scene_to_file("res://Scenes/victory_screen.tscn")

func _level_completer():
	if DictionaryData.GameDict == 1:
		if SaveGame.HiraCheck1 == false:
			SaveGame.HiraCheck1 = true
			coins_adder(5)
			pgbar_adder_1(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 2:
		if SaveGame.HiraCheck2 == false:
			SaveGame.HiraCheck2 = true
			coins_adder(5)
			pgbar_adder_1(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 3:
		if SaveGame.HiraCheck3 == false:
			SaveGame.HiraCheck3 = true
			coins_adder(5)
			pgbar_adder_1(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 4:
		if SaveGame.HiraCheck4 == false:
			SaveGame.HiraCheck4 = true
			coins_adder(5)
			pgbar_adder_1(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 5:
		if SaveGame.HiraCheck5 == false:
			SaveGame.HiraCheck5 = true
			coins_adder(5)
			pgbar_adder_1(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 6:
		if SaveGame.HiraCheck6 == false:
			SaveGame.HiraCheck6 = true
			coins_adder(5)
			pgbar_adder_1(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 7:
		if SaveGame.HiraCheck7 == false:
			SaveGame.HiraCheck7 = true
			coins_adder(5)
			pgbar_adder_1(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 8:
		if SaveGame.HiraCheck8 == false:
			SaveGame.HiraCheck8 = true
			coins_adder(5)
			pgbar_adder_1(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 9:
		if SaveGame.HiraCheck9 == false:
			SaveGame.HiraCheck9 = true
			coins_adder(5)
			pgbar_adder_1(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 10:
		if SaveGame.HiraCheck10 == false:
			SaveGame.HiraCheck10 = true
			coins_adder(5)
			pgbar_adder_1(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 11:
		if SaveGame.KataCheck1 == false:
			SaveGame.KataCheck1 = true
			coins_adder(5)
			pgbar_adder_2(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 12:
		if SaveGame.KataCheck2 == false:
			SaveGame.KataCheck2 = true
			coins_adder(5)
			pgbar_adder_2(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 13:
		if SaveGame.KataCheck3 == false:
			SaveGame.KataCheck3 = true
			coins_adder(5)
			pgbar_adder_2(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 14:
		if SaveGame.KataCheck4 == false:
			SaveGame.KataCheck4 = true
			DictionaryData.Coins += 5
			pgbar_adder_2(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 15:
		if SaveGame.KataCheck5 == false:
			SaveGame.KataCheck5 = true
			coins_adder(5)
			pgbar_adder_2(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 16:
		if SaveGame.KataCheck6 == false:
			SaveGame.KataCheck6 = true
			coins_adder(5)
			pgbar_adder_2(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 17:
		if SaveGame.KataCheck7 == false:
			SaveGame.KataCheck7 = true
			coins_adder(5)
			pgbar_adder_2(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 18:
		if SaveGame.KataCheck8 == false:
			SaveGame.KataCheck8 = true
			coins_adder(5)
			pgbar_adder_2(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 19:
		if SaveGame.KataCheck9 == false:
			SaveGame.KataCheck9 = true
			coins_adder(5)
			pgbar_adder_2(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

	if DictionaryData.GameDict == 20:
		if SaveGame.KataCheck10 == false:
			SaveGame.KataCheck10 = true
			coins_adder(5)
			pgbar_adder_2(10)
			SaveGame.save()
		else:
			coins_adder(1)
			SaveGame.save()

func coins_adder(amount):
	print("coins given :" + str(amount))
	SaveGame.Coins += amount

func pgbar_adder_1(amount):
	SaveGame.ProgressBarValue1 += amount

func pgbar_adder_2(amount):
	SaveGame.ProgressBarValue2 += amount

func _game_mode_picker():
	
	var hiras = [
		DictionaryData.hira_aiueo,
		DictionaryData.hira_kakikukeko,
		DictionaryData.hira_sashisuseso,
		DictionaryData.hira_tachitsuteto,
		DictionaryData.hira_naninuneno,
		DictionaryData.hira_hahifuheho,
		DictionaryData.hira_mamimumemo,
		DictionaryData.hira_yayuyo,
		DictionaryData.hira_wanwo,
		DictionaryData.Test10,
		#10 - hiragana
		DictionaryData.kata_aiueo,
		DictionaryData.kata_kakikukeko,
		DictionaryData.kata_sashisuseso,
		DictionaryData.kata_tachitsuteto,
		DictionaryData.kata_naninuneno,
		DictionaryData.kata_hahifuheho,
		DictionaryData.kata_mamimumemo,
		DictionaryData.kata_yayuyo,
		DictionaryData.kata_wanwo,
	]
	
	dict = hiras[DictionaryData.GameDict - 1]

func _menu_color_picker():
	if DictionaryData.ColorDict == 1:
		var StyleBoxHiraN = load("res://Assets/Tres/HiraButtons/Hira_Button_Normal.tres")
		var StyleBoxHiraH = load("res://Assets/Tres/HiraButtons/Hira_Button_Hover.tres")
		var StyleBoxHiraP = load("res://Assets/Tres/HiraButtons/Hira_Button_Pressed.tres")
		var StyleBoxHiraGradient = load("res://Assets/Tres/HiraButtons/Hira_Gradient.tres")
		var StyleBoxHiraProgressbarBg = load("res://Assets/Tres/HiraButtons/Hira_Progressbar_Bg.tres")
		var StyleBoxHiraProgressbarFill = load("res://Assets/Tres/HiraButtons/Hira_Progressbar_Fill.tres")
		$Control/NavBarTop.add_theme_stylebox_override("panel" ,StyleBoxHiraGradient)
		$Control/NavBarBottom.add_theme_stylebox_override("panel" ,StyleBoxHiraGradient)
		$Control/NavBarTop/ProgressBar.set("theme_override_styles/background", StyleBoxHiraProgressbarBg)
		$Control/NavBarTop/ProgressBar.set("theme_override_styles/fill", StyleBoxHiraProgressbarFill)
		$Control/QuestionControl/Label.add_theme_stylebox_override("normal", StyleBoxHiraN)
		$Control/AnswerVbox/AnswerLineEdit.add_theme_stylebox_override("normal", StyleBoxHiraN)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("normal", StyleBoxHiraN)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("hover", StyleBoxHiraH)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("pressed", StyleBoxHiraP)
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_color",Color("00c6bd"))
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_pressed_color",Color("00c6bd"))
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_hover_color",Color("00c6bd"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_color",Color("00c6bd"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_pressed_color",Color("00c6bd"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_hover_color",Color("00c6bd"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("00c6bd"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_selected_color",Color("00c6bd"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_placeholder_color",Color("00c6bd34"))
	if DictionaryData.ColorDict == 2:
		var StyleBoxKataN = load("res://Assets/Tres/KataButtons/Kata_Button_Normal.tres")
		var StyleBoxKataH = load("res://Assets/Tres/KataButtons/Kata_Button_Hover.tres")
		var StyleBoxKataP = load("res://Assets/Tres/KataButtons/Kata_Button_Pressed.tres")
		var StyleBoxKataGradient = load("res://Assets/Tres/KataButtons/Kata_Gradient.tres")
		var StyleBoxKataProgressbarBg = load("res://Assets/Tres/KataButtons/Kata_Progressbar_Bg.tres")
		var StyleBoxKataProgressbarFill = load("res://Assets/Tres/KataButtons/Kata_Progressbar_Fill.tres")
		$Control/NavBarTop.add_theme_stylebox_override("panel" ,StyleBoxKataGradient)
		$Control/NavBarBottom.add_theme_stylebox_override("panel" ,StyleBoxKataGradient)
		$Control/NavBarTop/ProgressBar.set("theme_override_styles/background", StyleBoxKataProgressbarBg)
		$Control/NavBarTop/ProgressBar.set("theme_override_styles/fill", StyleBoxKataProgressbarFill)
		$Control/QuestionControl/Label.add_theme_stylebox_override("normal", StyleBoxKataN)
		$Control/AnswerVbox/AnswerLineEdit.add_theme_stylebox_override("normal", StyleBoxKataN)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("normal", StyleBoxKataN)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("hover", StyleBoxKataH)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("pressed", StyleBoxKataP)
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_color",Color("158eba"))
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_pressed_color",Color("158eba"))
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_hover_color",Color("158eba"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_color",Color("158eba"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_pressed_color",Color("158eba"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_hover_color",Color("158eba"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("158eba"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_selected_color",Color("158eba"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_placeholder_color",Color("158eba91"))
	if DictionaryData.ColorDict == 3:
		var StyleBoxKanjiN = load("res://Assets/Tres/KanjiButtons/Kanji_Button_Normal.tres")
		var StyleBoxKanjiH = load("res://Assets/Tres/KanjiButtons/Kanji_Button_Hover.tres")
		var StyleBoxKanjiP = load("res://Assets/Tres/KanjiButtons/Kanji_Button_Pressed.tres")
		var StyleBoxKanjiGradient = load("res://Assets/Tres/KanjiButtons/Kanji_Gradient.tres")
		var StyleBoxKanjiProgressbarBg = load("res://Assets/Tres/KanjiButtons/Kanji_Progressbar_Bg.tres")
		var StyleBoxKanjiProgressbarFill = load("res://Assets/Tres/KanjiButtons/Kanji_Progressbar_Fill.tres")
		$Control/NavBarTop.add_theme_stylebox_override("panel" ,StyleBoxKanjiGradient)
		$Control/NavBarBottom.add_theme_stylebox_override("panel" ,StyleBoxKanjiGradient)
		$Control/NavBarTop/ProgressBar.set("theme_override_styles/background", StyleBoxKanjiProgressbarBg)
		$Control/NavBarTop/ProgressBar.set("theme_override_styles/fill", StyleBoxKanjiProgressbarFill)
		$Control/QuestionControl/Label.add_theme_stylebox_override("normal", StyleBoxKanjiN)
		$Control/AnswerVbox/AnswerLineEdit.add_theme_stylebox_override("normal", StyleBoxKanjiN)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("normal", StyleBoxKanjiN)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("hover", StyleBoxKanjiH)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("pressed", StyleBoxKanjiP)
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_color",Color("940079"))
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_pressed_color",Color("940079"))
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_hover_color",Color("940079"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_color",Color("940079"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_pressed_color",Color("940079"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_hover_color",Color("940079"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("940079"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_selected_color",Color("940079"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_placeholder_color",Color("94007949"))
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

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level_Menu.tscn")

func PopUpAnimation(panel_path: String, target_position: Vector2, duration: float = 1.0):
	var panel = get_node(panel_path)
	if panel:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_CIRC)
		tween.tween_property(panel, "position", target_position, duration)
	else:
		print("Panel node not found at path: ", panel_path)

func PopOutAnimation(panel_path: String, target_position: Vector2, duration: float = 1.0):
	var panel = get_node(panel_path)
	if panel:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_CIRC)
		tween.tween_property(panel, "position", target_position, duration)
	else:
		print("Panel node not found at path: ", panel_path)

func PopUpAnimationScale(panel_path: String, target_scale: Vector2, duration: float = 1.0):
	var panel = get_node(panel_path)
	if panel:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_CIRC)
		tween.tween_property(panel, "scale", target_scale, duration)
	else:
		print("Panel node not found at path: ", panel_path)

func PopInAnimation(panel_path: String, target_position: Vector2, duration: float = 1.0):
	var panel = get_node(panel_path)
	if panel:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_CIRC)
		tween.tween_property(panel, "position", target_position, duration)
	else:
		print("Panel node not found at path: ", panel_path)

func FinishAnimation(panel_path: String, target_color: Color, duration: float = 1.0):
	var panel = get_node(panel_path)
	if panel:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_CIRC)
		tween.tween_property(panel, "modulate", target_color, duration)
		target_color = Color(1, 1, 1, 1)
		tween.tween_property(panel, "modulate", target_color, duration)
	else:
		print("Panel node not found at path: ", panel_path)
