extends Node
class_name FileFavoritesLoader

@export var filepath : String

var valid: bool = false

func set_filepath(path: String) -> void:
	if not FileAccess.file_exists(path):
		printerr("Favorite File Loader file not valid")
		return
	filepath = path

func load_filepaths() -> Array:
	var file = FileAccess.open(filepath, FileAccess.READ)
	var json = JSON.new()
	var err = json.parse(file.get_as_text())
	if err == OK:
		var data = json.data
		return data 
	else:
		printerr("FavoriteFileLoader: Unable to load JSON file")
		return []
	
