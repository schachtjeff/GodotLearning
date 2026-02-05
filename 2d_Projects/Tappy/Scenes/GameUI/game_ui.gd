extends Control

class_name GameUi

@onready var game_over_label: Label = $MarginContainer/GameOverLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	SignalHub.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func on_plane_died() -> void:
	game_over_label.show()
