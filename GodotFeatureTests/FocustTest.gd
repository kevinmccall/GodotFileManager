extends Panel

func _ready():
	focus_mode = Control.FOCUS_ALL

func _gui_input(event):
	print(name + ' | ' +str(event))
