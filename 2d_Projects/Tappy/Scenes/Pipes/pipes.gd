extends Node2D

class_name Pipes

const SPEED: float = 120.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _physics_process(delta: float) -> void:
	# Make the pipes scrolling on SPEED
	position.x -= SPEED * delta


func _on_screen_notifier_screen_exited() -> void:
	# Release pipe after exiting screen
	queue_free()


func _on_life_timer_timeout() -> void:
	# if the timer has run out, really want to ensure we free up the pipes.
	# Only if notifier above hasn't fired.  When minimizing the screen.
	queue_free()
