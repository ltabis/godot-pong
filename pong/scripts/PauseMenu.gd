extends CanvasLayer

signal stop
signal resume

var pausing = false

func _ready():
	hide_children()

func _process(delta):
	if !pausing:
		return
	
	# if Input.is_action_pressed("ui_cancel"):
	# 	resume()

func _on_ResumeButton_pressed():
	resume()

func _on_QuitButton_pressed():
	emit_signal("stop")

func pause():
	pausing = true
	show_children()

func resume():
	pausing = false
	hide_children()
	emit_signal("resume")

func hide_children():
	for child in get_children():
		child.hide()

func show_children():
	for child in get_children():
		child.show()
