extends CSGMesh3D
var thing
var vertices = PackedVector3Array()
var arr_mesh = ArrayMesh.new()
var arrays = []

# Called when the node enters the scene tree for the first time.
func _ready():
		thing = get_node("MeshInstance3d")

		# Initialize the ArrayMesh.
		arrays.resize(Mesh.ARRAY_MAX)
		arrays[Mesh.ARRAY_VERTEX] = vertices

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("up"):
		thing.position.y += 0.1
	if Input.is_action_pressed("down"):
		thing.position.y -= 0.1
	if Input.is_action_pressed("right"):
		thing.position.x += 0.1
	if Input.is_action_pressed("left"):
		thing.position.x -= 0.1
	if Input.is_action_pressed("jump"):
		# Create the Mesh.
		arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
		var m = MeshInstance3D.new()
		m.mesh = arr_mesh
		vertices.push_back(Vector3(0, 1, 0))
		vertices.push_back(Vector3(1, 0, 0))
		vertices.push_back(Vector3(0, 0, 1))
		#remove_child(m)
		#add_child(m)
