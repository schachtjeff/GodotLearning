extends Node2D

#@onready var test: Node2D = $Test



func _init() -> void:
	print("_init [%s] [%s]" % [name, get_instance_id()])
	

func _enter_tree() -> void:
	print("_enter_tree [%s] [%s]" % [name, get_instance_id()])
	
	
func _exit_tree() -> void:
	print("_exit_tree [%s] [%s]" % [name, get_instance_id()])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("_ready [%s] [%s]" % [name, get_instance_id()]) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("_Process", delta)
	pass

# Called at a fixed 60fps by default
func _physics_process(delta: float) -> void:
	#print("_physics_Process", delta)
	pass
