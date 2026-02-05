extends Node

const MAIN = preload("res://Scenes/Main/Main.tscn")
const GAME = preload("res://Scenes/Game/Game.tscn")
const SIMPLE_CHANGE = preload("res://Scenes/Changes/SimpleChange.tscn")
const COMPLEX_CHANGE = preload("res://Scenes/Changes/ComplexChange.tscn")

var next_scene: PackedScene
var cx: ComplexChange

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Transition between main to fade to game
	cx = COMPLEX_CHANGE.instantiate()
	add_child(cx)

func change_to_next() -> void:
	if next_scene:
		get_tree().change_scene_to_packed(next_scene)

func start_transition(to_scene: PackedScene) -> void:
	next_scene = to_scene
	cx.play_anim()

func load_main_scene() -> void:
	start_transition(MAIN)
	#next_scene = MAIN
	#get_tree().change_scene_to_packed(SIMPLE_CHANGE)
	
func load_game_scene() -> void:
	start_transition(GAME)
	#next_scene = GAME
	#get_tree().change_scene_to_packed(SIMPLE_CHANGE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
