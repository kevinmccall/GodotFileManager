extends Node


@export_color_no_alpha var unselected_color
@export_color_no_alpha var selected_color

var unselected_style_box_flat
var selected_style_box_flat

func _ready():
	unselected_style_box_flat = StyleBoxFlat.new()
	unselected_style_box_flat.bg_color = unselected_color
	selected_style_box_flat = StyleBoxFlat.new()
	selected_style_box_flat.bg_color = selected_color
