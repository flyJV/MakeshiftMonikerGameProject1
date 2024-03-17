extends Area2D

onready var gameCore = get_node("/root/GameCore")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_area_entered(_area):
	$CollisionShape2D.set_deferred("disabled", true)
	$Sprite.visible = false
	gameCore.keys += 1
	print_debug("Got me!")
