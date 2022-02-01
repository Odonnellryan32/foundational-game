extends Control

const util = preload("res://scripts/utility/TextUtils.gd")

var port: LineEdit
var port_regex: RegEx = RegEx.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	port = get_node("Control/txt_port")
	port.set_text(String(Global.DEFAULT_PORT))

	if port_regex.compile("\\D+") != OK:
		print  ("Port RegEx compile failed")


func _on_txt_port_text_changed(new_text):
	if port_regex.search(new_text) == null:
		return
	
	# decremet pos because pos changes with event
	var cursor_pos: int = port.get_cursor_position() - 1
	port.set_text(util.sanitize_input(port_regex, new_text))
	port.set_cursor_position(
		min(cursor_pos, port.get_text().length()))


func _on_btn_join_button_up():
	pass # Replace with function body.


func _on_btn_create_button_up():
	pass # Replace with function body.
