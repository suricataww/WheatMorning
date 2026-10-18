extends Sprite2D

@onready var area_2d: Area2D = $Area2D
@onready var area_2d2: Area2D = $Area2D2
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sound: AudioStreamPlayer2D = $AudioStreamPlayer2D

var ok = 0
var v = 0
func _ready() -> void:
	position=Vector2(993.0,221.0)
	area_2d.input_pickable = true
	area_2d.input_event.connect(_on_area_2d_input_event)

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if( ok == 0):
			animation_player.play("deschidere")
			sound.play()
			ok=1
		else:
			animation_player.play("inchidere")
			sound.play()
			ok=0
func poftabuna(pg) -> void:
	animation_player.play("deschidere")
	ok=1
func _process(delta: float) -> void:
	if Ordine.pasulgatit == 4 and v == 0:
		animation_player.play("inchidere")
		v = 1

func _on_area_2d_2_area_exited(area: Area2D) -> void:
	ok = 0
	animation_player.play("inchidere")
