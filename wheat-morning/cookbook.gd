extends AnimatedSprite2D

@onready var area_2d: Area2D = $Area2D
@onready var area_2d2: Area2D = $Area2D2 
@onready var area_2d3: Area2D = $Area2D3
@onready var sound: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var flip: AudioStreamPlayer2D = $flip

var pg=0

func _ready() -> void:
	area_2d.input_event.connect(gatit)
	area_2d2.input_event.connect(paginainainte)
	area_2d3.input_event.connect(paginainapoi)

func gatit(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if frame == 1:
			Ordine.selectie = 1
		if frame == 2:
			Ordine.selectie = 2
		if frame == 3:
			Ordine.selectie = 3
		sound.play()
		frame = 0
		pg = 0

func paginainainte(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		flip.play()
		frame = pg+1
		pg=pg+1
func paginainapoi(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		flip.play()
		frame=pg-1
		pg=pg-1

func _on_areastg_mouse_entered() -> void:
	if frame == 0:
		scale = Vector2(0.52,0.52)
func _on_areastg_mouse_exited() -> void:
	if frame == 0:
		scale = Vector2(0.47343,0.47343)
