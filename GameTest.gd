extends CanvasLayer
var mistakes = 0
var dict
var dictCopy

func _ready():
	ReadyAnimations()
	_game_mode_picker()
	_menu_color_picker()
	dictCopy = dict.duplicate(true)
	dictCopy.shuffle()
	$Control/QuestionControl/Label.text = str(",").join(dictCopy[0]["question"])
	AudioLoader() # sets Riashuu audio mp3

func ReadyAnimations():
	AnimationPosition("Control/NavBarTop", Vector2(0, 0), 1)
	AnimationPosition("Control/NavBarBottom", Vector2(0, 2120), 1)
	AnimationScale("Control/QuestionControl", Vector2(1, 1), 1)
	AnimationPosition("Control/AnswerVbox", Vector2(40, 1272), 1)
	AnimationScale("Control/SoundButton", Vector2(1, 1), 1)

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
			AudioLoader()
			await get_tree().create_timer(0.5).timeout
			$Control/SoundButton/AudioStreamPlayer.play()
	if dictCopy.size() == 0:
		_level_completer()
		get_tree().change_scene_to_file("res://Scenes/victory_screen.tscn")

func _level_completer():
	var hira_checks = ["HiraCheck1","HiraCheck2","HiraCheck3","HiraCheck4","HiraCheck5","HiraCheck6","HiraCheck7","HiraCheck8","HiraCheck9","HiraCheck10",]
	var kata_checks = ["KataCheck1","KataCheck2","KataCheck3","KataCheck4","KataCheck5","KataCheck6","KataCheck7","KataCheck8","KataCheck9","KataCheck10",]
	var game_dict = DictionaryData.GameDict
	if game_dict in range(1, 11):
		_process_check(hira_checks[game_dict - 1], 5, 10, "pgbar_adder_1")
	elif game_dict in range (11, 21):
		_process_check(kata_checks[game_dict - 11], 5, 10, "pgbar_adder_2")

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
		$Control/SoundButton.add_theme_stylebox_override("normal", StyleBoxHiraN)
		$Control/SoundButton.add_theme_stylebox_override("hover", StyleBoxHiraH)
		$Control/SoundButton.add_theme_stylebox_override("pressed", StyleBoxHiraP)
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
		$Control/SoundButton.add_theme_stylebox_override("normal", StyleBoxKataN)
		$Control/SoundButton.add_theme_stylebox_override("hover", StyleBoxKataH)
		$Control/SoundButton.add_theme_stylebox_override("pressed", StyleBoxKataP)

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level_Menu.tscn")

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


func _on_sound_button_pressed():
	AudioLoader()
	$Control/SoundButton/AudioStreamPlayer.play()

func AudioLoader():
	var test_string = str(",").join(dictCopy[0]["answer"])
	match test_string:
		"a" :
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/A.mp3")
		"i":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/I.mp3")
		"e":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/E.mp3")
		"u":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/U.mp3")
		"o":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/O.mp3")

		"ka":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/KA.mp3")
		"ki":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/KI.mp3")
		"ke":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/KE.mp3")
		"ku":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/KU.mp3")
		"ko":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/KO.mp3")

		"sa":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/SA.mp3")
		"shi":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/SHI.mp3")
		"se":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/SE.mp3")
		"su":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/SU.mp3")
		"so":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/SO.mp3")

		"ta":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/TA.mp3")
		"chi":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/CHI.mp3")
		"te":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/TE.mp3")
		"tsu":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/TSU.mp3")
		"to":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/TO.mp3")

		"na":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/NA.mp3")
		"ni":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/NI.mp3")
		"ne":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/NE.mp3")
		"nu":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/NU.mp3")
		"no":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/NO.mp3")

		"ha":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/HA.mp3")
		"hi":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/HI.mp3")
		"he":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/HE.mp3")
		"fu":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/FU.mp3")
		"ho":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/HO.mp3")

		"ma":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/MA.mp3")
		"mi":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/MI.mp3")
		"me":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/ME.mp3")
		"mu":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/MU.mp3")
		"mo":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/MO.mp3")

		"ya":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/YA.mp3")
		"yu":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/YU.mp3")
		"yo":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/YO.mp3")

		"ra":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/RA.mp3")
		"ri":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/RI.mp3")
		"re":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/RE.mp3")
		"ru":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/RU.mp3")
		"ro":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/RO.mp3")

		"w":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/W.mp3")
		"wo":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/WO.mp3")
		"n":
			$Control/SoundButton/AudioStreamPlayer.stream = load("res://Sounds/N.mp3")
