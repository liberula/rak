class_name ResourceResetter extends Node

signal finished_reset

@export_dir var folders_to_scan: Array[String] = ["res://resources/variables/"]
@export var recursive: bool = true
@export var auto_reset_on_enter := true
@export var logger : RAKLogger = load("res://addons/rak/core/logger/logger.tres")

func _enter_tree():
	if auto_reset_on_enter:
		reset_all()

func reset_all() -> void:
	for path in folders_to_scan:
		_reset_resources_in_dir(path)

	emit_signal("finished_reset")

func _reset_resources_in_dir(path : String) -> void:
	var dir = DirAccess.open(path)
	if !dir :
		log_message("Directory not found at path %s" % path)
		return
	_reset_dir_files(dir, path)
	if not recursive:
		return
	for subpath in dir.get_directories():
		_reset_resources_in_dir(path.path_join(subpath))

func _reset_dir_files(dir : DirAccess, path : String) -> void:
	var filenames = dir.get_files()
	for filename in filenames:
		filename = filename.replace('.import', '')
		filename = filename.replace('.remap', '')
		if filename.ends_with(".tres"):
			log_message(path.path_join(filename))
			var res = ResourceLoader.load(path.path_join(filename), "BaseResourceVariable")
			if not (res is BaseResourceVariable):
				continue
			res.reset()

func log_message(message : String):
	if logger == null or not logger.has_method("log_message"):
		return
	
	logger.log_message(message)
