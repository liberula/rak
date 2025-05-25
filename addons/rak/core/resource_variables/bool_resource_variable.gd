@tool
class_name BoolResourceVariable extends BaseResourceVariable

@export var initial_value : bool = 0

var value: bool:
	set(val):
		if value == val:
			return
		log_message("Setting Bool variable %s from %s -> %s" % [name, str(value), str(val)])
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
	log_message("Bool variable %s reseted" % name)
