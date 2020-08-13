/// @description Insert description here
// You can write your code in this editor

if (image_index < image_number - 1){
	if (keyboard_check_pressed(vk_space)){
		image_index += 1;
	}
} else if (image_index){
	if (keyboard_check_pressed(vk_space)){
		room_goto(room1);
	}
}