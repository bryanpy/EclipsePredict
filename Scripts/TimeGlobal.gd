extends Node

var time_speed = 10000
var searching =  false

func _ready():
	pass

@warning_ignore("unused_parameter")
func _process(delta):
	pass

func rotateEveryDay(delta):
	return (((((delta/60)/60)/60)/24)*360)*TimeGlobal.time_speed

func rotateEveryYear(delta):
	return (((((delta/60)/60)/60)/24/365)*360)*TimeGlobal.time_speed

func rotationOfMoon(delta):
	return (((((delta/60)/60)/60)/24/27.3)*360)*TimeGlobal.time_speed
