extends VBoxContainer
@onready var vbox_container = $"."
@onready var p1 : ProgressBar = $Label/MarginContainer/ProgressBar
@onready var p2 : ProgressBar = $Label2/MarginContainer/ProgressBar
@onready var p3 : ProgressBar = $Label3/MarginContainer/ProgressBar
@onready var p4 : ProgressBar = $Label4/MarginContainer/ProgressBar
@onready var l1 = $Label
@onready var l2 = $Label2
@onready var l3 = $Label3
@onready var l4 = $Label4
var total 
var poz = 0

func _ready() -> void:
	poz = 0
	total = vbox_container.get_child_count() - 1
	p1.value = 0
	p2.value = 0
	p3.value = 0
	p4.value = 0
	$Label.visible = false
	$Label2.visible = false
	$Label3.visible = false
	$Label4.visible = false

func _process(delta: float) -> void:
	if Ordine.selectie == 1:
		$Label.visible = true
		$Label2.visible = true
		$Label3.visible = true
		$Label4.visible = true
	if Ordine.selectie == 2:
		$Label.visible = false
		$Label2.visible = true
		$Label3.visible = true
		$Label4.visible = true
	if Ordine.selectie == 3:
		$Label.visible = true
		$Label2.visible = false
		$Label3.visible = true
		$Label4.visible = true

func veriffaina() -> void:
	if $Label.visible == true:
		vbox_container.move_child(l1,poz)
		poz +=1
func verifoua() -> void:
	if $Label2.visible == true:
		vbox_container.move_child(l2,poz)
		poz +=1
func verifzahar() -> void:
	if $Label3.visible == true:
		vbox_container.move_child(l3,poz)
		poz +=1
func veriflapte() -> void:
	if $Label4.visible == true:
		vbox_container.move_child(l4,poz)
		poz +=1

func strikethrough1(apply: bool = true) -> void:
	if Ordine.pasulgatit == 1 and (Ordine.selectie == 1 or Ordine.selectie == 3):
		var strike_tween: Tween = create_tween().set_trans(Tween.TRANS_SINE)
		strike_tween.tween_property($Label/MarginContainer/ProgressBar, "value", 100.0 if apply else 0.0, 0.2)

func strikethrough2(apply: bool = true) -> void:
	if Ordine.pasulgatit == 2 and Ordine.selectie == 1:
		var strike_tween: Tween = create_tween().set_trans(Tween.TRANS_SINE)
		strike_tween.tween_property($Label2/MarginContainer/ProgressBar, "value", 100.0 if apply else 0.0, 0.2)
	if Ordine.pasulgatit == 1 and Ordine.selectie == 2:
		var strike_tween: Tween = create_tween().set_trans(Tween.TRANS_SINE)
		strike_tween.tween_property($Label2/MarginContainer/ProgressBar, "value", 100.0 if apply else 0.0, 0.2)
		
func strikethrough3(apply: bool = true) -> void:
	if Ordine.pasulgatit == 3 and Ordine.selectie == 1:
		var strike_tween: Tween = create_tween().set_trans(Tween.TRANS_SINE)
		strike_tween.tween_property($Label3/MarginContainer/ProgressBar, "value", 100.0 if apply else 0.0, 0.2)
	if Ordine.pasulgatit == 2 and (Ordine.selectie == 2 or Ordine.selectie == 3):
		var strike_tween: Tween = create_tween().set_trans(Tween.TRANS_SINE)
		strike_tween.tween_property($Label3/MarginContainer/ProgressBar, "value", 100.0 if apply else 0.0, 0.2)
	
func strikethrough4(apply: bool = true) -> void:
	if Ordine.pasulgatit == 4 and Ordine.selectie == 1:
		var strike_tween: Tween = create_tween().set_trans(Tween.TRANS_SINE)
		strike_tween.tween_property($Label4/MarginContainer/ProgressBar, "value", 100.0 if apply else 0.0, 0.2)
	if Ordine.pasulgatit == 3 and (Ordine.selectie == 2 or Ordine.selectie == 3):
		var strike_tween: Tween = create_tween().set_trans(Tween.TRANS_SINE)
		strike_tween.tween_property($Label4/MarginContainer/ProgressBar, "value", 100.0 if apply else 0.0, 0.2)
