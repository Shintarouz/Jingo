extends CanvasLayer


func _ready():
	PopUpAnimation("Panel1", Vector2(0, 1872), 1)
	PopUpAnimation("Panel2", Vector2(0, -200), 1)

func _process(delta):
	pass

#func PopUpAnimation(panel_path: String, target_position: Vector2, duration: float = 1.0):
	#var tween := create_tween()
	#tween.set_trans(Tween.TRANS_CIRC)
	#var sprite_2d = get_node("Panel")
	#var position = Vector2(0, 1872)
	#tween.tween_property(sprite_2d, "position", position, duration)

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




func _on_button_pressed():
	PopOutAnimation("Panel1", Vector2(0, 2416), 1)
	PopOutAnimation("Panel2", Vector2(0, -632), 1)
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
