extends Control
var Open_check : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	#tween.create()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if Open_check == false:
		$ShopMenu.visible = true
		ShopMenuOpenAnimation()
	else:
		ShopMenuCloseAnimation()
		await get_tree().create_timer(0.3).timeout
		$ShopMenu.visible = false

func _on_button_2_pressed():
	pass # Replace with function body.


func _on_button_3_pressed():
	pass # Replace with function body.


func _on_button_4_pressed():
	pass # Replace with function body.

func ShopMenuOpenAnimation():
	Open_check = true
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	var sprite_2d = get_node("ShopMenu")
	var scale = Vector2(1, 1)
	#var scale2 = Vector2(1, 1)
	var duration = 0.3
	#tween.tween_property(sprite_2d, "scale", scale2, duration)
	tween.tween_property(sprite_2d, "scale", scale, duration)

func ShopMenuCloseAnimation():
	Open_check = false
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	var sprite_2d = get_node("ShopMenu")
	var scale = Vector2(0.1, 0.1)
	#var scale2 = Vector2(1, 1)
	var duration = 0.3
	#tween.tween_property(sprite_2d, "scale", scale2, duration)
	tween.tween_property(sprite_2d, "scale", scale, duration)
