extends TextureButton

export var path = ""

func GotoScene():
	$Click.play()
	$"/root/Globals".goto_scene(path)
