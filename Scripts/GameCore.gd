# GameCore - Code that should be referred to for main game stuff.
# Should extend a normal Node.
extends Node

# Declare member variables here. Examples:
export var keys = 0

# OK, so it just quits right now
func _input(_event):
	if (Input.is_action_just_released("ui_cancel")):
		get_tree().quit(0)

# Just a test thing at the moment.
func coolThing():
	print("Found me!")
