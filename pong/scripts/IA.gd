extends Area2D
class_name IA

export var speed = 400
var screen_size

enum Difficulty { EASY, MEDIUM, HARD }
var difficulty = Difficulty.EASY
var direction = 1

func _ready():
	screen_size = get_viewport_rect().size
	get_parent().connect("restart", self, "_on_Game_restart")

func _process(delta):
	if difficulty == Difficulty.EASY:
		compute_easy_ia(delta)
	elif difficulty == Difficulty.MEDIUM:
		compute_medium_ia(delta)
	elif difficulty == Difficulty.HARD:
		compute_hard_ia(delta)

func compute_easy_ia(delta):
	var velocity = 0

	position.y += direction * speed * delta

	var collider = $CollisionShape2D.get_shape()

	# prevents the bar to go outside of the screen
	if position.y < collider.extents.y or position.y > screen_size.y - collider.extents.y:
		direction = -direction

func compute_medium_ia(delta):
	pass

func compute_hard_ia(delta):
	pass

# external scripts can manipulate the ia difficulty
func set_difficulty(value):
	difficulty = value

func _on_Game_restart(goal):
	position = Vector2(position.x, screen_size.y / 2)
