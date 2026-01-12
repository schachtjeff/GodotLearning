@tool
extends EditorScript


# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	var aragorn: Character = Character.new(100, "Aragorn", "Bow")
	# Commenting out or could be deleted after the initialization
	#aragorn.health = 100
	#aragorn.name = "Aragorn"
	#aragorn.weapon = "Bow"
	
	
	var bart: Character = Character.new(50, "Bart", "Sling Shot")
	# Commenting out or could be deleted after the initialization
	#bart.health = 50
	#bart.name = "Bart"
	#bart.weapon = "Sling Shot"
	
	aragorn.print_info()
	bart.print_info()
	
	# Changing properties
	aragorn.set_health(30)
	bart._weapon = "skateboard"
	
	aragorn.print_info()
	bart.print_info()
	
	print(aragorn.get_health())
	
