extends AnimatedSprite2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var area_2d: Area2D = $Area2D
@onready var label: Label = $Label

func _ready() -> void:
	area_2d.mouse_entered.connect(_on_mouse_entered)
	#trb conectat aici daca vr sa se intample orice cu Area2D pt ca eu scriu in Casian
	area_2d.mouse_exited.connect(_on_mouse_exited)
	area_2d.area_entered.connect(_on_area_entered)
	label.text = ""  #ascunde labelul la inceput
	label.modulate = Color.CHARTREUSE
	label.add_theme_constant_override("outline_size",10);

func _on_mouse_entered() -> void:
	frame = 1
func _on_mouse_exited() -> void:
	await get_tree().create_timer(0.25).timeout
	frame = 0
func _on_area_entered(area: Area2D) -> void:
	print("Casian area entered by: ", area.get_parent().name)
	if area.get_parent().is_in_group("croissant"):
		play_croissant()
	label.text = ""
	if area.get_parent().is_in_group("cinnamonroll"):
		play_cinnamonroll()
	if area.get_parent().is_in_group("crenvusti"):
		play_crenvusti()
func play_croissant() -> void:
	await get_tree().create_timer(0.3).timeout
	frame = 0
	await get_tree().create_timer(0.15).timeout
	frame = 2
	await get_tree().create_timer(0.15).timeout
	frame = 0
	await get_tree().create_timer(0.15).timeout
	frame = 2
	await get_tree().create_timer(0.15).timeout
	frame = 0
	await get_tree().create_timer(0.15).timeout
	frame = 3
	label.text="Mmmm, sugubat!"
	
func play_cinnamonroll() -> void:
	await get_tree().create_timer(0.3).timeout
	frame = 0
	await get_tree().create_timer(0.15).timeout
	frame = 2
	await get_tree().create_timer(0.15).timeout
	frame = 0
	await get_tree().create_timer(0.15).timeout
	frame = 2
	await get_tree().create_timer(0.15).timeout
	frame = 0
	await get_tree().create_timer(0.15).timeout
	frame = 4
	
func play_crenvusti() -> void:
	await get_tree().create_timer(0.3).timeout
	frame = 0
	await get_tree().create_timer(0.15).timeout
	frame = 2
	await get_tree().create_timer(0.15).timeout
	frame = 0
	await get_tree().create_timer(0.15).timeout
	frame = 2
	await get_tree().create_timer(0.15).timeout
	frame = 0
	await get_tree().create_timer(0.15).timeout
	frame = 0
