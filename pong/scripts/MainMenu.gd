extends CanvasLayer
class_name MainMenu

signal start(difficulty)

func _on_Button_pressed():
	for child in self.get_children():
		child.hide()
	emit_signal("start", IA.Difficulty.EASY)
