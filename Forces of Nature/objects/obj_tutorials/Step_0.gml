/// @description Insert description here
// You can write your code in this editor

if (image_index < image_number - 1){
	if (mouse_check_button_pressed(mb_left)){
		audio_play_sound(snd_flip, 0, 0);
		image_index += 1;
	}
} else if (image_index){
	if (mouse_check_button_pressed(mb_left)){
		room_goto(room1);
	}
}