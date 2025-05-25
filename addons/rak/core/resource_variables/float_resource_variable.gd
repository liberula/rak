@tool
class_name FloatResourceVariable extends BaseResourceVariable

@export var initial_value : float = 0

var value: float:
	set(val):
		if value == val:
			return
		log_message("Setting float variable %s from %s -> %s" % [name, str(value), str(val)])
		value = val
		emit_changed()
	get:
		return value

func _init():
	value = initial_value

func reset() -> void:
	super()
	value = initial_value
	emit_changed()
	log_message("Float variable %s reseted" % name)
