🧹 ResourceResetter
The ResourceResetter is a lightweight utility node that scans your project for BaseResourceVariables and resets them to their original editor-defined state.

It’s perfect for making sure all your shared resource variables are clean at the start of a scene or game run — especially when dealing with persistent data in .tres files.

🔧 How to Use
Add ResourceResetter to your scene — ideally near the root.

Set which folders you want scanned.

Optionally enable auto-reset when the node enters the tree.

gdscript
Copy
Edit
@export_dir var folders_to_scan: Array[String] = ["res://resources/variables/"]
@export var recursive: bool = true
@export var auto_reset_on_enter := true
📦 Example Setup
Put all your shared variables inside a folder like this:

arduino
Copy
Edit
res://resources/variables/
  ├── player_health.tres
  ├── enemy_count.tres
  └── score.tres
Attach this node:

gdscript
Copy
Edit
var resetter := ResourceResetter.new()
resetter.folders_to_scan = ["res://resources/variables/"]
resetter.auto_reset_on_enter = true
add_child(resetter)
Or call it manually:

gdscript
Copy
Edit
resetter.reset_all()
📣 Signals
finished_reset — emitted after all variables are scanned and reset.

🧠 Behind the Scenes
Uses DirAccess to walk through folders.

Loads .tres files and checks if they're a subclass of BaseResourceVariable.

Calls reset() on each valid resource.

Optionally logs messages using a RAKLogger resource.

🗒️ Notes
Only .tres files are supported (for now).

Ignores .import and .remap files.

A good practice is to keep all resource variables in a single root folder.

🛠️ Extending It
Add support for dry_run or verbose flags if you want to preview resets.

Tagging support (e.g. via metadata) could be added later for selective resets.

CLI-friendly version for automation is also possible.
