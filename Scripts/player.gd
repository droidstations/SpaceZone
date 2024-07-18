extends Area2D

@onready var screensize = get_viewport_rect().size
@export var speed = 150
@export var cooldown = 0.25
@export var bullet_scene : PackedScene
var can_shoot = true

# Called when the node enters the scene tree for the first time.
func _ready():
	start()
	
func start():
	position = Vector2(screensize.x / 2, screensize.y -64)
	$GunCooldown.wait_time = cooldown

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var input = Input.get_vector("left", "right", "up", "down")
	if input.x > 0:
		$Ship.frame = 2
		$Ship/Boosters.play("right")
	elif input.x < 0:
		$Ship.frame = 0
		$Ship/Boosters.play("left")
	else:
		$Ship.frame = 1
		$Ship/Boosters.play("forward")
	position += input * speed * delta
	position.x = clamp(position.x, 8, screensize.x - 8)
	position.y = clamp(position.y, 8, screensize.y - 8)
	
	if Input.is_action_pressed("shoot"):
		shoot()

func shoot():
	if not can_shoot:
		return
	can_shoot = false
	$GunCooldown.start()
	var b = bullet_scene.instantiate()
	get_tree().root.add_child(b)
	b.start(position + Vector2(0, -8))


func _on_gun_cooldown_timeout():
	can_shoot = true
