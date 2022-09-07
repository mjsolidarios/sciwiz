extends Button

export var path = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Button_pressed():
	$Click.play()
	$"/root/Globals".goto_scene(path)
	$"/root/Globals".ans_score = 0
