/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_words);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

col_fire = make_color_rgb(209, 26, 45);



if(global.state = global.state_pos_choice){
	sentence = "Choose a Card of Position";
	draw_text(0.5*room_width, 1100, sentence);
}

if(global.state = global.state_pos_clear){
	var selected = global.pos_selected_player;
	if (selected.face_index = 0){
		sentence = "Your Position: East - Place of Wood \nResist: Soil    Vulnerable: Metal";
	} else if(selected.face_index = 1){
		sentence = "Your Position: South - Place of Fire \nResist: Metal    Vulnerable: Water";
	} else if(selected.face_index = 2){
		sentence = "Your Position: West - Place of Metal \nResist: Wood    Vulnerable: Fire";
	} else if(selected.face_index = 3){
		sentence = "Your Position: North - Place of Water \nResist: Fire    Vulnerable: Soil";
	} else if(selected.face_index = 4){
		sentence = "Your Position: Center - Place of Soil \nResist: Water    Vulnerable: Wood";
	}
	draw_set_font(fnt_words2);
	draw_set_color(col_fire);
	draw_text(0.5*room_width, 1050, sentence);
	if(ai_selected == true){
		var selected_ai = global.pos_selected_ai;
		if (selected_ai.face_index = 0){
			sentence2 = "Opponent Position: East - Place of Wood \nResist: Soil    Vulnerable: Metal";
		} else if(selected_ai.face_index = 1){
			sentence2 = "Opponent Position: South - Place of Fire \nResist: Metal    Vulnerable: Water";
		} else if(selected_ai.face_index = 2){
			sentence2 = "Opponentr Position: West - Place of Metal \nResist: Wood    Vulnerable: Fire";
		} else if(selected_ai.face_index = 3){
			sentence2 = "Opponent Position: North - Place of Water \nResist: Fire    Vulnerable: Soil";
		} else if(selected_ai.face_index = 4){
			sentence2 = "Opponent Position: Center - Place of Soil \nResist: Water    Vulnerable: Wood";
		}
		draw_set_color(c_black);
		draw_text(0.5*room_width, 1170, sentence2);
		draw_set_color(col_fire);
		draw_text(0.5*room_width, 1300, "Click to Continue");	
	}
}

if(global.shownumbers == true){
	sentence = "";
	sentence2 = "";
	draw_text(0.5*room_width, 1050, sentence);
	draw_text(0.5*room_width, 1200, sentence2);
	draw_set_font(fnt_words2);
	draw_set_color(col_fire);
	draw_text(1218, 355, "Life: " + string(global.life_ai));
	draw_text(1218, 1010, "Life: " + string(global.life_player));
}
