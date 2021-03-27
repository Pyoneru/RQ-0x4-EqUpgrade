extends Node

const GOLD: String = "gold"
const GEM: String = "gem"
const SUCCESS: String = "success"
const FAIL: String = "fail"
const DECREASE: String = "decrease"

const UPGRADE_LEVEL_1: Dictionary = {GOLD: 500, GEM: 10, SUCCESS: 100, FAIL: 0, DECREASE: 0}
const UPGRADE_LEVEL_2: Dictionary = {GOLD: 1000, GEM: 15, SUCCESS: 95, FAIL: 5, DECREASE: 0}
const UPGRADE_LEVEL_3: Dictionary = {GOLD: 3000, GEM: 20, SUCCESS: 90, FAIL: 10, DECREASE: 0}
const UPGRADE_LEVEL_4: Dictionary = {GOLD: 4000, GEM: 30, SUCCESS: 80, FAIL: 20, DECREASE: 0}
const UPGRADE_LEVEL_5: Dictionary = {GOLD: 5000, GEM: 35, SUCCESS: 70, FAIL: 20, DECREASE: 10 }
const UPGRADE_LEVEL_6: Dictionary = {GOLD: 10000, GEM: 60, SUCCESS: 60, FAIL: 28, DECREASE: 12}
const UPGRADE_LEVEL_7: Dictionary = {GOLD: 30000, GEM: 140, SUCCESS: 50, FAIL: 36, DECREASE: 14}
const UPGRADE_LEVEL_8: Dictionary = {GOLD: 50000, GEM: 250, SUCCESS: 40, FAIL: 44, DECREASE: 16}
const UPGRADE_LEVEL_9: Dictionary = {GOLD: 100000, GEM: 500, SUCCESS: 30, FAIL: 52, DECREASE: 18}
const UPGRADE_LEVEL_10: Dictionary = {GOLD: 200000, GEM: 1000, SUCCESS: 20, FAIL: 60, DECREASE: 20}
const EMPTY: Dictionary = {}
	

func get_by_level(level: int) -> Dictionary:
	if level == 1:
		return UPGRADE_LEVEL_1
	if level == 2:
		return UPGRADE_LEVEL_2
	if level == 3:
		return UPGRADE_LEVEL_3
	if level == 4:
		return UPGRADE_LEVEL_4
	if level == 5:
		return UPGRADE_LEVEL_5
	if level == 6:
		return UPGRADE_LEVEL_6
	if level == 7:
		return UPGRADE_LEVEL_7
	if level == 8:
		return UPGRADE_LEVEL_8
	if level == 9:
		return UPGRADE_LEVEL_9
	if level == 10:
		return UPGRADE_LEVEL_10
	return EMPTY
