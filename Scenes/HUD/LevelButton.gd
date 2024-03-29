extends TextureButton

signal level_selected(id)

export (int) var level_id

func _ready():
	$Label.text = str(level_id + 1)


func display_saved_data(data):
	print(data.time)
	$Score.text = str(data.score) + "pts"
	$Time.text = str(data.time) + "s"

func _on_LevelButton_pressed():
	emit_signal("level_selected", level_id)
