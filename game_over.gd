extends Control

@onready var quit_button: Button = $CenterContainer/VBoxContainer/Quit
@onready var main_menu_button: Button = $CenterContainer/VBoxContainer/MainMenu


func _ready() -> void:
	main_menu_button.grab_focus()
	quit_button.pressed.connect(_on_quit_button_pressed)
	main_menu_button.pressed.connect(_on_main_menu_button_pressed)


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file(
		"res://start_menu.tscn"
	)


func _on_quit_button_pressed() -> void:
	get_tree().quit()