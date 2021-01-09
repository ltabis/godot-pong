extends CanvasLayer

signal stop
signal restart

func _ready():
	pass # Replace with function body.

func _on_RestartButton_pressed():
	emit_signal("restart")

func _on_QuitButton_pressed():
	emit_signal("stop")
