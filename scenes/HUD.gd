extends Control

var file = File.new()
var data
export(Texture) var correct_image
export(Texture) var wrong_image
export(int) var correct_max_counter = 0
export(int) var correct_current_counter = 0

func _ready():
	file.open("res://data/organelles.json", File.READ)
	data = parse_json(file.get_as_text())	

func PlayCorrectAnswer():
	$AnimationPlayer.play("correct")
	correct_current_counter+=1
	print("counter: "+ str(correct_current_counter))

func PlayWrongAnswer():
	$AnimationPlayer.play("wrong")
	print("wrong")

func DisplayInfo():
	var active_cell_part = $"/root/Globals".active_cell_part

	print(active_cell_part)
	var splits_string = active_cell_part.split("_", true, 1)
	if len(splits_string) > 1:
		if splits_string[1] == "animal" or splits_string[1] == "plant":
			if splits_string[1] == "animal":
				print("animal")
				$VBoxContainer/Title.text = "vacuoles".to_upper()
			else:
				print("plant")
				$VBoxContainer/Title.text = "central vacuole".to_upper()
		else:
			$VBoxContainer/Title.text = str(active_cell_part).replace("_", " ").to_upper()	
	else:
		$VBoxContainer/Title.text = str(active_cell_part).replace("_", " ").to_upper()
	var content = str(data[active_cell_part][len(data[active_cell_part])-1])
	$VBoxContainer/Description.text = content

func _process(delta):
	if correct_max_counter == correct_current_counter:
		get_node(".").get_parent().get_node("PanelComplete").show()
	else:
		get_node(".").get_parent().get_node("PanelComplete").hide()
