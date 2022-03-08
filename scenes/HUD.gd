extends Control

var file = File.new()
var data
export(Texture) var correct_image
export(Texture) var wrong_image

func _ready():
	file.open("res://data/organelles.json", File.READ)
	data = parse_json(file.get_as_text())	

func PlayCorrectAnswer():
	$AnimationPlayer.play("correct")

func PlayWrongAnswer():
	$AnimationPlayer.play("wrong")
	print("wrong")

func DisplayInfo():
	var active_cell_part = $"/root/Globals".active_cell_part
	print(active_cell_part)
	$VBoxContainer/Title.text = str(active_cell_part).replace("_", " ").to_upper()
	$VBoxContainer/Description.text = data[active_cell_part][randi() % len(data[active_cell_part])]

#func _process(delta):
#	if $"/root/Globals".active_cell_part != "":
#		pass
#	else:
#		print("no match")
