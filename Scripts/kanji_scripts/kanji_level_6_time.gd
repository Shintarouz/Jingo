extends Node2D
var mistakes1 = 0
var mistakes2 = 0
var check_1 = false
var check_2 = false
var dict = DictionaryData.time
var dictCopy = dict.duplicate(true)

# var dict2 = DictionaryData.weekdays

func _ready():
	# dict += dict2 <-- to combine arrays
	dictCopy.shuffle()
	$ColorRect1.modulate = Color.GREEN
	$ColorRect2.modulate = Color.GREEN
	$ColorRect3.modulate = Color.RED
	$ColorRect4.modulate = Color.RED
	$AnswerDisplay.visible = false
	$RomajiDisplay.visible = false
	$QuestionLabel.text = str(",").join(dictCopy[0]["question"])
	$AnswerDisplay.text = str(", ").join(dictCopy[0]["translation"])
	$RomajiDisplay.text = str(", ").join(dictCopy[0]["romaji"])
	$pronouns.text = str(", ").join(dictCopy[0]["pronoun"])
	$pronouns.visible = DictionaryData.options_check1

func _on_answer_line_edit_text_submitted(new_text):
	if new_text != str(", ").join(dictCopy[0]["translation"]):
		$ColorRect3.visible = true
		await get_tree().create_timer(0.5).timeout
		$ColorRect3.visible = false
		mistakes1 += 1
		if mistakes1 == 3:
			$AnswerDisplay.visible = true
	for translation in dictCopy[0]["translation"]:
		if new_text == translation:
			check_1 = true
			check_checker()

func _on_romaji_line_edit_text_submitted(new_text):
	if new_text != str(", ").join(dictCopy[0]["romaji"]):
		$ColorRect4.visible = true
		await get_tree().create_timer(0.5).timeout
		$ColorRect4.visible = false
		mistakes2 += 1
		if mistakes2 == 3:
			$RomajiDisplay.visible = true
	for romaji in dictCopy[0]["romaji"]:
		if new_text == romaji:
			check_2 = true
			check_checker()

func check_checker():
	if check_1 == true:
		$ColorRect1.visible = true
	if check_2 == true:
		$ColorRect2.visible = true
	if check_1 and check_2:
		if dictCopy.size() == 1:
			$ColorRect1.visible = false
			$ColorRect2.visible = false
			mistakes1 = 0
			mistakes2 = 0
			$AnswerDisplay.visible = false
			$RomajiDisplay.visible = false
			check_1 = false
			check_2 = false
			get_tree().change_scene_to_file("res://Scenes/victory_screen.tscn")
		if dictCopy.size() > 1:
			mistakes1 = 0
			mistakes2 = 0
			dictCopy.remove_at(0)
			$ColorRect1.visible = false
			$ColorRect2.visible = false
			$AnswerDisplay.visible = false
			$RomajiDisplay.visible = false
			$AnswerDisplay.text = str(", ").join(dictCopy[0]["translation"])
			$RomajiDisplay.text = str(", ").join(dictCopy[0]["romaji"])
			$QuestionLabel.text = str(", ").join(dictCopy[0]["question"])
			$pronouns.text = str(", ").join(dictCopy[0]["pronoun"])
			$answerLineEdit.text = ""
			$RomajiLineEdit.text = ""
			check_1 = false
			check_2 = false

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/kanji_menu.tscn")
