extends Node2D

@onready var spike: Area2D = $Spike
@onready var wind: Area2D = $Wind
#@onready var ice_surface: Area2D = $IceSurface
@onready var main_character: CharacterBody2D = $CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	# 连接场景中所有刺（Spike、Spike2...）的 spike_hit 信号
	for spike_node in get_tree().get_nodes_in_group("spike"):
		spike_node.spike_hit.connect(_get_hit)
	#wind.item_in_wind.connect(_in_wind_item)
	#ice_surface.player_on_ice.connect(_on_player_on_ice)
	#ice_surface.player_off_ice.connect(_on_player_off_ice)

func _get_hit():
	main_character.position = Vector2(30, 310) #被刺回出生点

#风
func _in_wind_item():
	pass #风吹动物体

#冰
func _on_player_on_ice():
	pass
	#冰面上的系数
func _on_player_off_ice():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
