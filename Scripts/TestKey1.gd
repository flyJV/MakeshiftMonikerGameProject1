extends Node
# Variables
onready var gameCore = get_node("/root/GameCore")
var canGet = false

# Make the key disappear, and disable collider.
func yeet():
	$KeyCollide/CollisionShape2D.set_deferred("disabled", true)
	$Sprite.visible = false

# When input is polled.
func _input(_event):
	# Pick key up if key pressed.
	if canGet and Input.is_action_just_pressed("action_3"):
		$KeyCollide/CollisionShape2D.set_deferred("disabled", true)
		$Sprite.visible = false
		canGet = false
		gameCore.keys += 1
		print("Got key!")


# Area2D checks.
func _on_Key_area_entered(_area):
	canGet = true
func _on_Key_area_exited(_area):
	canGet = false
