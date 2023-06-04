extends VBoxContainer

signal items_visbilbity_changed(visible_items)

func fuzzy_find(sample: String, compare: String):
	if len(compare) == 0:
		return
	var sample_index = 0
	var start = -1
	var end = -1
	for character in compare:
		var char_index = sample.find(character, sample_index)
		if char_index == -1:
			return
		if start == -1:
			start = char_index
		end = char_index
	return [start, end]

func show_all():
	for display in get_all_displays():
		display.show()
	notify_change()

func narrow_search_options(filter_query):
	show_all()
	if filter_query == "":
		return
	for display in get_all_displays():
		var data = display.get_file_path()
		var res = fuzzy_find(data.to_lower(), filter_query.to_lower())
		if res == null:
			display.hide()
	notify_change()

func add_display(display: FileDisplay):
	add_child(display)

func remove_display(display: FileDisplay):
	remove_child(display)
	display.queue_free()

func get_visible_displays():
	var visible_displays = []
	for display in get_all_displays():
		if display.visible:
			visible_displays.append(display)
	return visible_displays

func get_all_displays():
	return get_children()

func notify_change():
	items_visbilbity_changed.emit(get_visible_displays())
