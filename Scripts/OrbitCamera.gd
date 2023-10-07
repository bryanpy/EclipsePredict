extends Node3D


var zoom = 0
var zoom_sensitivity = 20

var orbit_speed = 2.0

var temp_rotation = 0
var angle = Vector3(0,0,0)

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			zoom += zoom_sensitivity
			zoom = clamp(zoom,-200,150)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			zoom -= zoom_sensitivity
			zoom = clamp(zoom,-200,150)

func _process(delta):
	position = get_parent().get_node("Sun/EarthPivot/Earth").get_global_position()
	
	if Input.is_action_pressed("right"):
		global_rotate(Vector3(0,1,0),(orbit_speed/100))
	if Input.is_action_pressed("left"):
		global_rotate(Vector3(0,-1,0),orbit_speed/100)
	if Input.is_action_pressed("up"):
		temp_rotation = rotation.y
		rotation.y = 0
		global_rotate(Vector3(1,0,0),orbit_speed/100)
		rotation.y = temp_rotation
	if Input.is_action_pressed("down"): 
		temp_rotation = rotation.y
		rotation.y = 0
		global_rotate(Vector3(-1,0,0),orbit_speed/100)
		rotation.y = temp_rotation
	$OrbitCamera.position.z = zoom-200
