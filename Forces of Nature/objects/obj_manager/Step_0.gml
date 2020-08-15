/// @description Insert description here
// You can write your code in this editor


if(graphshown == false && keyboard_check_pressed(vk_tab)){
	instance_create_depth(700, 700, -5000, obj_graph);
	graphshown = true;
	audio_play_sound(snd_flip, 0, 0);
} else if(graphshown == true && keyboard_check_pressed(vk_tab)){
	instance_destroy(obj_graph);
	graphshown = false;
	audio_play_sound(snd_flip, 0, 0);
}

if(ruleshown == false && keyboard_check_pressed(ord("Q"))){
	instance_create_depth(700, 700, -5000, obj_rules);
	ruleshown = true;
	audio_play_sound(snd_flip, 0, 0);
} else if(ruleshown == true && keyboard_check_pressed(ord("Q"))){
	instance_destroy(obj_rules);
	ruleshown = false;
	audio_play_sound(snd_flip, 0, 0);
}


switch(global.state){
	
	case(global.state_shuffle):
	global.shownumbers = true;
	wait_timer++;
	if (movetimer % 5 == 0 && wait_timer >= 0){
		if (woodcount < 20){
				var newwood = instance_create_layer(177, -300, "Instances", obj_wood);
				newwood.x = 177;
				newwood.y = -300;
				newwood.target_x = 177;
				newwood.target_y = 693;
				newwood.face_up = false;
				newwood.face_index = 0;
				woodcount++;
				audio_play_sound(snd_flip, 0, 0);
				ds_list_add(global.deck, newwood);
			
		}
		if (firecount < 20){
				var newfire = instance_create_layer(177, -300, "Instances", obj_fire);
				newfire.x = 177;
				newfire.y = 0;
				newfire.target_x = 177;
				newfire.target_y = 693;
				newfire.face_up = false;
				newfire.face_index = 1;
				firecount++;
				audio_play_sound(snd_flip, 0, 0);
				ds_list_add(global.deck, newfire);
			
		}
		if (metalcount < 20){
				var newmetal = instance_create_layer(-500,693, "Instances", obj_metal);
				newmetal.x = -500;
				newmetal.y = 693;
				newmetal.target_x = 177;
				newmetal.target_y =693;
				newmetal.face_up = false;
				newmetal.face_index = 2;
				metalcount++;
				audio_play_sound(snd_flip, 0, 0);
				ds_list_add(global.deck, newmetal);
			
		}
		if (watercount < 20){
				var newwater = instance_create_layer(177, room_height+300, "Instances", obj_water);
				newwater.x = 177;
				newwater.y = room_height+300;
				newwater.target_x = 177;
				newwater.target_y = 693;
				newwater.face_up = false;
				newwater.face_index = 3;
				watercount++;
				audio_play_sound(snd_flip, 0, 0);
				ds_list_add(global.deck, newwater);
		}
		if (soilcount < 20){
				var newsoil = instance_create_layer(177, room_height+300, "Instances", obj_soil);
				newsoil.x = 177;
				newsoil.y = room_height+300;
				newsoil.target_x = 177;
				newsoil.target_y = 693;
				newsoil.face_up = false;
				newsoil.face_index = 4;
				soilcount++;
				audio_play_sound(snd_flip, 0, 0);
				ds_list_add(global.deck, newsoil);
		}
	}
		if (ds_list_size(global.deck) == 100){
			ds_list_shuffle(global.deck);
			global.state = global.state_deal;
			wait_timer = 0;
		}
	break;
	
	case(global.state_deal):
	wait_timer++;
	
		if (movetimer == 0){
			cardnum_player = ds_list_size(global.player);
			cardnum_ai = ds_list_size(global.ai);
			if(roundcount == 1){
				if(cardnum_player < 5){
					var dealt_card_player = global.deck[| ds_list_size(global.deck) - 1];
					ds_list_delete(global.deck, ds_list_size(global.deck) - 1);
					ds_list_add(global.player, dealt_card_player);
					for(i = 0; i < 5; i++){
						dealt_card_player.target_x = 924 - cardnum_player*191;
						dealt_card_player.target_y = 1168;
						dealt_card_player.face_up = true;
						audio_play_sound(snd_flip, 0, 0);
					}
				} 
				if(cardnum_ai < 5){
					var dealt_card_ai = global.deck[| ds_list_size(global.deck) - 1];
					ds_list_delete(global.deck, ds_list_size(global.deck) - 1);
					ds_list_add(global.ai, dealt_card_ai);
					dealt_card_ai.target_x = 924 - cardnum_ai*191;
					dealt_card_ai.target_y = 240;
					dealt_card_ai.face_up = false;
					dealt_card_ai.in_hand = false;
					audio_play_sound(snd_flip, 0, 0);
				}
				if(cardnum_player == 5 && cardnum_ai == 5){
					global.state = global.state_match;
					wait_timer = 0;
				}
			} else{
				
				for(i = 0; i < 5; i++){
					var examine_x = 924-i*191;
					if(instance_position(examine_x, 1168, obj_wood) == noone && instance_position(examine_x, 1168, obj_fire) == noone && instance_position(examine_x, 1168, obj_metal) == noone && instance_position(examine_x, 1168, obj_water) == noone && instance_position(examine_x, 1168, obj_soil) == noone){
						var dealt_card_player = global.deck[| ds_list_size(global.deck) - 1];
				        dealt_card_player.target_x = examine_x;
						dealt_card_player.target_y = 1168;
						dealt_card_player.face_up = true;
						audio_play_sound(snd_flip, 0, 0);
						ds_list_replace(global.player, i, dealt_card_player);
						ds_list_delete(global.deck, ds_list_size(global.deck) - 1);
					}
				}
				for(i = 0; i < 5; i++){
					var examine_x = 924-i*191;
					if(instance_position(examine_x, 240, obj_wood) == noone && instance_position(examine_x, 240, obj_fire) == noone && instance_position(examine_x, 240, obj_metal) == noone && instance_position(examine_x, 240, obj_water) == noone && instance_position(examine_x, 240, obj_soil) == noone){
						var dealt_card_ai = global.deck[| ds_list_size(global.deck) - 1];
					 	dealt_card_ai.target_x = examine_x;
						dealt_card_ai.target_y = 240;
						dealt_card_ai.face_up = false;
						dealt_card_ai.in_hand = false;
						audio_play_sound(snd_flip, 0, 0);
						ds_list_replace(global.ai, i, dealt_card_ai);
						ds_list_delete(global.deck, ds_list_size(global.deck) - 1);
					}
				}
				wait_timer = 0;
				global.state = global.state_match;
			
			}
		}
	
	break;
	
	case(global.state_match):
	if(roundcount % 4 == 1){
		player_signal.image_index = 1;
		ai_signal.image_index = 4;
		attack_player = false;
		for(i = 0; i < ds_list_size(global.player); i++){
			global.player[| i].in_hand = true;
		}
		for(i = 0; i < ds_list_size(global.ai); i++){
			global.ai[| i].in_hand = false;
		}
		if(majorsignal_show == true){
			instance_create_layer(0.5*room_width-3, 858, "Instances", obj_signalbar);
		}
		if(global.selected != noone && mouse_check_button_pressed(mb_left)){
			if(global.major_chosen == false){
				global.major_player = global.selected;
				global.major_player.target_x = 0.5*room_width-3;
				global.major_player.target_y = 858;
				global.major_player.in_hand = false;
				global.major_chosen = true;
				audio_play_sound(snd_selection, 0, 0);
				ds_list_add(global.on_desk, global.major_player);
				instance_destroy(obj_signalbar);
				instance_create_layer(473, 859, "Instances", obj_signalbar);
				for(i = 0; i < ds_list_size(global.player); i++){
					if(global.player[| i].face_index == global.major_player.grown){
						instance_create_layer(global.player[| i].x, global.player[| i].y, "Instances", obj_signalbar);
					}
				}
				confirm_enable = true;
				majorsignal_show = false;
				power_player = 20;
				instance_create_layer(178, 920, "Instances", obj_confirm);
			} else if(global.minor1_chosen == false){
				if(global.selected.face_index == global.major_player.grown){
					global.minor1_player = global.selected;
					global.minor1_player.target_x = 473;
					global.minor1_player.target_y = 859;
					global.minor1_player.in_hand = false;
					global.minor1_chosen = true;
					ds_list_add(global.on_desk, global.minor1_player);
					audio_play_sound(snd_selection, 0, 0);
					instance_destroy(obj_signalbar);
					instance_create_layer(918, 859, "Instances", obj_signalbar);
					for(i = 0; i < ds_list_size(global.player); i++){
						if(global.player[| i].face_index == global.major_player.grown){
							if(global.player[| i].in_hand == true){
								instance_create_depth(global.player[| i].x, global.player[| i].y,50, obj_signalbar);
							}
						}
					}
					power_player = 30;
					confirm_enable = true;
				}
			} else if(global.minor1_chosen == true && global.minor2_chosen == false){
				if(global.selected.face_index == global.major_player.grown){
					global.minor2_player = global.selected;
					global.minor2_player.target_x = 918;
					global.minor2_player.target_y = 859;
					global.minor2_player.in_hand = false;
					global.minor2_chosen = true;
					ds_list_add(global.on_desk, global.minor2_player);
					instance_destroy(obj_chosen);
					instance_destroy(obj_signalbar);
					audio_play_sound(snd_select, 0, 0);
					for(i = 0; i < ds_list_size(global.player); i++){
						global.player[| i].in_hand = false;
					}
					power_player = 40;
					roundcount += 1;
					wait_timer = 0;
					confirm_enable = false;
				}
			}
		}
		if(confirm_enable == true && position_meeting(mouse_x,mouse_y, obj_confirm) && mouse_check_button_pressed(mb_left)){
		roundcount += 1;
		wait_timer = 0;
		audio_play_sound(snd_select, 0, 0);
		instance_destroy(obj_signalbar);
	}
	} else if(roundcount % 4 == 2){
		for(i = 0; i < ds_list_size(global.ai); i++){
			global.ai[| i].in_hand = false;
		}
		player_signal.image_index = 4;
		ai_signal.image_index = 0;
		wait_timer++;
		if(wait_timer == 50){
			for(i = 0; i < ds_list_size(global.ai); i++){
				if(global.ai[| i].kill == global.major_player.face_index){
					global.major_ai = global.ai[| i];
					global.major_ai.target_x = 0.5*room_width-3;
				    global.major_ai.target_y = 565;
					global.major_ai.face_up = true;
					audio_play_sound(snd_flip, 0, 0);
					ds_list_add(global.on_desk, global.major_ai);
					power_ai = 20;
					break;
				}	
			}
			if(global.major_ai == noone){
				global.major_ai = global.ai[| irandom(4)];
				global.major_ai.target_x = 0.5*room_width-3;
				global.major_ai.target_y = 565;
				global.major_ai.face_up = true;
				ds_list_add(global.on_desk, global.major_ai);
				audio_play_sound(snd_flip, 0, 0);
				power_ai = 20;
			}
			if(global.major_ai != noone){
				for(i = 0; i < ds_list_size(global.ai); i++){
					var ai_card = global.ai[| i];
					if(global.minor1_ai == noone && ai_card.grow == global.major_ai.face_index){
						global.minor1_ai = ai_card;
						global.minor1_ai.target_x = 918;
						global.minor1_ai.target_y = 563;
						global.minor1_ai.face_up = true;
						power_ai = 30;
						audio_play_sound(snd_flip, 0, 0);
						ds_list_add(global.on_desk, global.minor1_ai);
					} else if(global.minor2_ai == noone && ai_card.grow == global.major_ai.face_index){
						global.minor2_ai = ai_card;
						global.minor2_ai.target_x = 473;
						global.minor2_ai.target_y = 563;
						global.minor2_ai.face_up = true;
						audio_play_sound(snd_flip, 0, 0);
						ds_list_add(global.on_desk, global.minor2_ai);
						power_ai = 40;
					}
				}
				roundcount++;
				wait_timer = 0;
				global.state = global.state_judge;
			}
		}
		break;
	} else if(roundcount % 4 == 3){
		player_signal.image_index = 4;
		ai_signal.image_index = 1;
		wait_timer++;
		if(wait_timer == 100){
			for(i = 0; i < 5; i++){
				if(global.ai[| i].kill == global.pos_selected_player.face_index){
					global.major_ai = global.ai[| i];
					global.major_ai.target_x = 0.5*room_width-3;
				    global.major_ai.target_y = 565;
					global.major_ai.face_up = true;
					audio_play_sound(snd_flip, 0, 0);
					ds_list_add(global.on_desk, global.major_ai);
					power_ai = 20;
					break;
				}	
			}
			if(global.major_ai == noone){
				global.major_ai = global.ai[| irandom(4)];
				global.major_ai.target_x = 0.5*room_width-3;
				global.major_ai.target_y = 565;
				global.major_ai.face_up = true;
				audio_play_sound(snd_flip, 0, 0);
				ds_list_add(global.on_desk, global.major_ai);
				power_ai = 20;
			}
			if(global.major_ai != noone){
				for(i = 0; i < 5; i++){
					var ai_card = global.ai[| i];
					if(global.minor1_ai == noone && ai_card.grow == global.major_ai.face_index){
						global.minor1_ai = ai_card;
						global.minor1_ai.target_x = 918;
						global.minor1_ai.target_y = 563;
						global.minor1_ai.face_up = true;
						audio_play_sound(snd_flip, 0, 0);
						ds_list_add(global.on_desk, global.minor1_ai);
						power_ai = 30;
					} else if(global.minor2_ai == noone && ai_card.grow == global.major_ai.face_index){
						global.minor2_ai = ai_card;
						global.minor2_ai.target_x = 473;
						global.minor2_ai.target_y = 563;
						global.minor2_ai.face_up = true;
						audio_play_sound(snd_flip, 0, 0);
						ds_list_add(global.on_desk, global.minor2_ai);
						power_ai = 40;
					}
					if(i = 4) {roundcount++;}
				}
			}
		}
	} else if(roundcount % 4 == 0){
		player_signal.image_index = 0;
		ai_signal.image_index = 4;
		attack_player = true;
		for(i = 0; i < ds_list_size(global.player); i++){
			global.player[| i].in_hand = true;
		}
		for(i = 0; i < ds_list_size(global.ai); i++){
			global.ai[| i].in_hand = false;
		}
		if(majorsignal_show == true){
			instance_create_layer(0.5*room_width-3, 858, "Instances", obj_signalbar);
		}
		if(global.selected != noone && mouse_check_button_pressed(mb_left)){
			if(global.major_chosen == false){
				global.major_player = global.selected;
				global.major_player.target_x = 0.5*room_width-3;
				global.major_player.target_y = 858;
				global.major_player.in_hand = false;
				global.major_chosen = true;
				audio_play_sound(snd_selection, 0, 0);
				ds_list_add(global.on_desk, global.major_player);
				instance_destroy(obj_signalbar);
				instance_create_layer(473, 859, "Instances", obj_signalbar);
				for(i = 0; i < ds_list_size(global.player); i++){
					if(global.player[| i].face_index == global.major_player.grown){
						instance_create_layer(global.player[| i].x, global.player[| i].y, "Instances", obj_signalbar);
					}
				}
				confirm_enable = true;
				majorsignal_show = false;
				power_player = 20;
				instance_create_layer(178, 920, "Instances", obj_confirm);
			} else if(global.minor1_chosen == false){
				if(global.selected.face_index == global.major_player.grown){
					global.minor1_player = global.selected;
					global.minor1_player.target_x = 473;
					global.minor1_player.target_y = 859;
					global.minor1_player.in_hand = false;
					global.minor1_chosen = true;
					audio_play_sound(snd_selection, 0, 0);
					ds_list_add(global.on_desk, global.minor1_player);
					instance_destroy(obj_signalbar);
					instance_create_layer(918, 859, "Instances", obj_signalbar);
					for(i = 0; i < ds_list_size(global.player); i++){
						if(global.player[| i].face_index == global.major_player.grown){
							if(global.player[| i].in_hand == true){
								instance_create_depth(global.player[| i].x, global.player[| i].y,50, obj_signalbar);
							}
						}
					}
					power_player = 30;
					confirm_enable = true;
				}
			} else if(global.minor1_chosen == true && global.minor2_chosen == false){
				if(global.selected.face_index == global.major_player.grown){
					global.minor2_player = global.selected;
					global.minor2_player.target_x = 918;
					global.minor2_player.target_y = 859;
					global.minor2_player.in_hand = false;
					global.minor2_chosen = true;
					ds_list_add(global.on_desk, global.minor2_player);
					instance_destroy(obj_chosen);
					instance_destroy(obj_signalbar);
					audio_play_sound(snd_select, 0, 0);
					for(i = 0; i < ds_list_size(global.player); i++){
						global.player[| i].in_hand = false;
					}
					power_player = 40;
					roundcount += 1;
					confirm_enable = false;
					wait_timer = 0;
					global.state = global.state_judge;
				}
			}
		}
		if(confirm_enable == true && position_meeting(mouse_x,mouse_y, obj_confirm) && mouse_check_button_pressed(mb_left)){
			roundcount += 1;
			instance_destroy(obj_signalbar);
			wait_timer = 0;
			audio_play_sound(snd_select, 0, 0);
			global.state = global.state_judge;
		}
	}
	break;
	
	case(global.state_judge):
	card_alpha = 1;
	wait_timer++;
	instance_destroy(obj_confirm);
	var roundfinish = false;
	if (wait_timer >= 70){
		if(wait_timer == 70){
			basic_harm = 0;
			if(attack_player == true){
				basic_harm = power_player - power_ai;
				audio_play_sound(snd_hit, 0, 0);
				if(global.major_player.kill == global.major_ai.face_index){
					basic_harm = power_player;
					ai_signal.image_index = 3;
				} else if(global.major_player.killed == global.major_ai.face_index){
					basic_harm = -power_ai;
					player_signal.image_index = 3;
				} 
				if(basic_harm > 0){
					if(global.pos_selected_ai.kill == global.major_player.face_index){
						basic_harm *= 0.5;
						var state_pos = instance_create_depth(global.pos_selected_ai.x, global.pos_selected_ai.y, -10000, obj_state_pos);
						state_pos.image_index = 0;
						state_pos.image_speed = 0;
						audio_play_sound(snd_resist, 0, 0);
					} else if(global.pos_selected_ai.killed == global.major_player.face_index){
						basic_harm *= 1.5;
						var state_pos = instance_create_depth(global.pos_selected_ai.x, global.pos_selected_ai.y, -10000, obj_state_pos);
						state_pos.image_index = 1;
						state_pos.image_speed = 0;
						audio_play_sound(snd_weakened, 0, 0);
					}
					alarm[0] = bg_color;
				    alarm[2] = shake_screen;
				} else if(basic_harm < 0){
					alarm[1] = bg_color;
					var state_pos = instance_create_depth(global.pos_selected_ai.x, global.pos_selected_ai.y, -10000, obj_state_pos);
					state_pos.image_index = 2;
					state_pos.image_speed = 0;
					audio_play_sound(snd_revive, 0, 0);
				} else{
					roundfinish = true;
				}
				life = global.life_ai - basic_harm;
				life = max(0, life);
				life = min(life, 120);
			} else{
				basic_harm = power_ai - power_player;
				audio_play_sound(snd_hit, 0, 0);
				if(global.major_ai.kill == global.major_player.face_index){
					basic_harm = power_ai;
					player_signal.image_index = 3;
				} else if(global.major_ai.killed == global.major_player.face_index){
					basic_harm = -power_player;
					ai_signal.image_index = 3;
				}
				if(basic_harm > 0){
					alarm[0] = bg_color;
					alarm[2] = shake_screen;
					if(global.pos_selected_player.kill == global.major_ai.face_index){
						basic_harm *= 0.5;
						audio_play_sound(snd_resist, 0, 0);
						var state_pos = instance_create_depth(global.pos_selected_player.x, global.pos_selected_player.y, -10000, obj_state_pos);
						state_pos.image_index = 0;
						state_pos.image_speed = 0;
					} else if(global.pos_selected_player.killed == global.major_ai.face_index){
						basic_harm *= 1.5;
						audio_play_sound(snd_weakened, 0, 0);
						var state_pos = instance_create_depth(global.pos_selected_player.x, global.pos_selected_player.y, -10000, obj_state_pos);
						state_pos.image_index = 1;
						state_pos.image_speed = 0;
					}
				} else if(basic_harm < 0){
					alarm[1] = bg_color;
					audio_play_sound(snd_revive, 0, 0);
					var state_pos = instance_create_depth(global.pos_selected_player.x, global.pos_selected_player.y, -10000, obj_state_pos);
						state_pos.image_index = 2;
						state_pos.image_speed = 0;
				} else {
					roundfinish = true;
				}
				life = global.life_player - basic_harm;
				life = max(0, life);
				life = min(life, 120);
			}
			movetimer = 0;
		}
		if(wait_timer >= 100 && roundfinish == false && movetimer % 2 = 0){
			if(attack_player == true){
				if(basic_harm > 0){
					alarm[0] = bg_color;
					alarm[2] = shake_screen;
					alarm[3] = shake_card;
					if(global.life_ai != life){
						if(global.life_ai > life){
							global.life_ai--;
						} else{
							global.life_ai++;
						}
					}else{
						roundfinish = true;
					}
					
				} else if(basic_harm < 0){
					alarm[1] = bg_color;
						if(global.life_ai != life){
							if(global.life_ai > life){
								global.life_ai--;
							} else{
								global.life_ai++;
							}
						} else {
							roundfinish = true;
						}
					}
			} else{
				if(basic_harm > 0){
					alarm[0] = bg_color;
					alarm[2] = shake_screen;
					alarm[3] = shake_card;
					if(global.life_player != life){
						if(global.life_player > life){
							global.life_player--;
						} else{
							global.life_player++;
						}
					}else{
						roundfinish = true;
					}
				} else if(basic_harm < 0){
					alarm[1] = bg_color;
						if(global.life_player != life){
							if(global.life_player > life){
								global.life_player--;
							} else{
								global.life_player++;
							}
						} else{
							roundfinish = true;
						}
				}
				
			}
	}
		if(roundfinish == true){
			if(global.life_player == 0 || global.life_ai == 0 || global.numcards == 0){
				global.state = global.state_final;
			}else{
				if(basic_harm == 0){
					global.state = global.state_deal;
					wait_timer = 0;
					power_ai = 0;
					power_player = 0;
					card_alpha = 1;instance_destroy(obj_state_pos);
					ds_list_clear(global.on_desk);
					instance_destroy(global.major_player);
					instance_destroy(global.minor1_player);
					instance_destroy(global.minor2_player);
					instance_destroy(global.major_ai);
					instance_destroy(global.minor1_ai);
					instance_destroy(global.minor2_ai);
					global.major_chosen = false;
					global.minor1_chosen = false;
					global.minor2_chosen = false;
					global.major_player = noone;
					global.minor1_player = noone;
					global.minor2_player = noone;
					global.major_ai = noone;
					global.minor1_ai = noone;
					global.minor2_ai = noone;
				}else{
					if(wait_timer >=270){
						global.state = global.state_deal;
						wait_timer = 0;
						power_ai = 0;
						power_player = 0;
						card_alpha = 1;instance_destroy(obj_state_pos);
						ds_list_clear(global.on_desk);
						instance_destroy(global.major_player);
						instance_destroy(global.minor1_player);
						instance_destroy(global.minor2_player);
						instance_destroy(global.major_ai);
						instance_destroy(global.minor1_ai);
						instance_destroy(global.minor2_ai);
						global.major_chosen = false;
						global.minor1_chosen = false;
						global.minor2_chosen = false;
						global.major_player = noone;
						global.minor1_player = noone;
						global.minor2_player = noone;
						global.major_ai = noone;
						global.minor1_ai = noone;
						global.minor2_ai = noone;
					}
				}
			}
		}
	}
	break;
	
	case(global.state_final):
	final_alpha++;
	audio_stop_sound(snd_background);
	if(end_sound == false){
		audio_play_sound(snd_end,0,0);
		end_sound = true;
	}
	instance_destroy(obj_state_pos);
	if(global.life_ai == 0){
		var final = instance_create_depth(0.5*room_width, 0.5*room_height, -1500, obj_win);
		final.image_alpha = final_alpha;
	} else if(global.life_player == 0){
		var final = instance_create_depth(0.5*room_width, 0.5*room_height, -1500, obj_lose);
		final.image_alpha = final_alpha;
	}
	if(global.numcards == 0){
		var final = instance_create_depth(0.5*room_width, 0.5*room_height, -1500, obj_draw);
		final.image_alpha = final_alpha;
	}
	if(mouse_check_button_pressed(mb_left)){
		end_sound = false;
		room_restart();
	}
	break;
}


	
	
movetimer++;

if(movetimer == 20){
	movetimer = 0;
}

global.numcards = ds_list_size(global.deck);