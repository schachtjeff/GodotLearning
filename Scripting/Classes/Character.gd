extends Object

#Blueprint object of character
class_name Character


var _health: int
var _name: String
var _weapon: String


func _init(p_health: int, p_name: String, p_weapon: String) -> void:
	_health = p_health
	_name = p_name
	_weapon = p_weapon


func print_info() -> void:
	print("%s health:%d wields:%s" % [
		_name, _health, _weapon
	])
	
	
func set_health(new_health: int) -> void:
	if new_health > 100: 
		_health = 100
	elif new_health < 0: 
		_health = 0
	_health = new_health
	
func get_health() -> int:
	return _health
	
