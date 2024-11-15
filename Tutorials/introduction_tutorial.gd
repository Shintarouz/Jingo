extends CanvasLayer
var count : int


func _ready():
	TutorialCheck()
	$Template/Label.text = "Welcome to Jingo, "

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func TutorialCheck():
	if SaveGame.TutorialCheck1 == false:
		$Template.visible = true
	else:
		$Template.visible = false

func end():
	SaveGame.TutorialCheck1 = true

func _on_label_gui_input(event):
	if event is InputEventMouseButton:
		await get_tree().create_timer(0.2).timeout
		count += 1
		print(count)
		if count == 1:
			$Template/Label.text = "Japanese uses three scripts: Hiragana, Katakana, and Kanji. You'll learn them step by step here!"
		if count == 2:
			$Template/Label.text = "test"
		if count == 3:
			$Template/Label.text = "test2"
		if count == 4:
			$Template/Label.text = "test3"
		if count == 5:
			$Template/Label.text = "test4"
