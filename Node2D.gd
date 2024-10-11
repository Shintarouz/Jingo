extends Node2D
var dict = DictionaryData.hira_aiueo
var array1 = ["あ","い","う","え","お"]
var array2 = ["a","i","u","e","o"]
var qs = []
var ans = []
var qsC = []
var ansC = []
var check_2
func _ready():
	print(dict)
	if ("question"[0] in dict):
		print("WORKS")
	if ( array2.has("a") ):
		print("keys has qa")

	for x in dict:
		qs.append(x["question"])
	for x in dict:
		ans.append(x["answer"])
	ansC.append(ans[0])
	print(ansC)
	#$Button1.position = Vector2(-32, 72)
	#$Button2.position = Vector2(248, 72)
	#$Button3.position = Vector2(-32, 304)
	#$Button4.position = Vector2(248, 304)

func CorrectFunction():
		get_tree().change_scene_to_file("res://Scenes/hiragana.tscn")

func _on_button_1_pressed():
	pass
func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
func _on_button_3_pressed():
	pass
func _on_button_4_pressed():
	#if $Button4.text == str(",").join(ans[question_number]):
		#CorrectFunction()
	pass

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
