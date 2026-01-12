extends Object

#Blueprint object of character
class_name Character


var health: int
var name: String
var weapon: String


func print_info() -> void:
	print("%s health:%d wields:%s" % [
		name, health, weapon
	])
