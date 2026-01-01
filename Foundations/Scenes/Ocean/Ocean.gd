extends Node2D


@onready var plane: Sprite2D = $Plane
@onready var helicopter: Sprite2D = %Helicopter


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	plane.position.x = plane.position.x + 50.0 * delta
	# This is moving slower than plane because scale may be lower than plane.
	#helicopter.position.x -= helicopter.global_position.x * delta
	helicopter.position.x -= 50.0 / helicopter.global_scale.x * delta
	
	#print("helicopter.scale: ", helicopter.scale)
	# Actual visual position on screen is global_position.
	#print("helicopter.global_scale: ", helicopter.global_scale)
	pass
