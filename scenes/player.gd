extends CharacterBody2D

@export var speed := 200.0
@export var acceleration := 1000.0
@export var friction := 1200.0
@export var gravity := 980.0
@export var jump_force := 400.0

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		velocity.x = move_toward(
			velocity.x,
			direction * speed,
			acceleration * delta
		)
	else:
		velocity.x = move_toward(
			velocity.x,
			0,
			friction * delta
		)

	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -jump_force

	move_and_slide()
