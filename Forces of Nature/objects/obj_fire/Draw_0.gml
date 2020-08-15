/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(face_up == true){
	if(position_meeting(mouse_x, mouse_y, id)){
		draw_set_color(c_black);
		instruct_string = "Grow: Soil   Grown by: Wood   Kill: Metal   Killed by: Water"; 
		draw_text(0.5*room_width-180, room_height-110, instruct_string);
	}
}

