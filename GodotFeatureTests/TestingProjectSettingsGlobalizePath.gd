extends Node

const PATH = "res://favorite_files.json"



# Called when the node enters the scene tree for the first time.
func _ready():
	var loader : FileFavoritesLoader = $Loader
	loader.set_filepath(PATH)
	var saved_paths = loader.load_filepaths()
	print("PATHS BEFORE")
	for path in saved_paths:
		print(path)
	print("PATHS AFTER GLOBILAZATION")
	for path in saved_paths:
		print(ProjectSettings.globalize_path(path))
