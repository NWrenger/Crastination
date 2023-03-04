extends Node2D

@export var NextScene: PackedScene
var TotalLevel := 11


func Area_entered(_body):
	$AnimationFade.play("FadeOut")
	$Light.energy = 3
	$Light.scale = Vector2(1.5,1.5)
	await $AnimationFade.animation_finished
	# warning-ignore:return_value_discarded
	get_tree().change_scene_to_packed(NextScene)

func _enter_tree():
	#todo proof for less work
	for i in TotalLevel:
		if get_parent().name == "Level" + str(i):
			get_node("/root/Save").level = i
