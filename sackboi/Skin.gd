extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	#Skin(load("res://sackboi/Extra Textures/data.farc.530_1.png"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func Skin(file):
	var test =43
	while not test == 60:
		if not test == 48:
			if not test == 50:
				var mat = StandardMaterial3D.new()
				var ob = get_node('Armature_0/Skeleton3D/' + 'Object_' + str(test))
				mat.set_texture(0, file)
				ob.set_surface_override_material(0, mat)
		test += 1
