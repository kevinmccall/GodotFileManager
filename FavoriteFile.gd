extends Resource
class_name FileFavorite

var path : String

func _init(path):
	self.path = path

func get_file_name():
	return path.get_file()

func get_file_path():
	return path
