extends Node2D

class_name Hobbit

signal kill_wizard

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		kill_wizard.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(PI * delta)
	
func hit_by_spell() -> void:
	scale = Vector2(0.3, 0.3)
	set_process(false)
