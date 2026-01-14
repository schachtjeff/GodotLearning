extends Character


class_name Hero


var _ability: String = "Ability"

func _init(p_ability: String, p_health: int, p_name: String, p_weapon: String) -> void:
	super(p_health, p_name, p_weapon)
	# Inheritance of Hero with Character above
	_ability = p_ability

func use_ability() -> void:
	print("%s uses ability %s" % [
		_name, _ability
	])
	
func attack() -> void:
	print("%s tries to attack with %s" % [
		_name, _weapon
	])
