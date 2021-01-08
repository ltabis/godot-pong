extends Node
class_name Main

func _ready():
	$Game.connect("update_score", self, "_on_Score_updated")
	$Game.connect("start", self, "_on_Game_start")
	$Game.connect("restart", self, "_on_Game_restart")

func _on_Score_updated(player):
	$HUD.update_score(player)

func _on_Game_start():
	$HUD.game_started()
