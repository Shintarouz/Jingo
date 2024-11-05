extends Node2D

func _ready():
	pass # Replace with function body.


func _process(delta):
	$CanvasGroup/Label.text = str(JsonData.WoodCount)
	$CanvasGroup2/Label.text = str(JsonData.RockCount)
	$CanvasGroup3/Label.text = str(JsonData.VoidCount)
	$CanvasGroup/WoodBar.value = JsonData.WoodCount
	$CanvasGroup2/RockBar.value = JsonData.RockCount
	$CanvasGroup3/VoidBar.value = JsonData.VoidCount
	$CanvasGroup/WoodBar.max_value = JsonData.WoodCountMax
	$CanvasGroup2/RockBar.max_value = JsonData.RockCountMax
	$CanvasGroup3/VoidBar.max_value = JsonData.VoidCountMax
