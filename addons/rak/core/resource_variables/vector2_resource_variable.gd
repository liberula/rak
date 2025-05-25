@tool
class_name Vector2ResourceVariable extends BaseResourceVariable

@export var initial_value : Vector2 = Vector2.ZERO

var value: Vector2:
	set(val):
		if value == val:
			return
		log_message("Setting Vector2 variable %s from %s -> %s" % [name, str(value), str(val)])
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
	log_message("Vector2 variable %s reseted" % name)
