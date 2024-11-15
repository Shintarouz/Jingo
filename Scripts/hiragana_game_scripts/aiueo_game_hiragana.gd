extends Node2D
var mistakes = 0
var dict = DictionaryData.hira_aiueo
var dictCopy = dict.duplicate(true)



func _ready():
	dictCopy.shuffle()
	$Label.text = str(",").join(dictCopy[0]["question"])
	$AnswerDisplay.visible = false
	$AnswerDisplay.text = str(",").join(dictCopy[0]["answer"])
	$ColorRect1.modulate = Color.GREEN
	$ColorRect2.modulate = Color.RED


func _on_line_edit_text_submitted(new_text):
	if new_text != str(",").join(dictCopy[0]["answer"]):
		$ColorRect2.visible = true
		await get_tree().create_timer(0.5).timeout
		$ColorRect2.visible = false
		mistakes += 1
		if mistakes == 3:
			$AnswerDisplay.visible = true
	if new_text == str(",").join(dictCopy[0]["answer"]):
		$ColorRect1.visible = true
		await get_tree().create_timer(0.5).timeout
		$ColorRect1.visible = false
		$LineEdit.text = ""
		mistakes = 0
		dictCopy.remove_at(0)
		if dictCopy.size() > 0:
			$Label.text = str(",").join(dictCopy[0]["question"])
			$AnswerDisplay.text = str(",").join(dictCopy[0]["answer"])
			$AnswerDisplay.visible = false
	if dictCopy.size() == 0:
		DictionaryData.check1 = true
		get_tree().change_scene_to_file("res://Scenes/victory_screen.tscn")

func _on_back_pressed():
	#get_tree().get_root().connect("go_back_requested", _on_back_pressed)
	get_tree().change_scene_to_file("res://DelFolder/canvas_layer.tscn")
