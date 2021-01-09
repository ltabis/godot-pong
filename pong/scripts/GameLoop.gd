extends Node
class_name GameLoop

signal update_score
signal restart
signal pause
signal start
signal stop
signal win(player)

enum Players { PLAYER1, PLAYER2 }

var pausing = false
var score_limit = 1
var score_player_1 = 0
var score_player_2 = 0

func _ready():
	set_game_state(false)
	$Ball.connect("out_of_bounds", self, "new_round")

func _process(delta):
	if pausing != true and Input.is_action_pressed("ui_cancel"):
		emit_signal("pause")
		set_game_state(false)
		pausing = true

func _on_MainMenu_start(difficulty):
	$IA.difficulty = difficulty
	set_game_state(true)
	emit_signal("start")

func set_game_state(state):
	for child in self.get_children():
		child.show() if state else child.hide()
		child.set_process(state)

func resume():
	pausing = false
	set_game_state(true)

func new_round(bound):
	if bound == Ball.Bounds.RIGHT:
		emit_signal("update_score", Players.PLAYER1)
		score_player_1 += 1
	elif bound == Ball.Bounds.LEFT:
		emit_signal("update_score", Players.PLAYER2)
		score_player_2 += 1

	if score_player_1 == score_limit:
		emit_signal("win", Players.PLAYER1)
	elif score_player_2 == score_limit:
		emit_signal("win", Players.PLAYER2)
	else:
		emit_signal("restart")
