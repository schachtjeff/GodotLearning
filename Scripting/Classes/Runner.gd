@tool
extends EditorScript


# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	var aragorn: Character = Character.new()
	aragorn.health = 100
	aragorn.name = "Aragorn"
	aragorn.weapon = "Bow"
	aragorn.print_info()
	
	var bart: Character = Character.new()
	bart.health = 50
	bart.name = "Bart"
	bart.weapon = "Sling Shot"
	bart.print_info()
