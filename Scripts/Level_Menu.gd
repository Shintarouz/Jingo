extends CanvasLayer
var level_buttons: Array[Control]
var navbar_buttons: Array[Control]

func _ready():
	level_buttons.assign(find_children("Level_Button_*", "Control"))
	navbar_buttons.assign(find_children("Alpha_Button_*", "Control"))
	_text_generator()
	_menu_color_picker()
	_completed_level()
	_unlock_level()
	_text_switcher()
	$OG/NavBarTop/Label.text = "¥" + str(DictionaryData.Coins)


func _unlock_level():
	if DictionaryData.HiraCheck1 == false and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.disabled = true
	if DictionaryData.HiraCheck1 == true and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.disabled = false
	if DictionaryData.HiraCheck2 == false and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.disabled = true
	if DictionaryData.HiraCheck2 == true and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.disabled = false
	if DictionaryData.HiraCheck3 == false and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.disabled = true
	if DictionaryData.HiraCheck3 == true and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.disabled = false
	if DictionaryData.HiraCheck4 == false and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.disabled = true
	if DictionaryData.HiraCheck4 == true and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.disabled = false
	if DictionaryData.HiraCheck5 == false and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.disabled = true
	if DictionaryData.HiraCheck5 == true and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.disabled = false
	if DictionaryData.HiraCheck6 == false and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.disabled = true
	if DictionaryData.HiraCheck6 == true and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.disabled = false
	if DictionaryData.HiraCheck7 == false and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.disabled = true
	if DictionaryData.HiraCheck7 == true and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.disabled = false
	if DictionaryData.HiraCheck8 == false and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.disabled = true
	if DictionaryData.HiraCheck8 == true and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.disabled = false
	if DictionaryData.HiraCheck9 == false and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.disabled = true
	if DictionaryData.HiraCheck9 == true and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.disabled = false
	#if DictionaryData.HiraCheck10 == false and DictionaryData.ColorDict == 1:
		#$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.disabled = true
	#if DictionaryData.HiraCheck10 == true and DictionaryData.ColorDict == 1:
		#$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.disabled = false

	if DictionaryData.KataCheck1 == false and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.disabled = true
	if DictionaryData.KataCheck1 == true and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.disabled = false
	if DictionaryData.KataCheck2 == false and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.disabled = true
	if DictionaryData.KataCheck2 == true and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.disabled = false
	if DictionaryData.KataCheck3 == false and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.disabled = true
	if DictionaryData.KataCheck3 == true and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.disabled = false
	if DictionaryData.KataCheck4 == false and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.disabled = true
	if DictionaryData.KataCheck4 == true and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.disabled = false
	if DictionaryData.KataCheck5 == false and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.disabled = true
	if DictionaryData.KataCheck5 == true and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.disabled = false
	if DictionaryData.KataCheck6 == false and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.disabled = true
	if DictionaryData.KataCheck6 == true and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.disabled = false
	if DictionaryData.KataCheck7 == false and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.disabled = true
	if DictionaryData.KataCheck7 == true and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.disabled = false
	if DictionaryData.KataCheck8 == false and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.disabled = true
	if DictionaryData.KataCheck8 == true and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.disabled = false
	if DictionaryData.KataCheck9 == false and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.disabled = true
	if DictionaryData.KataCheck9 == true and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.disabled = false
	#if DictionaryData.KataCheck10 == false and DictionaryData.ColorDict == 2:
		#$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.disabled = true
	#if DictionaryData.KataCheck10 == true and DictionaryData.ColorDict == 2:
		#$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.disabled = false

	if DictionaryData.KanjiCheck1 == false and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.disabled = true
	if DictionaryData.KanjiCheck1 == true and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.disabled = false
	if DictionaryData.KanjiCheck2 == false and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.disabled = true
	if DictionaryData.KanjiCheck2 == true and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.disabled = false
	if DictionaryData.KanjiCheck3 == false and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.disabled = true
	if DictionaryData.KanjiCheck3 == true and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.disabled = false
	if DictionaryData.KanjiCheck4 == false and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.disabled = true
	if DictionaryData.KanjiCheck4 == true and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.disabled = false
	if DictionaryData.KanjiCheck5 == false and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.disabled = true
	if DictionaryData.KanjiCheck5 == true and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.disabled = false
	if DictionaryData.KanjiCheck6 == false and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.disabled = true
	if DictionaryData.KanjiCheck6 == true and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.disabled = false
	if DictionaryData.KanjiCheck7 == false and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.disabled = true
	if DictionaryData.KanjiCheck7 == true and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.disabled = false
	if DictionaryData.KanjiCheck8 == false and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.disabled = true
	if DictionaryData.KanjiCheck8 == true and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.disabled = false
	if DictionaryData.KanjiCheck9 == false and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.disabled = true
	if DictionaryData.KanjiCheck9 == true and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.disabled = false

	if DictionaryData.VocabCheck1 == false and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.disabled = true
	if DictionaryData.VocabCheck1 == true and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.disabled = false
	if DictionaryData.VocabCheck2 == false and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.disabled = true
	if DictionaryData.VocabCheck2 == true and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.disabled = false
	if DictionaryData.VocabCheck3 == false and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.disabled = true
	if DictionaryData.VocabCheck3 == true and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.disabled = false
	if DictionaryData.VocabCheck4 == false and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.disabled = true
	if DictionaryData.VocabCheck4 == true and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.disabled = false
	if DictionaryData.VocabCheck5 == false and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.disabled = true
	if DictionaryData.VocabCheck5 == true and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.disabled = false
	if DictionaryData.VocabCheck6 == false and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.disabled = true
	if DictionaryData.VocabCheck6 == true and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.disabled = false
	if DictionaryData.VocabCheck7 == false and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.disabled = true
	if DictionaryData.VocabCheck7 == true and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.disabled = false
	if DictionaryData.VocabCheck8 == false and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.disabled = true
	if DictionaryData.VocabCheck8 == true and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.disabled = false
	if DictionaryData.VocabCheck9 == false and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.disabled = true
	if DictionaryData.VocabCheck9 == true and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.disabled = false


func _text_generator():
	if DictionaryData.TextCheck == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_1/Level_Button_1.text = "あ"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.text = "か"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.text = "さ"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.text = "た"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.text = "な"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.text = "は"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.text = "ま"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.text = "や"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.text = "ら"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.text = "わ"
	if DictionaryData.TextCheck == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_1/Level_Button_1.text = "ア"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.text = "カ"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.text = "サ"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.text = "タ"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.text = "ナ"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.text = "ハ"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.text = "マ"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.text = "ヤ"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.text = "ラ"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.text = "ワ"
	if DictionaryData.TextCheck == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_1/Level_Button_1.text = "K1"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.text = "K2"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.text = "K3"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.text = "K4"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.text = "K5"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.text = "K6"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.text = "K7"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.text = "K8"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.text = "K9"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.text = "K10"
	if DictionaryData.TextCheck == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_1/Level_Button_1.text = "V1"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.text = "V2"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.text = "V3"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.text = "V4"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.text = "V5"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.text = "V6"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.text = "V7"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.text = "V8"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.text = "V9"
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.text = "V10"


func _menu_color_picker():
	if DictionaryData.ColorDict == 1:
		$OG/NavBarTop/ProgressBar.value = DictionaryData.ProgressBarValue1
		var StyleBoxHiraN = load("res://Assets/Tres/HiraButtons/Hira_Button_Normal.tres")
		var StyleBoxHiraH = load("res://Assets/Tres/HiraButtons/Hira_Button_Hover.tres")
		var StyleBoxHiraP = load("res://Assets/Tres/HiraButtons/Hira_Button_Pressed.tres")
		#var StyleBoxHiraD = load()
		var StyleBoxHiraGradient = load("res://Assets/Tres/HiraButtons/Hira_Gradient.tres")
		var StyleBoxHiraProgressbarBg = load("res://Assets/Tres/HiraButtons/Hira_Progressbar_Bg.tres")
		var StyleBoxHiraProgressbarFill = load("res://Assets/Tres/HiraButtons/Hira_Progressbar_Fill.tres")
		for btn in level_buttons:
			$OG/ScrollContainer2/VBoxContainer/Chapter_1/Label.set("theme_override_colors/font_color",Color("00c6bd"))
			$OG/NavBarTop/Label.set("theme_override_colors/font_color",Color("00c6bd"))
			$OG/NavBarTop/Label.add_theme_stylebox_override("normal" ,StyleBoxHiraN)
			$OG/NavBarTop.add_theme_stylebox_override("panel" ,StyleBoxHiraGradient)
			$OG/NavBarBottom.add_theme_stylebox_override("panel" ,StyleBoxHiraGradient)
			$OG/NavBarTop/ProgressBar.set("theme_override_styles/background", StyleBoxHiraProgressbarBg)
			$OG/NavBarTop/ProgressBar.set("theme_override_styles/fill", StyleBoxHiraProgressbarFill)
			btn.add_theme_stylebox_override("normal", StyleBoxHiraN)
			btn.add_theme_stylebox_override("hover", StyleBoxHiraH)
			btn.add_theme_stylebox_override("pressed", StyleBoxHiraP)
			btn.set("theme_override_colors/font_color",Color("00c6bd"))
			btn.set("theme_override_colors/font_pressed_color",Color("00c6bd"))
			btn.set("theme_override_colors/font_hover_color",Color("00c6bd"))
			$OG/NavBarTop/Back_Button.add_theme_stylebox_override("normal", StyleBoxHiraN)
			$OG/NavBarTop/Back_Button.add_theme_stylebox_override("hover", StyleBoxHiraH)
			$OG/NavBarTop/Back_Button.add_theme_stylebox_override("pressed", StyleBoxHiraP)
			$OG/NavBarTop/Back_Button.set("theme_override_colors/font_color",Color("00c6bd"))
			$OG/NavBarTop/Back_Button.set("theme_override_colors/font_pressed_color",Color("00c6bd"))
			$OG/NavBarTop/Back_Button.set("theme_override_colors/font_hover_color",Color("00c6bd"))
		for btn in navbar_buttons:
			btn.set("theme_override_colors/font_color",Color("00c6bd"))
			btn.set("theme_override_colors/font_pressed_color",Color("00c6bd"))
			btn.set("theme_override_colors/font_hover_color",Color("00c6bd"))
			btn.set("theme_override_colors/font_focus_color",Color("00c6bd"))
			btn.set("theme_override_colors/font_hover_pressed_color",Color("00c6bd"))
			btn.set("theme_override_colors/font_focus_color", Color("00c6bd"))
	if DictionaryData.ColorDict == 2:
		$OG/NavBarTop/ProgressBar.value = DictionaryData.ProgressBarValue2
		var StyleBoxKataN = load("res://Assets/Tres/KataButtons/Kata_Button_Normal.tres")
		var StyleBoxKataH = load("res://Assets/Tres/KataButtons/Kata_Button_Hover.tres")
		var StyleBoxKataP = load("res://Assets/Tres/KataButtons/Kata_Button_Pressed.tres")
		var StyleBoxKataGradient = load("res://Assets/Tres/KataButtons/Kata_Gradient.tres")
		var StyleBoxKataProgressbarBg = load("res://Assets/Tres/KataButtons/Kata_Progressbar_Bg.tres")
		var StyleBoxKataProgressbarFill = load("res://Assets/Tres/KataButtons/Kata_Progressbar_Fill.tres")
		for btn in level_buttons:
			$OG/ScrollContainer2/VBoxContainer/Chapter_1/Label.set("theme_override_colors/font_color",Color("158eba"))
			$OG/NavBarTop/Label.set("theme_override_colors/font_color",Color("158eba"))
			$OG/NavBarTop/Label.add_theme_stylebox_override("normal" ,StyleBoxKataN)
			$OG/NavBarTop.add_theme_stylebox_override("panel" ,StyleBoxKataGradient)
			$OG/NavBarBottom.add_theme_stylebox_override("panel" ,StyleBoxKataGradient)
			$OG/NavBarTop/ProgressBar.set("theme_override_styles/background", StyleBoxKataProgressbarBg)
			$OG/NavBarTop/ProgressBar.set("theme_override_styles/fill", StyleBoxKataProgressbarFill)
			btn.add_theme_stylebox_override("normal", StyleBoxKataN)
			btn.add_theme_stylebox_override("hover", StyleBoxKataH)
			btn.add_theme_stylebox_override("pressed", StyleBoxKataP)
			btn.set("theme_override_colors/font_color",Color("158eba"))
			btn.set("theme_override_colors/font_pressed_color",Color("158eba"))
			btn.set("theme_override_colors/font_hover_color",Color("158eba"))
			$OG/NavBarTop/Back_Button.add_theme_stylebox_override("normal", StyleBoxKataN)
			$OG/NavBarTop/Back_Button.add_theme_stylebox_override("hover", StyleBoxKataH)
			$OG/NavBarTop/Back_Button.add_theme_stylebox_override("pressed", StyleBoxKataP)
			$OG/NavBarTop/Back_Button.set("theme_override_colors/font_color",Color("158eba"))
			$OG/NavBarTop/Back_Button.set("theme_override_colors/font_pressed_color",Color("158eba"))
			$OG/NavBarTop/Back_Button.set("theme_override_colors/font_hover_color",Color("158eba"))
		for btn in navbar_buttons:
			btn.set("theme_override_colors/font_color",Color("158eba"))
			btn.set("theme_override_colors/font_pressed_color",Color("158eba"))
			btn.set("theme_override_colors/font_hover_color",Color("158eba"))
			btn.set("theme_override_colors/font_focus_color",Color("158eba"))
			btn.set("theme_override_colors/font_hover_pressed_color",Color("158eba"))
			btn.set("theme_override_colors/font_focus_color", Color("158eba"))
	if DictionaryData.ColorDict == 3:
		$OG/NavBarTop/ProgressBar.value = DictionaryData.ProgressBarValue3
		var StyleBoxKanjiN = load("res://Assets/Tres/KanjiButtons/Kanji_Button_Normal.tres")
		var StyleBoxKanjiH = load("res://Assets/Tres/KanjiButtons/Kanji_Button_Hover.tres")
		var StyleBoxKanjiP = load("res://Assets/Tres/KanjiButtons/Kanji_Button_Pressed.tres")
		var StyleBoxKanjiGradient = load("res://Assets/Tres/KanjiButtons/Kanji_Gradient.tres")
		var StyleBoxKanjiProgressbarBg = load("res://Assets/Tres/KanjiButtons/Kanji_Progressbar_Bg.tres")
		var StyleBoxKanjiProgressbarFill = load("res://Assets/Tres/KanjiButtons/Kanji_Progressbar_Fill.tres")
		for btn in level_buttons:
			$OG/ScrollContainer2/VBoxContainer/Chapter_1/Label.set("theme_override_colors/font_color",Color("940079"))
			$OG/NavBarTop/Label.set("theme_override_colors/font_color",Color("940079"))
			$OG/NavBarTop/Label.add_theme_stylebox_override("normal" ,StyleBoxKanjiN)
			$OG/NavBarTop.add_theme_stylebox_override("panel" ,StyleBoxKanjiGradient)
			$OG/NavBarBottom.add_theme_stylebox_override("panel" ,StyleBoxKanjiGradient)
			$OG/NavBarTop/ProgressBar.set("theme_override_styles/background", StyleBoxKanjiProgressbarBg)
			$OG/NavBarTop/ProgressBar.set("theme_override_styles/fill", StyleBoxKanjiProgressbarFill)
			btn.add_theme_stylebox_override("normal", StyleBoxKanjiN)
			btn.add_theme_stylebox_override("hover", StyleBoxKanjiH)
			btn.add_theme_stylebox_override("pressed", StyleBoxKanjiP)
			btn.set("theme_override_colors/font_color",Color("940079"))
			btn.set("theme_override_colors/font_pressed_color",Color("940079"))
			btn.set("theme_override_colors/font_hover_color",Color("940079"))
			$OG/NavBarTop/Back_Button.add_theme_stylebox_override("normal", StyleBoxKanjiN)
			$OG/NavBarTop/Back_Button.add_theme_stylebox_override("hover", StyleBoxKanjiH)
			$OG/NavBarTop/Back_Button.add_theme_stylebox_override("pressed", StyleBoxKanjiP)
			$OG/NavBarTop/Back_Button.set("theme_override_colors/font_color",Color("940079"))
			$OG/NavBarTop/Back_Button.set("theme_override_colors/font_pressed_color",Color("940079"))
			$OG/NavBarTop/Back_Button.set("theme_override_colors/font_hover_color",Color("940079"))
		for btn in navbar_buttons:
			btn.set("theme_override_colors/font_color",Color("940079"))
			btn.set("theme_override_colors/font_pressed_color",Color("940079"))
			btn.set("theme_override_colors/font_hover_color",Color("940079"))
			btn.set("theme_override_colors/font_focus_color",Color("940079"))
			btn.set("theme_override_colors/font_hover_pressed_color",Color("940079"))
			btn.set("theme_override_colors/font_focus_color", Color("940079"))
	if DictionaryData.ColorDict == 4:
		$OG/NavBarTop/ProgressBar.value = DictionaryData.ProgressBarValue4
		var StyleBoxVocabN = load("res://Assets/Tres/VocabButtons/Vocab_Button_Normal.tres")
		var StyleBoxVocabH = load("res://Assets/Tres/VocabButtons/Vocab_Button_Hover.tres")
		var StyleBoxVocabP = load("res://Assets/Tres/VocabButtons/Vocab_Button_Pressed.tres")
		var StyleBoxVocabGradient = load("res://Assets/Tres/VocabButtons/Vocab_Gradient.tres")
		var StyleBoxVocabProgressbarBg = load("res://Assets/Tres/VocabButtons/Vocab_Progressbar_Bg.tres")
		var StyleBoxVocabProgressbarFill = load("res://Assets/Tres/VocabButtons/Vocab_Progressbar_Fill.tres")
		for btn in level_buttons:
			$OG/ScrollContainer2/VBoxContainer/Chapter_1/Label.set("theme_override_colors/font_color",Color("816BB0"))
			$OG/NavBarTop/Label.set("theme_override_colors/font_color",Color("816BB0"))
			$OG/NavBarTop/Label.add_theme_stylebox_override("normal" ,StyleBoxVocabN)
			$OG/NavBarTop.add_theme_stylebox_override("panel" ,StyleBoxVocabGradient)
			$OG/NavBarBottom.add_theme_stylebox_override("panel" ,StyleBoxVocabGradient)
			$OG/NavBarTop/ProgressBar.set("theme_override_styles/background", StyleBoxVocabProgressbarBg)
			$OG/NavBarTop/ProgressBar.set("theme_override_styles/fill", StyleBoxVocabProgressbarFill)
			btn.add_theme_stylebox_override("normal", StyleBoxVocabN)
			btn.add_theme_stylebox_override("hover", StyleBoxVocabH)
			btn.add_theme_stylebox_override("pressed", StyleBoxVocabP)
			btn.set("theme_override_colors/font_color",Color("#816BB0"))
			btn.set("theme_override_colors/font_pressed_color",Color("#816BB0"))
			btn.set("theme_override_colors/font_hover_color",Color("#816BB0"))
			$OG/NavBarTop/Back_Button.add_theme_stylebox_override("normal", StyleBoxVocabN)
			$OG/NavBarTop/Back_Button.add_theme_stylebox_override("hover", StyleBoxVocabH)
			$OG/NavBarTop/Back_Button.add_theme_stylebox_override("pressed", StyleBoxVocabP)
			$OG/NavBarTop/Back_Button.set("theme_override_colors/font_color",Color("#816BB0"))
			$OG/NavBarTop/Back_Button.set("theme_override_colors/font_pressed_color",Color("#816BB0"))
			$OG/NavBarTop/Back_Button.set("theme_override_colors/font_hover_color",Color("#816BB0"))
		for btn in navbar_buttons:
			btn.set("theme_override_colors/font_color",Color("816BB0"))
			btn.set("theme_override_colors/font_pressed_color",Color("816BB0"))
			btn.set("theme_override_colors/font_hover_color",Color("816BB0"))
			btn.set("theme_override_colors/font_focus_color",Color("816BB0"))
			btn.set("theme_override_colors/font_hover_pressed_color",Color("816BB0"))
			btn.set("theme_override_colors/font_focus_color", Color("816BB0"))


func _text_switcher():
	if DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Chapter_1/Label.text = "Chapter 1 - Hiragana"
	if DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Chapter_1/Label.text = "Chapter 1 - Katakana"
	if DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Chapter_1/Label.text = "Chapter 1 - Kanji"
	if DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Chapter_1/Label.text = "Chapter 1 - Vocab"


func _completed_level():
	var StyleBoxCompletedN = load("res://Assets/Tres/TemplateButtons/Completed_Button_N.tres")
	if DictionaryData.HiraCheck1 and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_1/Level_Button_1.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.HiraCheck2 and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.HiraCheck3 and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.HiraCheck4 and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.HiraCheck5 and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.HiraCheck6 and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.HiraCheck7 and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.HiraCheck8 and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.HiraCheck9 and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.HiraCheck10 and DictionaryData.ColorDict == 1:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.add_theme_stylebox_override("normal", StyleBoxCompletedN)

	if DictionaryData.KataCheck1 and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_1/Level_Button_1.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KataCheck2 and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KataCheck3 and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KataCheck4 and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KataCheck5 and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KataCheck6 and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KataCheck7 and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KataCheck8 and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KataCheck9 and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KataCheck10 and DictionaryData.ColorDict == 2:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.add_theme_stylebox_override("normal", StyleBoxCompletedN)

	if DictionaryData.KanjiCheck1 and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_1/Level_Button_1.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KanjiCheck2 and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KanjiCheck3 and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KanjiCheck4 and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KanjiCheck5 and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KanjiCheck6 and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KanjiCheck7 and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KanjiCheck8 and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KanjiCheck9 and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.KanjiCheck10 and DictionaryData.ColorDict == 3:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.add_theme_stylebox_override("normal", StyleBoxCompletedN)

	if DictionaryData.VocabCheck1 and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_1/Level_Button_1.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.VocabCheck2 and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_2/Level_Button_2.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.VocabCheck3 and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_3/Level_Button_3.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.VocabCheck4 and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_4/Level_Button_4.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.VocabCheck5 and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_5/Level_Button_5.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.VocabCheck6 and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_6/Level_Button_6.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.VocabCheck7 and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_7/Level_Button_7.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.VocabCheck8 and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_8/Level_Button_8.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.VocabCheck9 and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_9/Level_Button_9.add_theme_stylebox_override("normal", StyleBoxCompletedN)
	if DictionaryData.VocabCheck10 and DictionaryData.ColorDict == 4:
		$OG/ScrollContainer2/VBoxContainer/Empty_Node_10/Level_Button_10.add_theme_stylebox_override("normal", StyleBoxCompletedN)


func _on_hiragana_button_pressed():
	DictionaryData.ColorDict = 1
	DictionaryData.TextCheck = 1
	_text_generator()
	_menu_color_picker()
	_completed_level()
	_unlock_level()
	_text_switcher()
	
func _on_katakana_button_pressed():
	DictionaryData.ColorDict = 2
	DictionaryData.TextCheck = 2
	_text_generator()
	_menu_color_picker()
	_completed_level()
	_unlock_level()
	_text_switcher()
	
func _on_kanji_button_pressed():
	DictionaryData.ColorDict = 3
	DictionaryData.TextCheck = 3
	_text_generator()
	_menu_color_picker()
	_completed_level()
	_unlock_level()
	_text_switcher()
	
func _on_vocab_button_pressed():
	DictionaryData.ColorDict = 4
	DictionaryData.TextCheck = 4
	_text_generator()
	_menu_color_picker()
	_completed_level()
	_unlock_level()
	_text_switcher()

func _on_level_button_1_pressed():
	if DictionaryData.TextCheck == 1:
		DictionaryData.GameDict = 1
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 2:
		DictionaryData.GameDict = 11
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 3:
		DictionaryData.GameDict = 21
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")
	if DictionaryData.TextCheck == 4:
		DictionaryData.GameDict = 31
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")

func _on_level_button_2_pressed():
	if DictionaryData.TextCheck == 1:
		DictionaryData.GameDict = 2
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 2:
		DictionaryData.GameDict = 12
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 3:
		DictionaryData.GameDict = 22
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")
	if DictionaryData.TextCheck == 4:
		DictionaryData.GameDict = 32
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")

func _on_level_button_3_pressed():
	if DictionaryData.TextCheck == 1:
		DictionaryData.GameDict = 3
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 2:
		DictionaryData.GameDict = 13
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 3:
		DictionaryData.GameDict = 23
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")
	if DictionaryData.TextCheck == 4:
		DictionaryData.GameDict = 33
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")

func _on_level_button_4_pressed():
	if DictionaryData.TextCheck == 1:
		DictionaryData.GameDict = 4
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 2:
		DictionaryData.GameDict = 14
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 3:
		DictionaryData.GameDict = 24
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")
	if DictionaryData.TextCheck == 4:
		DictionaryData.GameDict = 34
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")

func _on_level_button_5_pressed():
	if DictionaryData.TextCheck == 1:
		DictionaryData.GameDict = 5
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 2:
		DictionaryData.GameDict = 15
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 3:
		DictionaryData.GameDict = 25
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")
	if DictionaryData.TextCheck == 4:
		DictionaryData.GameDict = 35
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")

func _on_level_button_6_pressed():
	if DictionaryData.TextCheck == 1:
		DictionaryData.GameDict = 6
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 2:
		DictionaryData.GameDict = 16
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 3:
		DictionaryData.GameDict = 26
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")
	if DictionaryData.TextCheck == 4:
		DictionaryData.GameDict = 36
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")

func _on_level_button_7_pressed():
	if DictionaryData.TextCheck == 1:
		DictionaryData.GameDict = 7
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 2:
		DictionaryData.GameDict = 17
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 3:
		DictionaryData.GameDict = 27
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")
	if DictionaryData.TextCheck == 4:
		DictionaryData.GameDict = 37
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")

func _on_level_button_8_pressed():
	if DictionaryData.TextCheck == 1:
		DictionaryData.GameDict = 8
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 2:
		DictionaryData.GameDict = 18
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 3:
		DictionaryData.GameDict = 28
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")
	if DictionaryData.TextCheck == 4:
		DictionaryData.GameDict = 38
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")

func _on_level_button_9_pressed():
	if DictionaryData.TextCheck == 1:
		DictionaryData.GameDict = 9
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 2:
		DictionaryData.GameDict = 19
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 3:
		DictionaryData.GameDict = 29
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")
	if DictionaryData.TextCheck == 4:
		DictionaryData.GameDict = 39
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")

func _on_level_button_10_pressed():
	if DictionaryData.TextCheck == 1:
		DictionaryData.GameDict = 10
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 2:
		DictionaryData.GameDict = 20
		get_tree().change_scene_to_file("res://Scenes/Level_Game.tscn")
	if DictionaryData.TextCheck == 3:
		DictionaryData.GameDict = 30
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")
	if DictionaryData.TextCheck == 4:
		DictionaryData.GameDict = 40
		get_tree().change_scene_to_file("res://Scenes/Level_Game_Kanji_Vocab.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/hiragana.tscn")
