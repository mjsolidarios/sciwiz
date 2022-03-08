extends Node2D

func _process(delta):
	$cytoplasm.visible = $"/root/Globals".cytoplasm_enabled
	$golgi_bodies.visible = $"/root/Globals".golgi_bodies_enabled
	$centrioles.visible = $"/root/Globals".centrioles_enabled
	$lysosomes.visible = $"/root/Globals".lysosomes_enabled
	$mitochondria.visible = $"/root/Globals".mitochondria_enabled
	$nucleus.visible = $"/root/Globals".nucleus_enabled
	$rough_endoplasmic_reticulum.visible = $"/root/Globals".rough_endoplasmic_reticulum_enabled
	$smooth_endoplasmic_reticulum.visible = $"/root/Globals".smooth_endoplasmic_reticulum_enabled
	$central_vacuole.visible = $"/root/Globals".central_vacuole_enabled
	$plasma_membrane.visible = $"/root/Globals".plasma_membrane_enabled
	$ribosomes.visible = $"/root/Globals".ribosomes_enabled
	$vesicles.visible = $"/root/Globals".vesicles_enabled
