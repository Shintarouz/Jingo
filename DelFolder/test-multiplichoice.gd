extends Node2D
var items: Array
var question: Dictionary
var questions2: Array
var index_item: int = 0

func _ready():
	items = read_json_file("res://DelFolder/questions.json")
	items.shuffle()
	show_questions()

func show_questions():
	print(items)
	question = items[index_item]
	print(question)
	$Label.text = (question["question"][0])
	print(question["question"][0])
	print(question["answer"][0])
	print(question["correctOptionIndex"])
	questions2.append(question["question"][0])
	print(questions2)
	#question = (questions[index_item]["question"])
	#print(question)
	#$Label.text = question
	#array[Dictionary{}]

func read_json_file(filename):
	var json_as_text = FileAccess.get_file_as_string(filename)
	var json_as_dict = JSON.parse_string(json_as_text)
	return json_as_dict
