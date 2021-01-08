extends CanvasLayer

signal stop
signal resume

func _ready():
	hide_children()

func _on_ResumeButton_pressed():
	emit_signal("resume")
	hide_children()

func _on_QuitButton_pressed():
	emit_signal("stop")

func hide_children():
	for child in get_children():
		child.hide()

func show_children():
	for child in get_children():
		child.hide()
