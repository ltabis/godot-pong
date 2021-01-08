extends Node
class_name Main

func _ready():
	$Game.connect("update_score", self, "_on_Score_updated")
	$Game.connect("start", self, "_on_Game_start")
	$Game.connect("restart", self, "_on_Game_restart")
	$Game.connect("pause", self, "_on_Game_pause")
	$PauseMenu.connect("resume", self, "_on_Game_resume")
	$PauseMenu.connect("stop", self, "_on_Game_quit")

func _on_Score_updated(player):
	$HUD.update_score(player)

func _on_Game_start():
	$HUD.game_started()

func _on_Game_pause():
	$PauseMenu.pause()
	$HUD.hide_children()

func _on_Game_resume():
	$Game.resume()
	$HUD.show_children()

func _on_Game_quit():
	get_tree().quit()
