extends Node2D

@onready var level_timer_label = %LevelTimerLabel

var level_timer = 0.0
var start_level_msec = 0.0

func _ready():
	start_level_msec = Time.get_ticks_msec()

func _process(delta):
	level_timer = Time.get_ticks_msec() - start_level_msec
	level_timer_label.text = str(level_timer / 1000.0)

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.visible = true 
	get_tree().paused = true
	
