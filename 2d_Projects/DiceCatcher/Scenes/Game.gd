extends Node2D

#preload a resource with spawning the dice
const DICE = preload("res://Scenes/Dice/Dice.tscn")
const MARGIN: float = 80.0
const STOPPABLE_GROUP: String = "stoppable"

@onready var spawn_timer: Timer = $SpawnTimer

func _unhandled_input(event: InputEvent) -> void:
	#If you type the 'restart' key, reloads the game.
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_dice()
	
	
func spawn_dice() -> void:
	#Same as if we were instantiating a child scene of new dice to the game scene.
	var new_dice: Dice = DICE.instantiate()
	#Get the x width of the game scene to randomize dice location.
	var vpr: Rect2 = get_viewport_rect()
	var new_x: float = randf_range(
		vpr.position.x + MARGIN,
		vpr.end.x - MARGIN
	)
	new_dice.position = Vector2(new_x, -MARGIN)
	# Dice to check for game over.
	new_dice.game_over.connect(_on_dice_game_over)
	add_child(new_dice)
	
	
func pause_all() -> void:
	spawn_timer.stop()
	var to_stop: Array[Node] = get_tree().get_nodes_in_group(STOPPABLE_GROUP)
	for item in to_stop:
		item.set_physics_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _on_dice_game_over() -> void:
	pause_all()
	

func _on_spawn_timer_timeout() -> void:
	spawn_dice()
