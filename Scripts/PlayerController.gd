extends KinematicBody2D

# Declare member variables here.
export var active = true 
export var gravity_active = true 
export var speed = 64
export var fall_sofen = 0.83

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	# Function variables
	var move = Vector2(0, 0)
	var fall = 0
	
	# 
	if (gravity_active):
		fall += (fall * fall_sofen)
	
	# Respond to controler keys if active.
	#  Keep physics running otherwise, but don't allow movement.
	if (active):
		# Clear.
		move.y = 0
		move.x = 0
		# Horizontal movement
		if (Input.is_action_pressed("action_left")):
			move.x += -1
		if (Input.is_action_pressed("action_right")):
			move.x = 1
		# Vertical movement
		if (Input.is_action_pressed("action_up")):
			move.y += -1
		if (Input.is_action_pressed("action_down")):
			move.y += 1
	move_and_slide((move*speed))
	pass
