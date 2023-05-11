extends TextureButton

export var path = ""

func GotoScene():
	$Click.play()
	$"/root/Globals".goto_scene(path)
	$"/root/Globals".ans_score = 0
	$"/root/Globals".reset_cell()
