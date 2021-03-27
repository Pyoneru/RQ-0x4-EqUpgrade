extends Sprite

onready var label = $Control/Label

const MIN_UPGRADE: int = 0
const MAX_UPGRADE: int = 10

var text: String setget set_text
var upgrade_level: int = 0

func _ready():
	update_label()

func update_label():
	self.text = "+ " + str(self.upgrade_level)

func set_text(txt: String):
	text = txt
	label.text = text

# Increase upgrade_level and update text label
func upgrade_up():
	if upgrade_level < MAX_UPGRADE:
		upgrade_level += 1
	update_label()

# Decrease upgrade_level and update text label
func upgrade_down():
	if upgrade_level > MIN_UPGRADE:
		upgrade_level -= 1
	update_label()
