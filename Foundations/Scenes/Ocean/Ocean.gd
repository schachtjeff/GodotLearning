extends Node2D


@onready var plane: Sprite2D = $Plane
@onready var helicopter: Sprite2D = %Helicopter

var _target: Vector2 = Vector2.ZERO

func _unhandled_input(event: InputEvent) -> void:
	# Set Target of object example when left click (already assigned) is pressed.
	if event.is_action_pressed("SetTarget"):
		_target = get_global_mouse_position()
		#plane.look_at(get_global_mouse_position())
		plane.look_at(_target)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#plane.rotation = helicopter.global_rotation
	#helicopter.global_rotation = plane.global_rotation
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Put some spin on the plane
	#plane.rotation_degrees += 30.0 * delta
	#plane.position.x = plane.position.x + 50.0 * delta
	# This is moving slower than plane because scale may be lower than plane.
	#helicopter.position.x -= helicopter.global_position.x * delta
	#helicopter.position.x -= 50.0 / helicopter.global_scale.x * delta
	#helicopter.position.y -= 50.0 * delta
	#helicopter.position.y -= 30.0 * delta
	# Same as above, just more concise.
	#helicopter.translate(Vector2(30.0, 50.0) * delta)
	#helicopter.global_translate(Vector2(30.0, 50.0) * delta)
	
	# The actual movement of the plane to the mouse selection.
	#plane.position = plane.position.move_toward(_target, 50.0 * delta)
	
	# Move local topic.  Does the length of the movement to new position with normalize.
	#plane.position += plane.transform.x.normalized() * 50.0 * delta
	plane.move_local_x(50.0 * delta)
	
	#print("helicopter.scale: ", helicopter.scale)
	# Actual visual position on screen is global_position.
	#print("helicopter.global_scale: ", helicopter.global_scale)
	#print("helicopter.rotation: ", rad_to_deg(helicopter.rotation)) 
	#print("helicopter.global_rotation: ", rad_to_deg(helicopter.global_rotation))
