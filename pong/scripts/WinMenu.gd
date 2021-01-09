extends CanvasLayer

signal stop
signal restart

func _ready():
	hide_children()

func _on_RestartButton_pressed():
	hide_children()
	emit_signal("restart")

func _on_QuitButton_pressed():
	hide_children()
	emit_signal("stop")

func display(player):
	if player == GameLoop.Players.PLAYER1:
		$Winner.text = "You win the game!"
	else:
		$Winner.text = "You loose ..."

	show_children()

func hide_children():
	for child in get_children():
		child.hide()

func show_children():
	for child in get_children():
		child.show()
