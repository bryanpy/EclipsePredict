extends Control

var open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Close")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("space"):
		if open:
			$AnimationPlayer.play("Close")
		else:
			$AnimationPlayer.play("Open")
		open = !open
	pass


func _on_toggle_side_bar_pressed():
	if open:
			$AnimationPlayer.play("Close")
	else:
		$AnimationPlayer.play("Open")
	open = !open
	pass
