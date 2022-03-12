extends Control


func _ready():
	get_node("Button").connect("pressed", self, "GotoScene", ["res://scenes/AnimalCell.tscn"])
	get_node("Button2").connect("pressed", self, "GotoScene", ["res://scenes/PlantCell.tscn"])

func GotoScene(scene):
	$Click.play()
	$"/root/Globals".total_score = 0
	$"/root/Globals".goto_scene(scene)
