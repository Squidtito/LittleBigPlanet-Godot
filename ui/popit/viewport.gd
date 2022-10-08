extends Node

func _ready():
	pass
	#getmodel(load('res://sackboi/Extra Textures/data.farc.530_1.png'))
func getmodel(skin):
	$Control/SubViewportContainer/SubViewport/ps4sackboyeevee.Skin(skin)
	var img = get_viewport()
	$TextureRect.texture = img
	
	print(img)
	return img
