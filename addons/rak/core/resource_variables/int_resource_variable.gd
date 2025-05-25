@tool
class_name IntResourceVariable extends BaseResourceVariable

@export var initial_value : int = 0

var value: int:
	set(val):
		if value == val:
			return
		log_message("Setting int variable %s from %s -> %s" % [name, str(value), str(val)])
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
	log_message("Int variable %s reseted" % name)
