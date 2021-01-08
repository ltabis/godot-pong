extends Node
class_name GameLoop

signal update_score
signal restart
signal start
signal stop

enum Players { PLAYER1, PLAYER2 }

var is_running = false

func _ready():
	set_game_state(false)
	$Ball.connect("out_of_bounds", self, "new_round")

func _on_MainMenu_start(difficulty):
	$IA.difficulty = difficulty
	set_game_state(true)
	emit_signal("start")

func set_game_state(state):
	for child in self.get_children():
		child.show() if state else child.hide()
		child.set_process(state)
		is_running = state

func new_round(bound):
	if bound == Ball.Bounds.LEFT:
		emit_signal("update_score", Players.PLAYER2)
	elif bound == Ball.Bounds.RIGHT:
		emit_signal("update_score", Players.PLAYER1)

	emit_signal("restart")
