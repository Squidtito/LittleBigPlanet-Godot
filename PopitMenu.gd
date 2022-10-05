extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	
	self.visible = false
	dir_contents("res://sackboi/Extra Textures/")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Q"):
		if self.visible == false:
			self.visible = true
			$"../../CharacterBody3d".movement = 0
		else:
			self.visible = false
			$"../../CharacterBody3d".movement = 1
		

func dir_contents(path):
		FileAccess
		var dir = DirAccess.open(path)
		dir.list_dir_begin()
		var file_name = dir.get_next()
		print(file_name)
		while not file_name == "":
			print("Found file: " + file_name)
			file_name = dir.get_next()
			if not file_name.ends_with(".import"):
				$ItemList.add_item( str(file_name),load(str(path) + str(file_name)), true)
		print(file_name)


func _on_item_list_item_activated(index):
	print($ItemList.get_item_text(index))
	$"../sackboy".Skin(load('res://sackboi/Extra Textures/' + str($ItemList.get_item_text(index))))
