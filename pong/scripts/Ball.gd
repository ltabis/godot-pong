extends Area2D

export var speed = 200
var screen_size
var direction

func _ready():
	randomize()

	var angle = rand_range(0, 2 * PI)

	screen_size = get_viewport_rect().size
	direction = Vector2(cos(angle), sin(angle))

func _process(delta):
	compute_velocity(delta)

func _physics_process(delta):
	detect_boundary()

func bounce(normal):
	var pos = position.normalized()

func compute_velocity(delta):
	position.x += direction.x * speed * delta
	position.y += direction.y * speed * delta

func detect_boundary():

	var radius = $CollisionShape2D.shape.radius

	if position.x + radius > screen_size.x:
		direction.x = -direction.x
	elif position.x - radius < 0:
		direction.x = -direction.x
	elif position.y + radius > screen_size.y:
		direction.y = -direction.y
	elif position.y - radius < 0:
		direction.y = -direction.y

func _on_Ball_area_entered(area):
	if area.get_name() == "Bar":
		bounce(Vector2())
