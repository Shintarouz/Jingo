extends Node2D

func _ready():
	pass # Replace with function body.


func _process(delta):
	$CanvasGroup/Label.text = str(JsonData.WoodCount)
	$CanvasGroup2/Label.text = str(JsonData.RockCount)
	$CanvasGroup3/Label.text = str(JsonData.VoidCount)
