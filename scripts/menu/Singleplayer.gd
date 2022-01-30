extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$btn_New_Game.connect("pressed", self, "New_Game")
	$btn_Load_Game.connect("pressed", self, "Load_Game")
	$btn_Back.connect("pressed", self, "Back")
	pass # Replace with function body.


func New_Game():
	get_tree().change_scene("res://scenes/Main.tscn")
	pass

func Load_game(): 
	#TODOLoad menu scene with filemenu 
	pass

func Back(): 
	get_tree().change_scene("res://scenes/menu/Menu.tscn")
	pass
