extends Sprite2D

@onready var area_2d: Area2D = $Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var ok =0
func _ready() -> void:
	position=Vector2(993.0,221.0)
	area_2d.input_pickable = true
	area_2d.input_event.connect(_on_area_2d_input_event)
	#$"../cookbook".connect("mananca", poftabuna)
	pass # Replace with function body.

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if( ok == 0):
			animation_player.play("deschidere")
			ok=1
		else:
			animation_player.play("inchidere")
			ok=0
func poftabuna(pg) -> void:
	animation_player.play("deschidere")
	ok=1
