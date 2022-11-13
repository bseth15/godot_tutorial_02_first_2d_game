extends CanvasLayer

signal start_game

const CONNECTION_FAILED := "connection_failed"


func _ready() -> void:
	if $MessageTimer.connect("timeout", self, "_on_MessageTimer_timeout") != OK: print_debug(CONNECTION_FAILED)
	if $StartButton.connect("pressed", self, "_on_StartButton_pressed") != OK: print_debug(CONNECTION_FAILED)


func _on_StartButton_pressed() -> void:
	$StartButton.hide()
	emit_signal("start_game")


func _on_MessageTimer_timeout() -> void:
	$Message.hide()


func show_message(text: String) -> void:
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func show_game_over() -> void:
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	yield($MessageTimer, "timeout")

	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()


func update_score(score: int) -> void:
	$ScoreLabel.text = str(score)
