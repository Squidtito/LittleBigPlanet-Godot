extends CharacterBody3D
var vel = 0
var up = 0
var layer = 2
var movement = 1
var layerb_or_f = 'f'
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if movement == 1:
		if is_on_floor():
			up = 0
			if Input.is_action_pressed("jump"):
				up = 100
		else:
			up -= 4

		if Input.is_action_just_pressed("up"):
				layer -= 1
				layerb_or_f = 'b'
		elif Input.is_action_just_pressed("down"):
			
			if not layer == 2:
				layer += 1
				layerb_or_f = 'f'
		position.z = layer*15-50
		check_col(layerb_or_f)
		
		if Input.is_action_pressed("left"):
			if not $sackboy.rotation.y <= -1:
				$sackboy.rotate_y(-0.1)
				vel = -.6
		elif Input.is_action_pressed("right"):
			if not $sackboy.rotation.y >= 1:
				$sackboy.rotate_y(0.1)

				vel = .6
		else:
			if $sackboy.rotation.y<=-0.1:
				$sackboy.rotate_y(0.1)
			elif $sackboy.rotation.y>=0.1:
				$sackboy.rotate_y(-0.1)
			vel = 0
		velocity = Vector3(vel*130,up,0)
		move_and_slide()
		
func check_col(one):
	pass
