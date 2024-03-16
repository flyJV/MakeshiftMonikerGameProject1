extends KinematicBody2D

# Declare member variables here.
export var move_H_on = true
export var move_V_on = true
export var gravity_active = true
export var speed = 64
export var fall_rate = 2
var quiet
var gameCore

# Called when the node enters the scene tree for the first time.
func _ready():
	# We will need this later.
	gameCore = get_node("/root/GameCore")
	if (gameCore != null):
		gameCore.coolThing()

# Called every physics frame.
func _physics_process(_delta):
	# Function variables
	var move = Vector2(0, 0)
	var fall = 0
	
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
	# Gravity - just fall.
	if (gravity_active && !is_on_floor()):
		# A naive attempt at velocity.
		fall += fall_rate + fall
		# Calculate
		move.y += fall
	else:
		fall = 0
	# Just move.
	quiet = move_and_slide((move*speed))
	pass
