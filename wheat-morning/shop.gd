extends Control

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass



func _on_button_pressed() -> void:
	if Ordine.banuti >= 1:
		Ordine.banuti -= 1
		Ordine.invfaina += 1

func _on_button_pressed1() -> void:
	if Ordine.banuti >= 2:
		Ordine.banuti -= 2
		Ordine.invou += 1

func _on_button_pressed2() -> void:
	if Ordine.banuti >=2:
		Ordine.banuti -= 2
		Ordine.invzahar += 1

func _on_button_pressed3() -> void:
	if Ordine.banuti >= 3:
		Ordine.banuti -= 3
		Ordine.invlapte += 1
