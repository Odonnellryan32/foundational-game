extends Control


# Declare member variables here. Examples:

# Called when the node enters the scene tree for the first time.
func _ready():
	$btn_group/btn_Singleplayer.connect("pressed", self, "Singleplayer")
	$btn_group/btn_Options.connect("pressed", self, "Options")
	$btn_group/btn_Quit.connect("pressed", self, "Quit")
	$lbl_Name.connect("pressed", self, "Quit")
	pass # Replace with function body.

func Singleplayer(): 
	get_tree().change_scene("res://scenes/menu/Singleplayer.tscn")
	
func Options(): 
	pass
	
func Quit(): 
	get_tree().quit() 

