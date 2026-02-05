extends CanvasLayer

class_name ComplexChange

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func play_anim() -> void:
	animation_player.play("fade")

# Called when the node enters the scene tree for the first time.
func switch_scene() -> void:
	#await get_tree().create_timer(1.0).timeout
	GameManager.change_to_next()


# Called every frame. 'delta' is the elapsed time since the previous frame.
# _process(delta: float) -> void:
#	pass
