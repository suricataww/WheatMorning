extends Node2D
func _ready() -> void: #apelat o singura data
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame. CONTINUU
func _process(delta: float) -> void:
	pass
	
func move_state()-> void:
	var move_vector : Vector2 = Vector2(1,1)  # x si y
	move_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	move_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui.up")
