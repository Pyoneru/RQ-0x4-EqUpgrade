extends Node2D

onready var ResultLabel = $Control/Result
onready var Wand = $Wand
onready var Upgrade = $Upgrade
onready var Summary = $Summary
onready var UpgradeCost = $UpgradeCost

onready var summary: Dictionary = {UpgradeCost.GOLD: 0, UpgradeCost.GEM: 0}

# Preapare data
func _ready() -> void:
	ResultLabel.text = "" # Clear result label
	updateUpgradeComponent()
	Summary.update_text(summary[UpgradeCost.GOLD], summary[UpgradeCost.GEM])

# Update text for needed materials to upgrade
func updateUpgradeComponent() -> void:
	var level: int = Wand.upgrade_level + 1
	if level < 11:
		var level_cost: Dictionary = UpgradeCost.get_by_level(level)
		Upgrade.update_text(
			level_cost[UpgradeCost.GOLD], 
			level_cost[UpgradeCost.GEM]
			)
	else:
		Upgrade.update_text(
			"--", 
			"--"
			)
			

# 1 = Success
# 0 = Fail
# -1 = Descreas
func UpdateResultLabel(result: int) -> void:
	if result == 1:
		ResultLabel.text = "Success"
		ResultLabel.add_color_override("font_color", Color.yellow)
	elif result == 0:
		ResultLabel.text = "Fail"
		ResultLabel.add_color_override("font_color", Color.gray)
	elif result == -1:
		ResultLabel.text = "Decrease"
		ResultLabel.add_color_override("font_color", Color.red)

# return:
# 1 if success
# 0 if fail
# -1 if deacrease
func GetUpgradeResult(success: int, fail: int, decrease: int) -> int:
	var rng = RandomNumberGenerator.new()
	rng.randomize();
	var r_success = rng.randi_range(0, success)
	var r_fail = rng.randi_range(0, fail)
	var r_decrease = rng.randi_range(0, decrease)

	if r_success >= r_fail and r_success >= r_decrease:
		return 1
	if r_decrease > r_success and r_decrease > r_fail:
		return -1
	return 0

func UpdateSummary(gold: int, gem: int):
	summary[UpgradeCost.GOLD] += gold
	summary[UpgradeCost.GEM] += gem
	Summary.update_text(summary[UpgradeCost.GOLD], summary[UpgradeCost.GEM])

# Try upgrade, print result and update summary
func _on_Button_pressed() -> void:
	var level: int = Wand.upgrade_level + 1
	if level < 11:
		var level_cost: Dictionary = UpgradeCost.get_by_level(level)
		var upgrade_result: int = GetUpgradeResult(
			level_cost[UpgradeCost.SUCCESS], 
			level_cost[UpgradeCost.FAIL], 
			level_cost[UpgradeCost.DECREASE]
			)
		UpdateResultLabel(upgrade_result)
		UpdateSummary(level_cost[UpgradeCost.GOLD], level_cost[UpgradeCost.GEM])
		if upgrade_result == 1:
			Wand.upgrade_up()
		elif upgrade_result == -1:
			Wand.upgrade_down()
