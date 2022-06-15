extends Control


func _ready():
	get_node("Control/PuzzCellButton").connect("pressed", self, "GotoScene", ["res://scenes/Main.tscn"])
	get_node("Control/MicroSimButton").connect("pressed", self, "GotoScene", ["res://scenes/MicroSim/MicroSimSub1.tscn"])
	get_node("Control/ReproDefendersButton").connect("pressed", self, "GotoScene", ["res://scenes/ReproDefender/ReproDefenderMain.tscn"])
	#get_node("Button3").connect("pressed", self, "GotoScene", ["res://scenes/PlantCell.tscn"])
	#get_node("Button4").connect("pressed", self, "GotoScene", ["res://scenes/PlantCell.tscn"])

func GotoScene(scene):
	$Click.play()
	$"/root/Globals".total_score = 0
	$"/root/Globals".goto_scene(scene)
