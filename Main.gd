extends Control

const FILE_SAVE_PATH = "res://favorite_files.json"

@onready var command_runner = $CommandRunner
@onready var saver = $DisplaySaver
@onready var loader = $DisplayLoader
@onready var display_creator = $DisplayCreator
@onready var selection_manager = $SelectionManager
@onready var display_holder = $HBoxContainer/Panel/VBoxContainer/DisplayHolder
@onready var edit_command_popup = $EditCommandPopup


func _ready():
	loader.set_filepath(FILE_SAVE_PATH)
	saver.filepath = FILE_SAVE_PATH
	get_viewport().gui_embed_subwindows = false
	load_favorites()
	edit_command_popup.set_line_edit_text($CommandRunner.get_command())

#func _process(delta):
#	var selected = selection_manager.get_selected_display()
#	if selected:
#		print(selected.get_file_path())

func load_favorites():
	var file_paths = loader.load_filepaths()
	for file in file_paths:
		add_favorite(file)

func save_favorites():
	var file_paths = []
	for file_display in display_holder.get_all_displays():
		file_paths.append(file_display.get_file_path())
	saver.save_favorites(file_paths)

func add_favorite(path: String):
	var display = display_creator.create_display(path)
	display.selected.connect(_on_file_display_selected)
	display_holder.add_display(display)

func run_command():
	var display = selection_manager.get_selected_display()
	var new_args = [display.get_file_path()]
	command_runner.run_command(new_args)

func _on_AddFavoriteDialogue_file_selected(path):
	add_favorite(path)
	save_favorites()

func _on_file_display_selected(file_display: FileDisplay):
	selection_manager.unselect_display()
	selection_manager.select_display(file_display)
	print("selected display " + file_display.get_file_path())

func _on_remove_favorite_button_pressed():
	var selected_display = selection_manager.get_selected_display()
	if selected_display == null:
		return
	display_holder.remove_display(selected_display)
	save_favorites()
	selection_manager.select_most_relevant_result(display_holder.get_visible_displays())

func _on_edit_command_button_pressed():
	$EditCommandPopup.popup()

func _on_add_favorite_button_pressed():
	$AddFavoriteDialogue.popup()

func _on_add_favorite_dialogue_dir_selected(dir):
	add_favorite(dir)
	save_favorites()

func _on_command_runner_command_changed(new_command):
	edit_command_popup.set_line_edit_text(new_command)

func _on_edit_command_popup_new_command_set(new_command):
	command_runner.set_command(new_command)

func _on_file_search_edit_text_submitted(new_text):
	run_command()


func _on_file_search_edit_text_changed(new_text):
	display_holder.narrow_search_options(new_text)
	selection_manager.select_most_relevant_result(display_holder.get_visible_displays())
