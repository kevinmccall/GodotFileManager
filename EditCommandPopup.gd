extends PopupPanel


signal new_command_set(new_command)

func set_line_edit_text(new_text):
	$VBoxContainer/CommandLineEdit.text = new_text

func new_command_confirmed():
	new_command_set.emit($VBoxContainer/CommandLineEdit.text)

func _on_command_line_edit_text_submitted(new_text):
	new_command_confirmed()

func _on_new_command_confirm_button_pressed():
	new_command_confirmed()
