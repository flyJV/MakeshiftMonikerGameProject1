# GameCore - Code that should be referred to for main game stuff.
# Should extend a normal Node.
extends Node

# Declare member variables here. Examples:
export var keys = 0
export (Array, String) var levels
export (Array, Vector2) var startPos
onready var player = $Player
var lastLevel

func loadWorld(levelID, posID):
	var loadLevel = load(levels[levelID])
	if (lastLevel):
		lastLevel.free()
	if (loadLevel):
		lastLevel = loadLevel.instance()
		call_deferred("add_child", lastLevel)
		player.position = (startPos[posID])

func _ready():
	loadWorld(0, 0)

# OK, so it just quits right now
func _input(_event):
	if Input.is_action_just_released("ui_cancel"):
		get_tree().quit(0)
	if Input.is_action_just_pressed("ui_end"):
		loadWorld(1, 1)

# Just a test thing at the moment.
func coolThing():
	print("Found gameCore's coolThing!")
