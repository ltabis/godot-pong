extends Area2D

export var speed = 200
var screen_size
var direction = Vector2()

enum CollisionType { BAR, BOUNDARY }

func _ready():
	randomize()
	screen_size = get_viewport_rect().size
	direction.x = rand_range(0, 2 * PI)
	direction.y = rand_range(0, 2 * PI)

func _process(delta):
	compute_velocity(delta)

func _physics_process(delta):
	detect_boundary()

func bounce(collider):
	if collider == CollisionType.BOUNDARY:
		print("boundary hit")
	elif collider == CollisionType.BAR:
		print("bar hit")

func compute_velocity(delta):
	position.x += cos(direction.x) * speed * delta
	position.y += sin(direction.y) * speed * delta

func detect_boundary():
	if position.x > screen_size.x or position.x < 0:
		bounce(CollisionType.BOUNDARY)
	elif position.y > screen_size.y or position.y < 0:
		bounce(CollisionType.BOUNDARY)

func _on_Ball_area_entered(area):
	if area.get_name() == "Bar":
		bounce(CollisionType.BAR)
