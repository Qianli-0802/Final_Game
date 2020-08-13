/// @description Insert description here
// You can write your code in this editor

if(global.state == global.state_pos_choice){
	if(global.pos_selected_player != noone){
		if(mouse_check_button_pressed(mb_left)){
			global.pos_selected_player.face_up = true;
			global.pos_chosen = true;
			global.state = global.state_pos_clear;
		}	
	}
}
	
if(global.state == global.state_pos_clear){
	wait_timer++;
	if(wait_timer = 100){
		if(global.pos_selected_ai = noone){
			global.pos_selected_ai = global.pos_selected_player;
			while(global.pos_selected_ai = global.pos_selected_player){
				var index = floor(random_range(0,4.1));
				global.pos_selected_ai = global.deck_pos[| index];
			}
		}
		var selected_ai = global.pos_selected_ai;
		instance_create_layer(selected_ai.x, selected_ai.y, "Instances", obj_pos_selection_black);
		selected_ai.face_up = true;
		ai_selected = true;
	}
	if(global.pos_selected_ai != noone && keyboard_check_pressed(vk_space)){
		for(i = 0; i < 5; i++){
			var dealtcard = global.deck_pos[| i];
			if(dealtcard == global.pos_selected_player){
				dealtcard.target_x = 1218;
				dealtcard.target_y = 1213;
			} else if(dealtcard == global.pos_selected_ai){
				dealtcard.target_x = 1218;
				dealtcard.target_y = 191;
			} else{
				instance_destroy(dealtcard);
			}
		}
		ds_list_clear(global.deck_pos);
		instance_destroy(obj_pos_selection);
		instance_destroy(obj_pos_selection_black);
		var lay_id = layer_get_id("Background");
		var back_id = layer_background_get_id(lay_id);
		layer_background_sprite(back_id, spr_chessboard2);
		global.state = global.state_shuffle;
	}
}