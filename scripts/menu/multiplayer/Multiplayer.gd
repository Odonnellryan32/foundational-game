extends Control

const util = preload("res://scripts/utility/text_utils.gd")

var regex := RegEx.new()
var txt_name: LineEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	txt_name = get_node("txt_name")
	var err := regex.compile("\\W+")
	if err != OK: print("Failed to compile regex")


func _on_txt_name_text_changed(new_text):
	if regex.search(new_text) == null:
		return
	
	# decremet pos because pos changes with event
	var cursor_pos: int = txt_name.get_cursor_position() - 1
	txt_name.set_text(util.sanitize_input(regex, new_text))
	txt_name.set_cursor_position(
			min(cursor_pos, txt_name.get_text().length()))


func _on_btn_join_button_up():
	pass # Replace with function body.


func _on_btn_create_button_up():
	pass # Replace with function body.
