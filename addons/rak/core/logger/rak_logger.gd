class_name RAKLogger extends Resource

func log_message(message : String):
	if OS.is_debug_build():
		print(message)
