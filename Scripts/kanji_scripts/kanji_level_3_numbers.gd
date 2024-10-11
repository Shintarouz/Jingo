extends Node2D
var mistakes = 0
var dict = DictionaryData.numbers
var dictCopy = dict.duplicate(true)


func _ready():
	print(DictionaryData.numbers)
	# dict += dict2 <-- to combine arrays
	dictCopy.shuffle()
	$Label.text = str(",").join(dictCopy[0]["question"])
	$AnswerDisplay.visible = false
	$AnswerDisplay.text = str(", ").join(dictCopy[0]["translation"])
	$pronouns.text = str(",").join(dictCopy[0]["pronoun"])
	$ColorRect1.modulate = Color.GREEN
	$ColorRect2.modulate = Color.RED
	$pronouns.visible = DictionaryData.options_check1
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/kanji_menu.tscn")

func _on_line_edit_text_submitted(new_text):
	if new_text != str(", ").join(dictCopy[0]["translation"]):
		$ColorRect2.visible = true
		await get_tree().create_timer(0.5).timeout
		$ColorRect2.visible = false
		mistakes += 1
		print(mistakes)
		if mistakes == 3:
			$AnswerDisplay.visible = true
	var correct = false
	for translation in dictCopy[0]["translation"]:
		if new_text == translation:
			correct = true
	if correct:
		$ColorRect1.visible = true
		await get_tree().create_timer(0.5).timeout
		$ColorRect1.visible = false
		$LineEdit.text = ""
		mistakes = 0
		$AnswerDisplay.visible = false
		dictCopy.remove_at(0)
	if dictCopy.size() == 0:
		get_tree().change_scene_to_file("res://Scenes/victory_screen.tscn")
	if dictCopy.size() > 0:
		$AnswerDisplay.text = str(",").join(dictCopy[0]["translation"])
		$pronouns.text = str(",").join(dictCopy[0]["pronoun"])
		$Label.text = str(",").join(dictCopy[0]["question"])
