extends Node2D

class_name Pipes

const SPEED: float = 120.0

@onready var laser: Area2D = $Laser

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _physics_process(delta: float) -> void:
	# Make the pipes scrolling on SPEED
	position.x -= SPEED * delta

# Handle case where extra point is scored when tappy has exited laser when loading.
func on_plane_died() -> void:
	disconnect_laser()
	
func disconnect_laser() -> void:
	if laser.body_exited.is_connected(_on_laser_body_exited):
		laser.body_exited.disconnect(_on_laser_body_exited)

func _on_screen_notifier_screen_exited() -> void:        
	# Release pipe after exiting screen
	queue_free()


func _on_life_timer_timeout() -> void:
	# if the timer has run out, really want to ensure we free up the pipes.
	# Only if notifier above hasn't fired.  When minimizing the screen.
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is Tappy:
		print("on_body_entered:", body.name)
		body.die()


func _on_laser_body_exited(body: Node2D) -> void:
	if body is Tappy:
		print("on_laser_body_exited:", body.name)
		# handle edge case of extra 2x points to immediately disconnect the laser.
		disconnect_laser()
		SignalHub.emit_on_point_scored()
