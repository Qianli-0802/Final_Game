/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center);

if(global.shownumbers == true){
	draw_set_color(c_black);
	draw_set_font(fnt_words2);
	draw_text(160, 430, "Remaining:\n" + string(global.numcards));
	draw_text(0.5*room_width, 50, "Press Tab to see the graph");
}