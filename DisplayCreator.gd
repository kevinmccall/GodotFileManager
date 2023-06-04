extends Node

var file_display_packed = preload("res://FileDisplay.tscn")

func create_display(file_path):
	var favorite = create_favorite_file(file_path)
	var display = file_display_packed.instantiate()
	display.set_file_favorite(favorite)
	display.update_display()
	return display

func create_favorite_file(file_path):
	var favorite = FileFavorite.new(file_path)
	return favorite
