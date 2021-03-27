extends Control

onready var GoldLabel = $GoldLabel
onready var GemLabel = $GemLabel

func update_text(gold: int, gem: int):
	GoldLabel.text = str(gold)
	GemLabel.text = str(gem)
