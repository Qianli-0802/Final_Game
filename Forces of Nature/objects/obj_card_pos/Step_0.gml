/// @description Insert description here
// You can write your code in this editor


if(global.state == global.state_pos_choice){
	if(position_meeting(mouse_x, mouse_y, id)){
		instance_create_layer(x,y,"Instances", obj_pos_selection);
		global.pos_selected_player = id;
		if(soundplay == false){
			audio_play_sound(snd_flip, 0, 0);
			soundplay = true;
		}
	} else if (global.pos_selected_player = id){
		instance_destroy(obj_pos_selection);
		soundplay = false;
	}
}

