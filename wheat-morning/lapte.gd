extends AnimatedSprite2D
@onready var area_2d: Area2D=$Area2D
@onready var sound: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var curge: AudioStreamPlayer2D = $curge
var permis: bool = false
var prezenta = 0
var pusdeja: bool = false

func _ready() -> void:
	scale = Vector2(0.51355,0.51355)
	position = Vector2(910,331)
	modulate.a = 0
	area_2d.input_event.connect(mouse)
	area_2d.area_entered.connect(turnat)
	add_to_group("lapte")

func _physics_process(delta: float) -> void:
	if permis:
		global_position = get_global_mouse_position()
		look_at(get_global_mouse_position())
	if (Ordine.selectie == 1 or Ordine.selectie == 2 or Ordine.selectie == 3) and Ordine.invlapte >= 1:
		modulate.a = 1
		prezenta = 1
	else:
		if Ordine.invlapte >= 1 and Ordine.selectie != 0:
			modulate.a = 1
			prezenta = 1
		else:
			modulate.a = 0
			prezenta = 0

func mouse(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and pusdeja == false and Ordine.invlapte >= 1:
		permis = 1
		sound.play()

func turnat(area: Area2D) -> void:
	if area.get_parent().is_in_group("bol"):
		pusdeja == true
		if  Ordine.pasulgatit == 3 and Ordine.selectie == 1:
			permis = false
			curge.play()
			position = Vector2(688,387)
			frame = 1
			await get_tree().create_timer(1).timeout
			frame = 2
			await get_tree().create_timer(0.6).timeout
			position = Vector2(910,331)
			Ordine.pasulgatit = 4
		if Ordine.pasulgatit == 2 and (Ordine.selectie == 2 or Ordine.selectie == 3):
			permis = false
			curge.play()
			position = Vector2(688,387)
			print("*")
			frame = 1
			await get_tree().create_timer(0.6).timeout
			frame = 2
			await get_tree().create_timer(0.6).timeout
			position = Vector2(910,331)
			Ordine.pasulgatit = 3
		Ordine.invlapte -= 1
	if area.get_parent().is_in_group("bol"):
		if Ordine.pasulgatit != 3 and Ordine.selectie == 1:
			permis = false
			position = Vector2(910,331)
		if Ordine.pasulgatit !=2 and (Ordine.selectie == 2 or Ordine.selectie == 3):
			permis = false
			position = Vector2(910,331)

func _on_area_2d_mouse_entered() -> void:
	if pusdeja == false:
		scale = Vector2(0.55,0.55)

func _on_area_2d_mouse_exited() -> void:
	if pusdeja == false:
		scale = Vector2(0.51355,0.51355)
