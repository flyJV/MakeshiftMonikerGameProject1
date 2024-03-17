extends StaticBody2D

onready var gameCore = get_node("/root/GameCore")
export var locked = true
var canToggle = false

func _ready():
	pass
	
func _physics_process(_delta):
	if (Input.is_action_just_pressed("action_3") && canToggle):
		visible = !visible
		$CollisionShape2D.disabled = !($CollisionShape2D.disabled)

func _on_Area2D_area_entered(_area):
	if (gameCore.keys):
		gameCore.keys -= 1
		locked = false
	if (!locked):
		canToggle = true

func _on_Area2D_area_exited(_area):
	canToggle = false
