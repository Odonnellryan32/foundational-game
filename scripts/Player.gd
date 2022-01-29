extends KinematicBody2D

enum AnimState {IDLE, LEFT, RIGHT}

# Declare member variables here. Examples:
export var speed = 150 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var curr_state = AnimState.IDLE


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	screen_size = get_viewport_rect().size
	

func start(pos):
	position = pos
	$AnimatedSprite.play()
	show()
	$CollisionShape2D.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		_set_AnimState(AnimState.LEFT)
	elif Input.is_action_pressed("move_right"):
		velocity.x += 1
		_set_AnimState(AnimState.RIGHT)		
		
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	elif Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	
	if velocity == Vector2.ZERO:
		_set_AnimState(AnimState.IDLE)
		
	move_and_collide(velocity * delta * speed)


func _set_AnimState(state):
	if curr_state == state:
		return
		
	curr_state = state
	
	match curr_state:
		AnimState.IDLE:
			$AnimatedSprite.animation = "idle"
		AnimState.LEFT:
			$AnimatedSprite.animation = "walk"
			$AnimatedSprite.flip_h = true
		AnimState.RIGHT:
			$AnimatedSprite.animation = "walk"
			$AnimatedSprite.flip_h = false
