extends Node3D

var rotation_speed = 1.0
var time = 0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	time += delta

	get_parent().rotate_object_local(Vector3(0, 1, 0),TimeGlobal.rotateEveryYear(delta))
	$Spere.rotate_object_local(Vector3(0, 1, 0),TimeGlobal.rotateEveryDay(delta))
	get_parent().get_parent().get_node("SunLight").rotate_object_local(Vector3(0, 1, 0),TimeGlobal.rotateEveryYear(delta))
	
	$MoonStuff.rotate_y(TimeGlobal.rotateEveryYear(delta))
	
	$MoonStuff/MoonPivot.rotate_object_local(Vector3(0, 1, 0),TimeGlobal.rotationOfMoon(delta))

func _process(delta):
	get_parent().get_parent().get_parent().get_node("UI/Speed").text = "Speed: " + str(TimeGlobal.time_speed) + "x"
	
	if TimeGlobal.searching == true:
		TimeGlobal.time_speed = 1000000
		if get_parent().get_parent().get_parent().get_node("Eclipse").is_colliding():
			var collision = get_parent().get_parent().get_parent().get_node("Eclipse").get_collider()
			TimeGlobal.time_speed = 1000
			TimeGlobal.searching = false
	pass

func _on_forward_front_pressed():
	TimeGlobal.time_speed *= 10
	pass # Replace with function body.



func _on_forward_back_pressed():
	TimeGlobal.time_speed /= 10
	pass # Replace with function body.


func _on_pause_pressed():
	if TimeGlobal.time_speed != 0:
		TimeGlobal.time_speed = 0
	elif TimeGlobal.time_speed == 0:
		TimeGlobal.time_speed = 1
	pass # Replace with function body.


func _on_forward_next_pressed():
	TimeGlobal.searching = true
	pass # Replace with function body.
