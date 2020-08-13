/// @description Insert description here
// You can write your code in this editor


if (global.state == global.state_pos_choice){
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	layer_background_sprite(back_id, spr_chessboard1);
	
	var newcard1 = instance_create_layer(0.5*room_width, 0.4*room_height, "Instances", obj_wood_pos);
	var newcard2 = instance_create_layer(0.5*room_width, 0.4*room_height, "Instances", obj_fire_pos);
	var newcard3 = instance_create_layer(0.5*room_width, 0.4*room_height, "Instances", obj_metal_pos);
	var newcard4 = instance_create_layer(0.5*room_width, 0.4*room_height, "Instances", obj_water_pos);
	var newcard5 = instance_create_layer(0.5*room_width, 0.4*room_height, "Instances", obj_soil_pos);
	ds_list_add(global.deck_pos, newcard1);
	ds_list_add(global.deck_pos, newcard2);
	ds_list_add(global.deck_pos, newcard3);
	ds_list_add(global.deck_pos, newcard4);
	ds_list_add(global.deck_pos, newcard5);
	
	for (var i = 0; i <5; i++){
		var newcard = global.deck_pos[| i];
		newcard.face_index = i;
		newcard.face_up = false;
		newcard.target_x = 0.5*room_width;
		newcard.target_y = 0.4*room_height;
		newcard.x = newcard.target_x;
		newcard.y = newcard.target_y;
	}
	ds_list_shuffle(global.deck_pos);
	for(i = 0; i < ds_list_size(global.deck_pos); i++){
		var placecard = global.deck_pos[| i];
		if(i = 0){
			placecard.x = 0.25*room_width;
			placecard.y = 0.2*room_height;
			placecard.target_x = 0.25*room_width;
			placecard.target_y = 0.2*room_height;
		} else if(i = 1){
			placecard.x = 0.75*room_width;
			placecard.y = 0.2*room_height;
			placecard.target_x = 0.75*room_width;
			placecard.target_y = 0.2*room_height;
		} else if(i = 2){
			placecard.x = 0.5*room_width;
			placecard.y = 0.4*room_height;
			placecard.target_x = 0.5*room_width;
			placecard.target_y = 0.4*room_height;
		} else if(i = 3){
			placecard.x = 0.25*room_width;
			placecard.y = 0.6*room_height;
			placecard.target_x = 0.25*room_width;
			placecard.target_y = 0.6*room_height;
		} else if(i = 4){
			placecard.x = 0.75*room_width;
			placecard.y = 0.6*room_height;
			placecard.target_x = 0.75*room_width;
			placecard.target_y = 0.6*room_height;
		}
	}
}

wait_timer = 0;
sentence = "";
sentence2 = "";
ai_selected = false;

global.pos_selected_player = noone;
global.pos_selected_ai = noone;