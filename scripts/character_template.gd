extends KinematicBody2D

onready var sprite = get_node("CharacterSprite")
onready var anim_player = get_node("AnimationPlayer")
onready var anim_data = get_node("AnimationData")


#func _ready():
#	add_animations_to_animation_player()
#	print(anim_player.get_animation_list())
#
#func add_animations_to_animation_player():
#	var animations_in_data = anim_data.anims
#	for i in animations_in_data:
#		# get the index of each animation and use that as the index for the animation track
#		var index_of_i = animations_in_data.find(i)
#		var anim = Animation.new()
#		anim_player.add_animation(i, anim)
#		anim.add_track(Animation.TYPE_VALUE, index_of_i)
#		anim.length = 0.6
#		anim.loop = true

## everything below here works
## but I want to move the process of adding the frames to the animation into the "add_animations" function

#func set_animation():
#	var anim = Animation.new()
#	anim_player.add_animation("walk_right", anim)
#	anim.add_track(Animation.TYPE_VALUE, 0)
#	anim.length = 0.6
#	anim.loop = true
#
#	var path_to_sprite = String(sprite.get_path()) + ":frame"
#	anim.track_set_path(0, path_to_sprite)
#	anim.track_insert_key(0, 0.0, 112)
#	anim.track_insert_key(0, 0.1, 113)
#	anim.track_insert_key(0, 0.2, 114)
#	anim.track_insert_key(0, 0.3, 115)
#	anim.track_insert_key(0, 0.4, 116)
#	anim.track_insert_key(0, 0.5, 117)
#	anim_player.play("walk_right")

func _input(event):
	if event.is_action_pressed("right"):
		sprite.frame = 0
	elif event.is_action_pressed("up"):
		sprite.frame = 1
	elif event.is_action_pressed("left"):
		sprite.frame = 2
	elif event.is_action_pressed("down"):
		sprite.frame = 3

