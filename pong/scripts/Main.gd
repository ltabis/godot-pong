extends Node
class_name Main

func _ready():
	$Game.connect("update_score", self, "_on_Score_updated")
	$Game.connect("start", self, "_on_Game_start")
	$Game.connect("pause", self, "_on_Game_pause")
	$Game.connect("win", self, "_on_Game_won")
	$PauseMenu.connect("resume", self, "_on_Game_resume")
	$PauseMenu.connect("stop", self, "_on_Game_quit")
	$WinMenu.connect("new_game", self, "_on_Round_new")
	$WinMenu.connect("stop", self, "_on_Game_quit")

func _on_Score_updated(player):
	$HUD.update_score(player)

func _on_Game_start(goal):
	$HUD.game_started(goal)

func _on_Game_restart(goal):
	$HUD.game_started(goal)
	$Game.game_restart()

func _on_Round_new():
	$HUD.game_started($Game.get_score_limit())
	$Game.game_restart()
	print("PASSED")

func _on_Game_pause():
	$PauseMenu.pause()
	$HUD.hide_children()

func _on_Game_resume():
	$Game.resume()
	$HUD.show_children()

func _on_Game_quit():
	get_tree().quit()

func _on_Game_won(player):
	$WinMenu.display(player)
	$HUD.hide_children()
