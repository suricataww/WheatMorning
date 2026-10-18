extends Label
@onready var coin: Label = $"."
func _ready() -> void:
	pass
func _process(delta: float) -> void:
	coin.text = str(Ordine.banuti)
