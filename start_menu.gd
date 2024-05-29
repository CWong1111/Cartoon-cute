extends CenterContainer

@onready var start_game_button = %StartGameButton


func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://survivors_game.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
	
