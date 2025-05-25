@tool
class_name StringResourceVariable extends BaseResourceVariable

@export var initial_value : String = ""

var value: String:
	set(val):
		if value == val:
			return
		log_message("Setting String variable %s from %s -> %s" % [name, str(value), str(val)])
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
	log_message("String variable %s reseted" % name)
