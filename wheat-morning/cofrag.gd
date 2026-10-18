extends AnimatedSprite2D
@onready var area2d: Area2D = $Area2D
@onready var sound: AudioStreamPlayer2D = $AudioStreamPlayer2D
var permis: bool = false
var prezenta = 0
signal out
var pusdeja : bool = false

func _ready() -> void:
	scale = Vector2(0.442308,0.442308)
	frame = 0
	modulate.a = 0
	position = Vector2(1034,357)
	area2d.input_event.connect(deschidere)

func _process(delta: float) -> void:
	if (Ordine.selectie == 1 or Ordine.selectie == 2) and Ordine.invou >= 1:
		modulate.a = 1
		prezenta = 1
	else:
		modulate.a = 0
		prezenta = 0

func deschidere(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and prezenta == 1 and pusdeja == false and Ordine.invou >= 1:
		frame = 1
		sound.play()
		out.emit()

func _on_ou_schimbare() -> void:
	frame = 2
	pusdeja = true

func _on_area_2d_mouse_entered() -> void:
	if pusdeja == false:
		scale = Vector2(0.48,0.48)

func _on_area_2d_mouse_exited() -> void:
	if pusdeja == false:
		scale = Vector2(0.442308,0.442308)
