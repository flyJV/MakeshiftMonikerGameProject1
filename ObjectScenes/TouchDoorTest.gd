extends StaticBody2D

onready var a = get_node("Area2D")

func _ready():
	pass
	
func _physics_process(_delta):
	if (Input.is_action_just_pressed("action_3")):
		visible = !visible
		$CollisionShape2D.disabled = !($CollisionShape2D.disabled)
	pass
