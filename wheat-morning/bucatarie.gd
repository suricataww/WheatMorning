extends Node2D
@onready var anunt: Label = $anunt
@onready var cinnamon: CharacterBody2D = $cinnamonroll
@onready var croissant: CharacterBody2D = $croissant
@onready var crenvusti: CharacterBody2D = $crenvusti

func _ready() -> void:
	anunt.text = "Bake something for me first!"

#func _process(delta: float) -> void:
	#if cinnamon.modulate.a == 0 and croissant.modulate.a == 0 and crenvusti.modulate.a == 0:
		#anunt.text = ""
