extends Node
class_name SelectionManager

var selected_file_display : FileDisplay

func get_selected_display():
	return selected_file_display

func select_most_relevant_result(displays):
	unselect_display()
	if len(displays) > 0:
		select_display(displays[0])

func select_display(display: FileDisplay):
	display.select()
	selected_file_display = display
	selected_file_display.update_display()

func unselect_display():
	if selected_file_display:
		selected_file_display.deselect()
		selected_file_display.update_display()
	selected_file_display = null

func remove_selected_display():
	if selected_file_display == null:
		return
	selected_file_display.queue_free()
	selected_file_display = null
