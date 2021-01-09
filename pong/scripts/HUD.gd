extends CanvasLayer
class_name HUD

signal start

func _ready():
	hide_children()

func game_started():
	show_children()
	emit_signal("start")

func update_score(player):
	if player == GameLoop.Players.PLAYER1:
		$LeftScore.increase_score()
		$LeftScore.update_ui()
	elif player == GameLoop.Players.PLAYER2:
		$RightScore.increase_score()
		$RightScore.update_ui()

func hide_children():
	for child in self.get_children():
		child.hide()

func show_children():
	for child in self.get_children():
		child.show()
