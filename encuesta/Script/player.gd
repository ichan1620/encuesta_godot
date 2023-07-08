extends KinematicBody2D

export var moveSpeed = 200
const maxSpeed = 50

const jumpHeight = 500
const up = Vector2(0,-1)
const gravity = 800

var is_jumping = false

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

var motion = Vector2()

# warning-ignore:unused_argument
func _physics_process(delta):
	
	motion = Vector2()
	#motion.y += gravity * delta
	
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
	   motion.x = motion.x + 10
	
	if Input.is_action_pressed("ui_left"):
	   motion.x = motion.x - 10
	
	if Input.is_action_pressed("ui_up"):
		motion.y -= 10
	
	if Input.is_action_pressed("ui_down"):
		motion.y += 10
	
	else:
		animationPlayer.play("muñequito")
		friction  = true 
		
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			motion.y = -jumpHeight
			is_jumping = true
			
	motion = motion.normalized() * moveSpeed
	motion = move_and_slide(motion, Vector2(0,-1))
	
	if is_on_floor():
		is_jumping = false
