extends Node

@export var initial_state : State

var states : Dictionary = {}
var current_state : State
var current_state_name : String
var parent_name: String


func _ready() -> void:
	parent_name = get_parent().name
	
	# 获取状态管理器下所有状态
	# 加入字典、连接信号
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transition.connect(transition_to)
	
	# 进入初始状态
	if initial_state:
		initial_state._on_enter()
		current_state = initial_state
		current_state_name = current_state.name.to_lower()


func _process(delta : float) -> void:
	if current_state:
		current_state._on_process(delta)


func _physics_process(delta: float) -> void:
	if current_state:
		current_state._on_physics_process(delta)
		current_state._on_transition()
		#print(parent_name, " Current State: ", current_state_name)


# 状态转变信号的回调函数
# 状态转换
func transition_to(state_name : String) -> void:
	if state_name == current_state.name.to_lower():
		return
	
	var new_state = states.get(state_name.to_lower())
	
	#防呆
	if !new_state:
		return
	
	#防止启动时 空指针导致崩溃
	if current_state:
		current_state._on_exit()
	
	new_state._on_enter()
	
	current_state = new_state
	current_state_name = current_state.name.to_lower()
	#print("Current State: ", current_state_name)
