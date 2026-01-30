extends CharacterBody2D

#var _gravity: float = 200.0
# Source the project settings
var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")
var _jumped: bool = false

const JUMP_POWER: float = -350

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		_jumped = true
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# Set the veloctiy of the physics for Tappy to move to 
	#   the right (don't multiply with delta)
	#velocity.x = 100.0
	velocity.y += _gravity * delta
	
	if _jumped:
		velocity.y = JUMP_POWER
		_jumped = false
		
	# May not use this as it's about FPS and will be noticable by players
	# It's about polling the process vs. telling you from _unhandled_input.
	#if Input.is_action_just_pressed("power"):
	#	velocity.y = JUMP_POWER
	
	move_and_slide()
	
	if is_on_floor():
		print("is_on_floor")
		die()
	if is_on_ceiling():
		print("is_on_ceiling")
	
func die() -> void:
	set_physics_process(false)
	animated_sprite_2d.stop()
