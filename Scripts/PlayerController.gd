extends KinematicBody2D

# Declare member variables here.
export var movementOn = true
export var sideScrollMovement = true
export var pickup_on = true
export var speed = 128
export var runSpeed = 240
export var jump = 256
export var gravity = 8
var move = Vector2(0, 0)
var platUp = Vector2(0, -1)
var gameCore

# Called when the node enters the scene tree for the first time.
func _ready():
	# We will need this later.
	gameCore = get_node("/root/GameCore")
	if gameCore:
		gameCore.coolThing()

# Called every physics frame.
func _physics_process(_delta):
	# What speed of movement?
	var moveSpeed = speed
	if Input.is_action_pressed("action_2"):
		moveSpeed = runSpeed
	# Is movement enabled at the moment?
	if movementOn:
	# Horizontal movement
		move.x = 0
		if Input.is_action_pressed("action_left"): move.x = -moveSpeed
		if Input.is_action_pressed("action_right"): move.x = moveSpeed
		# Vertical movement - depends on mode.
		if sideScrollMovement:
			var onFloor = is_on_floor()
			var hitHead = is_on_ceiling()
			# Gravity - just fall & jump.
			move.y += gravity
			if onFloor or hitHead:
				move.y = 2
			if Input.is_action_just_pressed("action_1"):
				move.y -= jump
		else:
			move.y = 0
			if Input.is_action_pressed("action_up"): move.y = -moveSpeed
			if Input.is_action_pressed("action_down"): move.y = moveSpeed
	elif sideScrollMovement:
		move.y += gravity
	# Just move.
	var _mover = move_and_slide(move, platUp)
