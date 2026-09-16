extends Control

var elapsed_time := 0.0

# Cada ponto de vida representa meio coração.
const MAX_HEALTH := 6
const HEART_FULL = preload("res://sprites/kenney_pixel-platformer/Tiles/tile_0044.png")
const HEART_HALF = preload("res://sprites/kenney_pixel-platformer/Tiles/tile_0045.png")
const HEART_EMPTY = preload("res://sprites/kenney_pixel-platformer/Tiles/tile_0046.png")

var health := MAX_HEALTH

@onready var timer_label = $TimerLabel
@onready var hearts = $Hearts.get_children()

func _ready() -> void:
	atualizar_coracoes()

func atualizar_coracoes() -> void:
	for index in range(hearts.size()):
		var heart_health = clampi(health - index * 2, 0, 2)
		match heart_health:
			2:
				hearts[index].texture = HEART_FULL
			1:
				hearts[index].texture = HEART_HALF
			0:
				hearts[index].texture = HEART_EMPTY

func _process(delta):
	elapsed_time += delta

	var minutes = int(elapsed_time) / 60
	var seconds = int(elapsed_time) % 60

	timer_label.text = "%02d:%02d" % [minutes, seconds]

func tirar_vida():
	health = maxi(0, health - 1)
	atualizar_coracoes()

func _on_damage_button_pressed() -> void:
	tirar_vida()

func _on_heal_button_pressed() -> void:
	health = mini(MAX_HEALTH, health + 1)
	atualizar_coracoes()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == get_node("../../Player"):
		tirar_vida()
