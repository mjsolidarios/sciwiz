extends Node


var active_cell_part = ""
var active_lens = ""
var total_score = 0
var current_scene = null

var cytoplasm_enabled = false
var golgi_bodies_enabled = false
var centrioles_enabled = false
var lysosomes_enabled = false
var mitochondria_enabled = false
var nucleus_enabled = false
var rough_endoplasmic_reticulum_enabled = false
var smooth_endoplasmic_reticulum_enabled = false
var vacuoles_animal_enabled = false
var vacuoles_plant_enabled = false
var plasma_membrane_enabled = false
var cell_wall_enabled = false
var ribosomes_enabled = false
var vesicles_enabled = false
var chloroplast_enabled = false

var loader
var wait_frames
var time_max = 100 # msec

var ans_score = 0

var active_index1_for_guessing_game = 0
var active_index2_for_guessing_game = 0
var max_index_for_guessing_game = 0
var guessing_game_score = 0
var guessing_game_life = 3
var guessing_game_question_pool = randi()%[1,2,3,4,5,6,7,8,9,10,11,12,13,14].size() #randomize
var current_question_pool_index = 0


func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instance()

	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)
