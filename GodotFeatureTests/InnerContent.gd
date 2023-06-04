extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = get_parent().name
