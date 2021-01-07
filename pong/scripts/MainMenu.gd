extends CanvasLayer
class_name MainMenu

signal start(difficulty)

func _on_Button_pressed():
	emit_signal("start", IA.Difficulty.EASY)
