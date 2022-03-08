extends Area2D


export(String) var slot_target

export(NodePath) var hud_path

onready var hud = get_node(hud_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		print(str("drop_data: ",$"/root/Globals".active_cell_part))

func _on_Area2D_mouse_entered():
	var active_cell_part = $"/root/Globals".active_cell_part
	if active_cell_part == slot_target:
		print("matched")
		$"/root/Globals".total_score += 1
		$Drop.play()
		hud.PlayCorrectAnswer()
		$"/root/Globals".set(active_cell_part+"_enabled", true)
	else:
		print("unmatched")
		$Error.play()
		$"/root/Globals".set(active_cell_part+"_enabled", false)
		hud.PlayWrongAnswer()
