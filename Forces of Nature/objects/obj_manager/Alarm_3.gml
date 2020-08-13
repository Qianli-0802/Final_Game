/// @description Insert description here
// You can write your code in this editor

if(global.state == global.state_judge){
	shake_card = shake_card -1; //ADDED count down the screen shake timer
	alarm[3] = shake_card; //ADDED reset this alarm to go off at the new time
	if(attack_player == true){
		global.pos_selected_ai.x = irandom_range(-shake_card,shake_card);
		global.pos_selected_ai.y = irandom_range(-shake_card,shake_card);
	} else {
		global.pos_selected_player.x = irandom_range(-shake_card,shake_card);
		global.pos_selected_player.y = irandom_range(-shake_card,shake_card);
	}
	//ADDED move the camera's position within a random range based on our timer
	if(shake_card <= 0){ //ADDED if we reach 0, reset the alarm
		shake_card = 3;
	}
}