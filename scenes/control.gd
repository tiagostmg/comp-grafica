extends Control

var elapsed_time := 0.0

var max_health := 100
var health := 100

@onready var timer_label = $TimerLabel
@onready var health_label = $HealthLabel

func _process(delta):
	elapsed_time += delta

	var minutes = int(elapsed_time) / 60
	var seconds = int(elapsed_time) % 60

	timer_label.text = "%02d:%02d" % [minutes, seconds]

	health_label.text = "Vida: %d" % health


func tirar_vida():
	health -= 10
	health = max(0, health)

func _on_damage_button_pressed() -> void:
	tirar_vida()

func _on_heal_button_pressed() -> void:
	health += 10
	health = min(100, health)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == get_node("../../Player"):
		tirar_vida()
