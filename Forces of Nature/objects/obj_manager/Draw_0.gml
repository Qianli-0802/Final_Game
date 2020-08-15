/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center);
draw_set_valign(fa_top);

if(global.shownumbers == true){
	draw_set_color(col_blue);
	draw_set_font(fnt_words2);
	draw_text(160, 430, "Remaining:\n" + string(global.numcards));
	draw_text(0.5*room_width-50, 50, "Tab - Graph;  Q - Tips");
}

if(global.state == global.state_match){
	if(roundcount % 4 == 1 || roundcount % 4 == 0){
		draw_set_color(col_blue);
		if(global.major_player == noone){
			instruct_string = "Major Card defines the property of your power. Power 20.";
			if(position_meeting(mouse_x, mouse_y, obj_wood)||position_meeting(mouse_x, mouse_y, obj_fire)||position_meeting(mouse_x, mouse_y, obj_metal)||position_meeting(mouse_x, mouse_y, obj_water)||position_meeting(mouse_x, mouse_y, obj_soil)){
			instruct_string = "";
		}
			draw_text(0.5*room_width-180, room_height-110, instruct_string);
		} else if(global.minor1_ai == noone){
			instruct_string = "Assit Card adds to your power by 10. \nMajor Card can only be assisted by those grow it.";
			if(position_meeting(mouse_x, mouse_y, obj_wood)||position_meeting(mouse_x, mouse_y, obj_fire)||position_meeting(mouse_x, mouse_y, obj_metal)||position_meeting(mouse_x, mouse_y, obj_water)||position_meeting(mouse_x, mouse_y, obj_soil)){
			instruct_string = "";
		}
			draw_text(0.5*room_width-180, room_height-110, instruct_string);		
		}
	}
	if(instance_exists(obj_confirm)){
		draw_text(178, 970, "Click to confirm.");
	}
}

if(global.state == global.state_final){
	draw_set_color(c_black);
	draw_set_font(fnt_words2);
	draw_text(0.5*room_width, room_height-200, "Click to restart")
}