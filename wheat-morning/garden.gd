extends Node2D
@onready var atentie: Label = $cumpara
@onready var inst1: Label = $"1inst"
var inceput: bool = false

func _ready() -> void:
	Ordine.selectie = 0
	Ordine.pasulgatit = 0

func _process(delta: float) -> void:
	$VBoxContainer.strikethrough1()
	$VBoxContainer.strikethrough2()
	$VBoxContainer.strikethrough3()
	$VBoxContainer.strikethrough4()
	if Ordine.selectie == 1: 
		inst1.text = ""
		if (Ordine.invfaina==0 or Ordine.invou==0 or Ordine.invzahar==0 or Ordine.invlapte ==0) and inceput == false:
			atentie.text = "go to shop and buy ingredients first!"
		else:
			inceput = true
	if Ordine.selectie == 2:
		inst1.text = ""
		if(Ordine.invlapte == 0 or Ordine.invou == 0 or Ordine.invzahar == 0) and inceput == false:
			atentie.text = "go to shop and buy ingredients first!"
		else:
			inceput = true
	if Ordine.selectie == 3:
		inst1.text = ""
		if(Ordine.invfaina == 0 or Ordine.invzahar == 0 or Ordine.invlapte == 0) and inceput == false:
			atentie.text = "go to shop and buy ingredients first!"
		else:
			inceput == true
	if Ordine.selectie == 0:
		inst1.text = "Browse the cookbook and choose a dish!"
