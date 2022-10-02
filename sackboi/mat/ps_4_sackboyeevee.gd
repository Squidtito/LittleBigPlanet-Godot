extends CharacterBody3D
var vel = 0
var up = 0
var layer = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_on_floor():
		up = 0
		if Input.is_action_pressed("jump"):
			up = 100
	else:
		up -= 4
	
	

	if Input.is_action_just_pressed("ui_up"):
			layer -= 1
	elif Input.is_action_just_pressed("ui_down"):
			layer += 1
	position.z = layer*15-60
	if Input.is_action_pressed("ui_left"):
		if not self.rotation.y <= -1:
			self.rotate_y(-0.1)
			vel = -.6
	elif Input.is_action_pressed("ui_right"):
		if not self.rotation.y >= 1:
			self.rotate_y(0.1)

			vel = .6
	else:
		if self.rotation.y<=-0.1:
			self.rotate_y(0.1)
		elif self.rotation.y>=0.1:
			self.rotate_y(-0.1)
		vel = 0
	velocity = Vector3(vel*100,up,0)
	move_and_slide()
