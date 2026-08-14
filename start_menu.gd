extends Control

@onready var start_button: Button = $CenterContainer/VBoxContainer/Start
@onready var quit_button: Button = $CenterContainer/VBoxContainer/Quit


func _ready() -> void:
	start_button.grab_focus()
	start_button.pressed.connect(_on_start_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file(
		"res://practice_level.tscn"
	)


func _on_quit_button_pressed() -> void:
	get_tree().quit()
