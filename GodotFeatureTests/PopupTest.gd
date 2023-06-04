extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	print("started")
	await get_tree().create_timer(3).timeout
	for child in get_children():
		if child is Popup:
			print(child.name)
			child.popup()
