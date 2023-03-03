extends AnimationPlayer


onready var sprite = $"../CharacterSprite"
# this variable is assigned through code, so no need to export
var anims = {}

# these never change, so no need to export
var directions : PoolStringArray = ["right", "up", "left", "down"]

#this variable is public so that we can add animation states from the inspector
export var states : PoolStringArray = ["idle", "walk"]

func _ready():
	set_animations()
	add_frames()
	var path_to_sprite = String(sprite.get_path()) + ":frame_coords"
	for i in anims:
		var anim = Animation.new()
		add_animation(anims[i]["name"], anim)
		anim.add_track(Animation.TYPE_VALUE, 0)
		anim.track_set_path(0, path_to_sprite)
		##no idea why the below line doesn't work
		##anim.track_insert_key(0, 0.0, Vector2(anims[i]["frame.coord.x.start"], anims[i]["frame.coord.y"]))
	print(get_animation_list())
#	print(len(anims))
#	print(anims)

func set_animations():# fill out "anims" dict with every combination of state + direction
	var animations_added = 0
	var states_added = 0
	var directions_added = 0
	while states_added < len(states):
		directions_added = 0
		while directions_added < len(directions):
			anims[animations_added] = {
				"state": states[states_added],
				"direction": directions[directions_added],
				"name": states[states_added] + "_" + directions[directions_added]
				}
			animations_added += 1
			directions_added += 1
		states_added += 1

func add_frames(): # add frame coord data to each animation
	var anims_with_frames = 0
	for i in anims:
		if anims[anims_with_frames]["state"] == "idle":
			anims[anims_with_frames]["frame_coord.y"] = 1
		elif anims[anims_with_frames]["state"] == "walk":
			anims[anims_with_frames]["frame.coord.y"] = 2
		else:
			print("I don't know where the frames are for this animation state")
		anims_with_frames += 1
	anims_with_frames = 0
	for i in anims:
		if anims[anims_with_frames]["direction"] == "right":
			anims[anims_with_frames]["frame.coord.x.start"] = 0
		elif anims[anims_with_frames]["direction"] == "up":
			anims[anims_with_frames]["frame.coord.x.start"] = 6
		elif anims[anims_with_frames]["direction"] == "left":
			anims[anims_with_frames]["frame.coord.x.start"] = 12
		else:
			anims[anims_with_frames]["frame.coord.x.start"] = 18
		anims_with_frames += 1
