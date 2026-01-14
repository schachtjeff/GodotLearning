extends Node2D

class_name Wizard

@onready var timer: Timer = $Timer

#var _elap: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Run through elapsed time and then go from hide to show.
	#_elap += delta
	#if !visible and _elap > 2.0:
	#if !visible and Time.get_ticks_msec() > 2000:
	#if !visible and timer.is_stopped():
	#	show()
	# All above is gone with below signal
	pass


func _on_timer_timeout() -> void:
	show()
