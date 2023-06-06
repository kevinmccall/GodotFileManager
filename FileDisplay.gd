extends ColorRect
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
		color = selected_color
	else:
		color = unselected_color

func _unhandled_input(event):
	var modified_rect = get_rect()
	modified_rect.position = global_position
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.pressed \
	and modified_rect.has_point(get_global_mouse_position()):
		emit_signal('selected', self)
		get_viewport().set_input_as_handled()

func select():
	is_selected = true

func deselect():
	is_selected = false
