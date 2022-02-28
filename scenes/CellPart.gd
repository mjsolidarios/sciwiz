extends TextureButton

export(Texture) var cell_image
export(String) var identity_name
export(NodePath) var hud_path

onready var mat = preload("res://shaders/outline-highlighted.tres")
onready var hud = get_node(hud_path)

var size = 250

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_drag_data(_pos):
	# Use a 2D sprite as drag preview.
	var cp = TextureRect.new()
	cp.texture = cell_image
	cp.stretch_mode = 1
	cp.expand = true
	cp.set_size(Vector2(size,size))
	cp.material = mat
	
	var c = Control.new()
	c.add_child(cp)
	cp.rect_position = -0.5 * cp.rect_size
	
	set_drag_preview(c)	
	
	print(str("id: ",identity_name))
	$"/root/Globals".active_cell_part = identity_name
	
	$Click.play()
	
	hud.DisplayInfo()
	
	return identity_name


func can_drop_data(_pos, data):
	return typeof(data) == TYPE_COLOR


func _on_CellPart_pressed():
	print(str("id: ",identity_name))
	$"/root/Globals".active_cell_part = identity_name
	hud.DisplayInfo()
	
