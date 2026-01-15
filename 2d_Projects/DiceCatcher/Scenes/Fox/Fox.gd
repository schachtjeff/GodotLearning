extends Area2D

# Fox is set Globally Group as 'stoppable' when Game is paused.
class_name Fox

# Speed for which Fox can move left or right
@export var speed: float = 200.0

#To be able to flip the fox horizontally when moving left or right.
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _physics_process(delta: float) -> void:
	# Using the 'ui-left' and 'ui-right' defaults from project inputs.
	# With far fewer code with using 'get_axis' vs conditions and is_action_pressed
	var move: float = Input.get_axis("ui_left", "ui_right")
	#var move: float = 100.00
	# Use of Input class
	#if Input.is_action_pressed("ui_left"):
	#	move -= speed
	#if Input.is_action_pressed("ui_right"):
	#	move += speed
	
	# One way to flip the fox horizontally, but if I let go of right ...
	#	automatically flips back.
	#sprite_2d.flip_h = move > 0.0
	# So, check if it's not approximately zero, then fox will keep look right
	if !is_zero_approx(move):
		sprite_2d.flip_h = move > 0.0
		
	# Real movement of the fox
	#position.x += move * delta
	position.x += move * delta * speed
	
