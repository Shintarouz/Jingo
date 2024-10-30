extends Node2D

func _ready():
	pass # Replace with function body.


func _process(delta):
	$CanvasGroup/Label.text = str(JsonData.WoodCount)
