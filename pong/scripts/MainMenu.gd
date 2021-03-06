extends CanvasLayer
class_name MainMenu

signal start(difficulty)

var difficulty = IA.Difficulty.EASY

func _on_Button_pressed():
	for child in self.get_children():
		child.hide()
	emit_signal("start", $MenuButton.get_difficulty())

func _on_QuitButton_pressed():
	get_tree().quit()
