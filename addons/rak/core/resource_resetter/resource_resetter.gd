class_name ResourceResetter extends Node

@export var reset_folders: Array[String] = ["res://resources/variables/"]

func _enter_tree():
	for path in reset_folders:
		var dir = DirAccess.open(path)
		if !dir :
			#TODO log here with logger
			continue
		
		var filenames = dir.get_files()
		for filename in filenames:
			filename = filename.replace('.import', '')
			filename = filename.replace('.remap', '')
			if filename.ends_with(".tres"):
				var res = ResourceLoader.load(path + filename, "BaseSharedVariable")
				if not (res is BaseResourceVariable):
					continue
				res.reset()
