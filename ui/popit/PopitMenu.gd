extends Control
var icon = preload("res://ui/popit/viewport.tscn").instantiate()
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
		var index = -1
		FileAccess
		var dir = DirAccess.open(path)
		dir.list_dir_begin()
		var file_name = dir.get_next()
		print(file_name)
		while not file_name == "":
			print("Found file: " + file_name)
			file_name = dir.get_next()
			if not file_name.ends_with(".import"):
				index += 1
				#var ihatemylife = icon.getmodel(load(str(path) + str(file_name)))
				#add_child(ihatemylife)
				#ihatemylife.name = str(index)+'p'
				#$Popit.texture = get_node(str(index)+'p')
		
				var texture = Sprite2D.new()
				texture.texture =load(str(path) + str(file_name))
				texture.visible = false
				texture.name = str(index)
				add_child(texture)
				$ItemList.add_icon_item(get_node(str(index)).texture, true)
				
				#Get texture from nodes instead of icon
		print(file_name)


func _on_item_list_item_activated(index):
	print($ItemList.get_item_text(index))
	print($ItemList.get_item_icon(index))
	$"../sackboy".Skin(get_node(str(index)).texture)
