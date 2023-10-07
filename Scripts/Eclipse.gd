extends RayCast3D

func _ready():
	pass

func _process(delta):
	position = get_parent().get_node("Sun/EarthPivot/Earth/MoonStuff/MoonPivot/Moon").get_global_position()
	rotate_object_local(Vector3(0, 1, 0),TimeGlobal.rotateEveryYear(delta))
	get_parent().get_node("UI/Eclipse").text = "Eclipse: False"
	if is_colliding():
		get_parent().get_node("UI/Eclipse").text = "Eclipse: True"
	pass


