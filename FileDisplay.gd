extends Button
class_name FileDisplay

signal selected(this)

var file : FileFavorite
var is_selected = false

@export_color_no_alpha var unselected_color
@export_color_no_alpha var selected_color


func set_file_favorite(f: FileFavorite):
	file = f

func get_file_path():
	return file.get_file_path()

func update_display():
	if file != null:
		$Label.text = get_file_path()
	if is_selected:
		$ColorRect.color = selected_color
	else:
		$ColorRect.color = unselected_color

func _pressed():
	emit_signal('selected', self)
	print('pressed')

func select():
	is_selected = true

func deselect():
	is_selected = false
