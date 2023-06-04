extends Node
class_name FileFavoritesSaver

@export var filepath : String

func save_favorites(filepaths: Array) -> void:
	var file = FileAccess.open(filepath, FileAccess.WRITE)
	var data = JSON.stringify(filepaths)
	file.store_string(data)
