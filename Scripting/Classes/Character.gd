extends Object

#Blueprint object of character
class_name Character


var health: int
var name: String
var weapon: String


func _init(p_health: int, p_name: String, p_weapon: String) -> void:
	health = p_health
	name = p_name
	weapon = p_weapon


func print_info() -> void:
	print("%s health:%d wields:%s" % [
		name, health, weapon
	])
