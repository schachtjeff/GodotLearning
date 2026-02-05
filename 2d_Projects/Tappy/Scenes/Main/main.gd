extends Control

@onready var high_score_label: Label = $MC/HighScoreLabel

#preload the game while we are in main.
# moved to gameManager
#const GAME = preload("res://Scenes/Game/Game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	update_highscore_label()

func update_highscore_label() -> void:
	high_score_label.text = "%03d" % ScoreManager.high_score

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		GameManager.load_game_scene()
