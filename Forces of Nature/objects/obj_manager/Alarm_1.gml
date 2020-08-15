/// @description Insert description here
// You can write your code in this editor
if(global.state == global.state_judge){
	bg_color = bg_color - 1;

	alarm[1] = bg_color; //ADDED reset the alarm to go off a the new time
	if(bg_color % 2 == 0){ //ADDED if the timer is even
		if(attack_player == false){
			switch(global.major_player.face_index){
				case(0): layer_background_blend(back_id, col_wood);
				break;
				case(1): layer_background_blend(back_id, col_fire);
				break;
				case(2): layer_background_blend(back_id, col_metal);
				break;
				case(3): layer_background_blend(back_id, col_water);
				break;
				case(4): layer_background_blend(back_id, col_soil);
				break;
			}
		} else{
			switch(global.major_ai.face_index){
				case(0): layer_background_blend(back_id, col_wood);
				break;
				case(1): layer_background_blend(back_id, col_fire);
				break;
				case(2): layer_background_blend(back_id, col_metal);
				break;
				case(3): layer_background_blend(back_id, col_water);
				break;
				case(4): layer_background_blend(back_id, col_soil);
				break;
			}
		}
	} else{ //ADDED if the timer is odd
		layer_background_blend(back_id, -1); 
	}
	if(bg_color <= 0){ //ADDEDwhen the timer runs out
		layer_background_blend(back_id, -1); //ADDED make the timer red
		bg_color = 5; //ADDED reset the timer
	}
}