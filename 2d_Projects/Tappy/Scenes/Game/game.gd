extends Node

const PIPES = preload("res://Scenes/Pipes/Pipes.tscn")
#creates circular reference with GAME
const MAIN = preload("res://Scenes/Main/Main.tscn")
# Quick and dirty to fix circular reference.
#var MAIN = load("res://Scenes/Main/Main.tscn")

@onready var pipes_holder: Node = $PipesHolder
@onready var upper_spawn: Marker2D = $UpperSpawn
@onready var lower_spawn: Marker2D = $LowerSpawn
#decouple to the SignalHub
#@onready var game_ui: GameUi = $CanvasLayer/GameUI

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		GameManager.load_main_scene()

func _on_spawn_timer_timeout() -> void:
	spawn_pipes()
	
func spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	var y_posision: float = randf_range(
		upper_spawn.position.y, lower_spawn.position.y
	)
	new_pipes.position = Vector2(
		upper_spawn.position.x, y_posision
	)
	pipes_holder.add_child(new_pipes)

# decouple for the SignalHub
#func _on_tappy_on_plane_died() -> void:
#	game_ui.on_plane_died()
