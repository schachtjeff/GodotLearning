extends Area2D

class_name Dice

signal game_over

const SPEED: float = 80.0
const ROTATION_SPEED: float = 5.0

@onready var sprite_2d: Sprite2D = $Sprite2D


var rotation_direction: float = 1.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Random inclusive between 0 and 1
	#    will flip direction rotation if less than 0.5
	if randf() < 0.5: rotation_direction *= -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
	
	
func _physics_process(delta: float) -> void:
	position.y += delta * SPEED
	sprite_2d.rotate(delta * ROTATION_SPEED * rotation_direction)
	check_game_over()
	
	
func check_game_over() -> void:
	# Want to check the CanvasItem hits the bottom
	if get_viewport_rect().end.y < position.y:
		#print("Off screen")
		# Stops the physics process at game over of rotation with the dice.
		#set_physics_process(false)
		# Remove the node when it's no longer needed, or off screen.
		# Commenting alot of above only for this game as below is only needed.
		game_over.emit()
		queue_free()
	
