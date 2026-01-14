extends Node2D

class_name Wizard

signal cast_spell

@onready var timer: Timer = $Timer
@onready var spell_timer: Timer = $SpellTimer

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
	
func hit_by_hobbit() -> void:
	spell_timer.stop()
	scale = Vector2(0.1, 0.1)


func _on_timer_timeout() -> void:
	show()


func _on_spell_timer_timeout() -> void:
	cast_spell.emit()
