/// @description Insert description here
// You can write your code in this editor

if(global.state == global.state_match && in_hand == true){
	if(position_meeting(mouse_x, mouse_y, id)){
		global.selected = id;
		if(soundplay == false){
			audio_play_sound(snd_flip, 0, 0);
			soundplay = true;
		}
		instance_create_depth(x, y, -100, obj_chosen);
	} else if (global.selected = id){
		instance_destroy(obj_chosen);
		global.selected = noone;
		soundplay = false;
	}
}

if (destroy == true){
	instance_destroy();
}