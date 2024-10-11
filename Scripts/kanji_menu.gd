extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/mode_menu.tscn")

func _on_directions_pressed():
	get_tree().change_scene_to_file("res://Scenes/kanji_game_scenes/kanji_level_1_directions.tscn")

func _on_weekdays_pressed():
	get_tree().change_scene_to_file("res://Scenes/kanji_game_scenes/kanji_level_2_weekdays.tscn")

func _on_numbers_pressed():
	get_tree().change_scene_to_file("res://Scenes/kanji_game_scenes/kanji_level_3_numbers.tscn")

func _on_bodyparts_pressed():
	get_tree().change_scene_to_file("res://Scenes/kanji_game_scenes/kanji_level_4_bodyparts.tscn")

func _on_colors_pressed():
	get_tree().change_scene_to_file("res://Scenes/kanji_game_scenes/kanji_level_5_colors.tscn")

func _on_time_pressed():
	get_tree().change_scene_to_file("res://Scenes/kanji_game_scenes/kanji_level_6_time.tscn")



