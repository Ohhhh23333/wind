extends Node2D

@onready var spike: Area2D = $Spike
@onready var wind: Area2D = $Wind
@onready var main_character: CharacterBody2D = $CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 连接场景中所有刺（Spike、Spike2...）的 spike_hit 信号
	for spike_node in get_tree().get_nodes_in_group("spike"):
		spike_node.spike_hit.connect(_get_hit)

func _get_hit():
	print("get hit")
	get_tree().reload_current_scene()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
