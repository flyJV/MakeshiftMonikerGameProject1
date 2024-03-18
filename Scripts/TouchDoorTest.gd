extends StaticBody2D
# Variables
onready var gameCore = get_node("/root/GameCore")
export var immediateOpen = true
export var locked = true
var canToggle = false
var open = false
# Run every physics frame.
func _physics_process(_delta):
	# Activate door on keypress, or immediately on first touch.
	if Input.is_action_just_pressed("action_3") or (immediateOpen and not open):
		if canToggle:
			visible = !visible
			$CollisionShape2D.disabled = !($CollisionShape2D.disabled)
			open = !open
			immediateOpen = false
# Area2D scans.
func _on_Area2D_area_entered(_area):
	# Unlock immediately if we got a key.
	if gameCore.keys:
		gameCore.keys -= 1
		locked = false
		print("Open Sesame!")
	if not locked:
		canToggle = true
func _on_Area2D_area_exited(_area):
	canToggle = false
