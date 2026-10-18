extends Label
@onready var progress : ProgressBar = $MarginContainer/ProgressBar

func _ready() -> void:
	progress.value = 0
func strikethrough(apply: bool = true) -> void:
	if Ordine.pasulgatit == 2:
		var strike_tween: Tween = create_tween().set_trans(Tween.TRANS_SINE)
		strike_tween.tween_property($MarginContainer/ProgressBar, "value", 100.0 if apply else 0.0, 0.2)
