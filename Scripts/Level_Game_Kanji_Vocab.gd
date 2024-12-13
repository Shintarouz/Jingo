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
	_first_time_check()
	_furigana_mode()
	_game_mode_picker()
	_menu_color_picker()
	
	ReadyAnimations()
	
	dictCopy = dict.duplicate(true)
	dictCopy.shuffle()
	$Control/QuestionControl/Label/Label.text = str(", ").join(dictCopy[0]["furigana"])
	$Control/QuestionControl/Label.text = str(",").join(dictCopy[0]["kanji"])
	if DictionaryData.RomajiOption == true:
		$Control/AnswerVbox/RomajiLineEdit.visible = true
	else:
		$Control/AnswerVbox/RomajiLineEdit.visible = false
	AudioLoader()

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

#func _on_answer_line_edit_text_submitted(new_text):
	#for translation in dictCopy[0]["translation"]:
		#if new_text != translation:
			#$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("FF0000"))
			#await get_tree().create_timer(0.5).timeout
			#if DictionaryData.ColorDict == 3:
				#$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("940079"))
			#if DictionaryData.ColorDict == 4:
				#$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
			#mistakes1 += 1
			#if mistakes1 == 3:
				#$Control/AnswerVbox/AnswerLineEdit.placeholder_text = str(",").join(dictCopy[0]["translation"])
#
		#if new_text == translation:
			#$Control/AnswerVbox/AnswerLineEdit.editable = false
			#$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("74de76"))
			#check1 = true
			#_answer_checker()

func _on_answer_line_edit_text_submitted(new_text):
	var is_correct = false
	
	for translation in dictCopy[0]["translation"]:
		if new_text == translation:
			is_correct = true
			break
	
	if is_correct:
		$Control/AnswerVbox/AnswerLineEdit.editable = false
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("74de76"))
		check1 = true
		_answer_checker()
	else:
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("FF0000"))
		await get_tree().create_timer(0.5).timeout
		if DictionaryData.ColorDict == 3:
			$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("940079"))
		if DictionaryData.ColorDict == 4:
			$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
		$Control/AnswerVbox/AnswerLineEdit.clear()
		mistakes1 += 1
		if mistakes1 == 3:
			$Control/AnswerVbox/AnswerLineEdit.placeholder_text = str(",").join(dictCopy[0]["translation"])



func _on_romaji_line_edit_text_submitted(new_text):
	var is_correct = false

	for romaji in dictCopy[0]["romaji"]:
		if new_text == romaji:
			is_correct = true
			break
	
	if is_correct:
		$Control/AnswerVbox/RomajiLineEdit.editable = false
		$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("74de76"))
		check2 = true
		_answer_checker()
	else:
		$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("FF0000"))
		await get_tree().create_timer(0.5).timeout
		if DictionaryData.ColorDict == 3:
			$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("940079"))
		if DictionaryData.ColorDict == 4:
			$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
		$Control/AnswerVbox/RomajiLineEdit.clear()
		mistakes2 += 1
		if mistakes2 == 3:
			$Control/AnswerVbox/RomajiLineEdit.placeholder_text = str(",").join(dictCopy[0]["romaji"])


#func _on_romaji_line_edit_text_submitted(new_text):
	#for romaji in dictCopy[0]["romaji"]:
		#if new_text != romaji:
			#$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("FF0000"))
			#await get_tree().create_timer(0.5).timeout
			#if DictionaryData.ColorDict == 3:
				#$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("940079"))
			#if DictionaryData.ColorDict == 4:
				#$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
			#mistakes2 += 1
			#if mistakes2 == 3:
				#$Control/AnswerVbox/RomajiLineEdit.placeholder_text = str(",").join(dictCopy[0]["romaji"])
#
		#if new_text == romaji:
			#$Control/AnswerVbox/RomajiLineEdit.editable = false
			#$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("74de76"))
			#check2 = true
			#_answer_checker()

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
				$Control/AnswerVbox/RomajiLineEdit.placeholder_text = "Romaji"
				$Control/AnswerVbox/AnswerLineEdit.placeholder_text = "Translation"
				if DictionaryData.ColorDict == 3:
					$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("940079"))
					$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("940079"))
				if DictionaryData.ColorDict == 4:
					$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
					$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
				mistakes1 = 0
				mistakes2 = 0
				dictCopy.remove_at(0)
				$Control/QuestionControl/Label.text = str(", ").join(dictCopy[0]["kanji"])
				$Control/QuestionControl/Label/Label.text = str(", ").join(dictCopy[0]["furigana"])
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
				$Control/QuestionControl/Label.text = str(", ").join(dictCopy[0]["kanji"])
				$Control/AnswerVbox/AnswerLineEdit.text = ""
				check1 = false

func _level_completer():
	var kanji_checks = ["KanjiCheck1","KanjiCheck2","KanjiCheck3","KanjiCheck4","KanjiCheck5","KanjiCheck6","KanjiCheck7","KanjiCheck8","KanjiCheck9","KanjiCheck10",]
	var vocab_checks = ["VocabCheck1","VocabCheck2","VocabCheck3","VocabCheck4","VocabCheck5","VocabCheck6","VocabCheck7","VocabCheck8","VocabCheck9","VocabCheck10",]
	var game_dict = DictionaryData.GameDict
	if game_dict in range(21, 31):
		_process_check(kanji_checks[game_dict - 21], 5, 10, "pgbar_adder_3")
	elif game_dict in range (31, 41):
		_process_check(vocab_checks[game_dict - 31], 5, 10, "pgbar_adder_4")

func _process_check(check_name, coins, progress, pgbar_function):
	if not SaveGame.get(check_name):
		SaveGame.set(check_name, true)
		coins_adder(coins)
		call(pgbar_function, progress)
	else:
		coins_adder(1)
	SaveGame.save()

func coins_adder(amount):
	print("coins given :" + str(amount))
	SaveGame.Coins += amount

func pgbar_adder_3(amount):
	SaveGame.ProgressBarValue3 += amount
	SaveGame.ScrollPositionValue3 += 300
func pgbar_adder_4(amount):
	SaveGame.ProgressBarValue4 += amount
	SaveGame.ScrollPositionValue4 += 300

func _game_mode_picker():
	if DictionaryData.GameDict == 21:
		dict = DictionaryData.kanji_numbers
	if DictionaryData.GameDict == 22:
		dict = DictionaryData.kanji_weeks
	if DictionaryData.GameDict == 23:
		dict = DictionaryData.kanji_directions
	if DictionaryData.GameDict == 24:
		dict = DictionaryData.kanji_people
	if DictionaryData.GameDict == 25:
		dict = DictionaryData.kanji_verbs
	if DictionaryData.GameDict == 26:
		dict = DictionaryData.kanji_nature
	if DictionaryData.GameDict == 27:
		dict = DictionaryData.kanji_objects
	if DictionaryData.GameDict == 28:
		dict = DictionaryData.kanji_adj
	if DictionaryData.GameDict == 29:
		dict = DictionaryData.kanji_misc
	if DictionaryData.GameDict == 30:
		dict = DictionaryData.kanji_numbers
	if DictionaryData.GameDict == 31:
		dict = DictionaryData.kanji_numbers
	if DictionaryData.GameDict == 32:
		dict = DictionaryData.kanji_numbers
	if DictionaryData.GameDict == 33:
		dict = DictionaryData.kanji_numbers
	if DictionaryData.GameDict == 34:
		dict = DictionaryData.kanji_numbers
	if DictionaryData.GameDict == 35:
		dict = DictionaryData.kanji_numbers
	if DictionaryData.GameDict == 36:
		dict = DictionaryData.kanji_numbers
	if DictionaryData.GameDict == 37:
		dict = DictionaryData.kanji_numbers
	if DictionaryData.GameDict == 38:
		dict = DictionaryData.kanji_numbers
	if DictionaryData.GameDict == 39:
		dict = DictionaryData.kanji_numbers
	if DictionaryData.GameDict == 40:
		dict = DictionaryData.kanji_numbers

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
		$Control/SoundButton.add_theme_stylebox_override("normal", StyleBoxKanjiN)
		$Control/SoundButton.add_theme_stylebox_override("hover", StyleBoxKanjiH)
		$Control/SoundButton.add_theme_stylebox_override("pressed", StyleBoxKanjiP)
	if DictionaryData.ColorDict == 4:
		var StyleBoxVocabN = load("res://Assets/Tres/VocabButtons/Vocab_Button_Normal.tres")
		var StyleBoxVocabH = load("res://Assets/Tres/VocabButtons/Vocab_Button_Hover.tres")
		var StyleBoxVocabP = load("res://Assets/Tres/VocabButtons/Vocab_Button_Pressed.tres")
		var StyleBoxVocabGradient = load("res://Assets/Tres/VocabButtons/Vocab_Gradient.tres")
		var StyleBoxVocabProgressbarBg = load("res://Assets/Tres/VocabButtons/Vocab_Progressbar_Bg.tres")
		var StyleBoxVocabProgressbarFill = load("res://Assets/Tres/VocabButtons/Vocab_Progressbar_Fill.tres")
		$Control/NavBarBottom.add_theme_stylebox_override("panel" ,StyleBoxVocabGradient)
		$Control/NavBarTop.add_theme_stylebox_override("panel" ,StyleBoxVocabGradient)
		$Control/NavBarTop/ProgressBar.set("theme_override_styles/background", StyleBoxVocabProgressbarBg)
		$Control/NavBarTop/ProgressBar.set("theme_override_styles/fill", StyleBoxVocabProgressbarFill)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("normal", StyleBoxVocabN)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("hover", StyleBoxVocabH)
		$Control/NavBarTop/Back_Button.add_theme_stylebox_override("pressed", StyleBoxVocabP)
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_color",Color("816BB0"))
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_pressed_color",Color("816BB0"))
		$Control/NavBarTop/Back_Button.set("theme_override_colors/font_hover_color",Color("816BB0"))
		$Control/QuestionControl/Label.add_theme_stylebox_override("normal", StyleBoxVocabN)
		$Control/QuestionControl/Label.set("theme_override_colors/font_color",Color("816BB0"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_pressed_color",Color("816BB0"))
		$Control/QuestionControl/Label.set("theme_override_colors/font_hover_color",Color("816BB0"))
		$Control/AnswerVbox/AnswerLineEdit.add_theme_stylebox_override("normal", StyleBoxVocabN)
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_selected_color",Color("816BB0"))
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_placeholder_color",Color("816BB0"))
		$Control/AnswerVbox/AnswerLineEdit.add_theme_stylebox_override("read_only", StyleBoxVocabN)
		$Control/AnswerVbox/AnswerLineEdit.set("theme_override_colors/font_uneditable_color",Color("816BB0"))
		$Control/AnswerVbox/RomajiLineEdit.add_theme_stylebox_override("normal", StyleBoxVocabN)
		$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_color",Color("816BB0"))
		$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_selected_color",Color("816BB0"))
		$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_placeholder_color",Color("816BB0"))
		$Control/AnswerVbox/RomajiLineEdit.add_theme_stylebox_override("read_only", StyleBoxVocabN)
		$Control/AnswerVbox/RomajiLineEdit.set("theme_override_colors/font_uneditable_color",Color("74de76"))
		$Control/QuestionControl/Label/Label.set("theme_override_colors/font_color",Color("816BB0"))
		$Control/SoundButton.add_theme_stylebox_override("normal", StyleBoxVocabN)
		$Control/SoundButton.add_theme_stylebox_override("hover", StyleBoxVocabH)
		$Control/SoundButton.add_theme_stylebox_override("pressed", StyleBoxVocabP)

func _on_sound_button_pressed():
	AudioLoader()
	$Control/SoundButton/AudioStreamPlayer.play()

func AudioLoader():
	var test_string = str(",").join(dictCopy[0]["kanji"])
	match test_string:
		"北" :
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/Raishuu.mp3")
		"東":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/Raishuu.mp3")
		"南":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/Raishuu.mp3")
		"西":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/Raishuu.mp3")

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level_Menu.tscn")



#func _on_label_gui_input(event):
	#if event is InputEventMouseButton:
		#count += 1
		#print(count)
		#if count == 1:
			#$Panel/Label.text = "Welcome to Kanji level 1! + Here you will find 2 answer lines + One will need the translation and the other will require the Romaji of the word."
		#if count == 2:
			#$Panel/Label.text = "Romaji is simply using English letters for Japanese words." + "Example : ありがとう + Translation : Thank you + Romaji : Arigatou"
		#if count == 3:
			#$Panel/Label.text = "test2"
		#if count == 4:
			#$Panel/Label.text = "test3"
		#if count == 5:
			#$Panel/Label.text = "test4"
func ReadyAnimations():
	AnimationPosition("Control/NavBarTop", Vector2(0, 0), 1)
	AnimationPosition("Control/NavBarBottom", Vector2(0, 2120), 1)
	AnimationScale("Control/QuestionControl", Vector2(1, 1), 1)
	AnimationPosition("Control/AnswerVbox", Vector2(40, 1272), 1)
	AnimationScale("Control/SoundButton", Vector2(1, 1), 1)

func AnimationPosition(panel_path: String, target_position: Vector2, duration: float = 1.0):
	var panel = get_node(panel_path)
	if panel:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_CIRC)
		tween.tween_property(panel, "position", target_position, duration)

func AnimationScale(panel_path: String, target_scale: Vector2, duration: float = 1.0):
	var panel = get_node(panel_path)
	if panel:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_CIRC)
		tween.tween_property(panel, "scale", target_scale, duration)

func FinishAnimation(panel_path: String, target_color: Color, duration: float = 1.0):
	var panel = get_node(panel_path)
	if panel:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_CIRC)
		tween.tween_property(panel, "modulate", target_color, duration)
		target_color = Color(1, 1, 1, 1)
		tween.tween_property(panel, "modulate", target_color, duration)
