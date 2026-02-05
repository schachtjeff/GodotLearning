extends Node

const MAIN = preload("res://Scenes/Main/Main.tscn")
const GAME = preload("res://Scenes/Game/Game.tscn")

func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)
	
func load_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME)

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
