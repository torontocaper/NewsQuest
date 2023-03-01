extends Node

# this variable is assigned through code, so no need to export
# i still want to add more data to each entry
# so something like
# var anims = {
#	"idle_right" : {
#		"start_frame" : 0
#		"end_frame" : 5
#		"number_of_frames" : end_frame - start_frame # note i'm not sure if this is possible
# 	}
# }

var anims = {}

# these never change, so no need to export
var directions : PoolStringArray = ["right", "up", "left", "down"]

#this variable is public so we can add animation states from the inspector
export var states : PoolStringArray = ["idle", "walk"]

func set_animations():# fill out the "anims" dict with every combination of state + direction
	var animations_added = 0
	var states_added = 0
	var directions_added = 0
	while states_added < len(states):
		directions_added = 0
		while directions_added < len(directions):
			anims[animations_added] = states[states_added] + "_" + directions[directions_added]
			animations_added += 1
			directions_added += 1
		states_added += 1

func _ready():
	set_animations()
	print(len(anims))