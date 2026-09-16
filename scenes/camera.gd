extends Camera2D

@export var deslocamento := Vector2(0, -200)
@export var suavidade := 10.0

@onready var player: CharacterBody2D = $"../Player"

func _ready() -> void:
	position_smoothing_enabled = true
	position_smoothing_speed = suavidade
	# Começa no jogador, sem deslizar desde a origem do cenário.
	global_position = player.global_position + deslocamento
	reset_smoothing()

func _physics_process(_delta: float) -> void:
	# A suavização da Camera2D acompanha esta posição automaticamente.
	global_position = player.global_position + deslocamento
