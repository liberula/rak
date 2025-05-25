@tool
class_name BaseResourceVariable extends Resource
@export var logger : RAKLogger = load("res://addons/rak/core/logger/logger.tres")
@export_multiline  var description : String

var name : String

func _has_logger() -> bool:
	return logger != null and logger.has_method("log_message")

func reset():
	if name.is_empty():
		name = resource_path.get_file().trim_suffix('.tres')
		ResourceSaver.save(self, resource_path)

func log_message(message : String):
	if not _has_logger():
		return
	
	logger.log_message(message)
