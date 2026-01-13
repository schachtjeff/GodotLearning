extends Object

#Blueprint object of character
class_name Character

# Static lesson
#static var character_count: int = 0


#var health: int
var _name: String
var _weapon: String

#invokes the setter and getter below
#var health: int:
#	get = get_health,
#	set = set_health
	

# Another way to setter and getter, but more advanced
var health: int:
	get:
		print("Getter")
		return health
	set(value):
		print("Setter")
		health = clampi(value, 0, 100)


func _init(p_health: int, p_name: String, p_weapon: String) -> void:
	#character_count += 1
	health = p_health
	_name = p_name
	_weapon = p_weapon
	
func attack() -> void:
	print("%s attacks with %s" % [
		_name, _weapon
	])
	
func print_info() -> void:
	print("%s health:%d wields:%s" % [
		_name, health, _weapon
	])
	
#Unneeded now with above new getter and setter logic
#func set_health(new_health: int) -> void:
#	if new_health > 100: 
#		_health = 100
#	elif new_health < 0: 
#		_health = 0
#	_health = new_health
	
#func get_health() -> int:
#	return _health
	
