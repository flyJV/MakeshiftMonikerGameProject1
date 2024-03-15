extends KinematicBody2D

# Declare member variables here.
export var move_H_on = true
export var move_V_on = true
export var gravity_active = true 
export var speed = 64
export var fall_sofen = 98

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	# Function variables
	var move = Vector2(0, 0)
	var fall = 0
	
	# Gravity - just fall.
	if (gravity_active):
		if ((fall <= 0) && !is_on_floor()):
			fall = 1
		# Clear.
		move.x = 0
		# Calculate
		fall += (fall * fall_sofen)
		move.y = fall
		# Drop.
		move_and_slide(move)
	# Clear.
	move.y = 0
	move.x = 0
	# Horizontal movement
	if (move_H_on):
		if (Input.is_action_pressed("action_left")):
			move.x += -1
		if (Input.is_action_pressed("action_right")):
			move.x = 1
	# Vertical movement
	if (move_V_on):
		if (Input.is_action_pressed("action_up")):
			move.y += -1
		if (Input.is_action_pressed("action_down")):
			move.y += 1
	# Just move.
	move_and_slide((move*speed))
	pass
