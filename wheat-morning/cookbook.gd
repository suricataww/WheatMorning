extends AnimatedSprite2D

@onready var area_2d: Area2D = $Area2D
@onready var area_2d2: Area2D = $Area2D2 
@onready var area_2d3: Area2D = $Area2D3
var pg=0
signal mananca

func _ready() -> void:
	area_2d.input_event.connect(gatit)
	area_2d2.input_event.connect(paginainainte)
	area_2d3.input_event.connect(paginainapoi)

func gatit(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		mananca.emit(1)
		get_tree().change_scene_to_file("res://bucatarie.tscn")
		frame = 0
		pg = 0
		#schimba scena
func paginainainte(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		frame = pg+1
		pg=pg+1
func paginainapoi(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		frame=pg-1
		pg=pg-1
		
