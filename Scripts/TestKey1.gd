extends Area2D
# Variables
onready var gameCore = get_node("/root/GameCore")
var canGet = false
# When input is polled.
func _input(_event):
	# Pick key up if key pressed.
	if (canGet && Input.is_action_just_pressed("action_3")):
		$CollisionShape2D.set_deferred("disabled", true)
		$Sprite.visible = false
		canGet = false
		gameCore.keys += 1
		print("Got me!")
# Area2D checks.
func _on_Area2D_area_entered(_area):
	canGet = true
func _on_Key_area_exited(_area):
	canGet = false
