extends Area2D
class_name Ball

enum Bounds { LEFT, RIGHT }

signal out_of_bounds(bound)

export var speed = 500
var screen_size
var direction

func _ready():

	randomize()
	screen_size = get_viewport_rect().size
	random_direction()

	get_tree().root.connect("size_changed", self, "_on_Viewport_size_changed")
	get_parent().connect("restart", self, "_on_Game_restart")

func _process(delta):
	compute_velocity(delta)

func _physics_process(delta):
	detect_boundary()

func compute_velocity(delta):
	position.x += direction.x * speed * delta
	position.y += direction.y * speed * delta

func detect_boundary():

	var radius = $CollisionShape2D.shape.radius

	if position.x + radius > screen_size.x:
		direction.x = -direction.x
		emit_signal("out_of_bounds", Bounds.RIGHT)
	elif position.x - radius < 0:
		direction.x = -direction.x
		emit_signal("out_of_bounds", Bounds.LEFT)
	elif position.y + radius > screen_size.y:
		direction.y = -direction.y
	elif position.y - radius < 0:
		direction.y = -direction.y

func random_direction():
	var angle = rand_range(0, 2 * PI)
	direction = Vector2(cos(angle), sin(angle))

func _on_Ball_area_entered(area):
	if area.get_name() == "Bar" or area.get_name() == "IA":
		direction.x = -direction.x

func _on_Viewport_size_changed():
	screen_size = get_viewport_rect().size

func _on_Game_restart(goal):
	position = Vector2(screen_size.x / 2, screen_size.y / 2)
	random_direction()
