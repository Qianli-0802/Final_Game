/// @description Insert description here
// You can write your code in this editor

randomize();

global.state_pos_choice = 0;
global.state_pos_clear = 1;
global.state_shuffle = 2;
global.state_deal = 3;
global.state_match = 4;
global.state_judge = 5;
global.state_seasons = 6;
global.state_final = 7;

global.state = global.state_pos_choice;

global.numcards = 0;

global.deck_pos = ds_list_create();
global.deck = ds_list_create();
global.player = ds_list_create();
global.ai = ds_list_create();
global.on_desk = ds_list_create();


global.pos_chosen = false;
global.major_chosen = false;
global.minor1_chosen = false;
global.minor2_chosen = false;
global.selected = noone;
global.major_player = noone;
global.minor1_player = noone;
global.minor2_player = noone;
global.major_ai = noone;
global.minor1_ai = noone;
global.minor2_ai = noone;

global.life_ai = 100;
global.life_player = 100;

global.shownumbers = false;

woodcount = 0;
firecount = 0;
metalcount = 0;
watercount = 0;
soilcount = 0;

cardnum_player = 0;
cardnum_ai = 0;
power_player = 0;
power_ai = 0;
basic_harm = 0;
life = 0;

roundcount = 1;

attack_player = false;

graphshown = false;
majorsignal_show = true;
confirm_enable = false;

wait_timer = 0;
movetimer = 0;
final_alpha = 0;
card_alpha = 1;

ai_signal = instance_create_layer(1219, 568, "Instances", obj_signals);
player_signal = instance_create_layer(1219, 852, "Instances", obj_signals);
ai_signal.image_index = 4;
ai_signal.image_speed = 0;
player_signal.image_index = 4;
player_signal.image_speed = 0;

col_fire = make_color_rgb(209, 26, 45);
col_water = make_color_rgb(255, 255, 255);
col_wood = make_color_rgb(66, 134, 117);
col_metal = make_color_rgb(0, 0, 0);
col_soil = make_color_rgb(255, 166, 15);

lay_id = layer_get_id("Background");
back_id = layer_background_get_id(lay_id); 
shake_screen = 10;
shake_card = 3;
bg_color = 10;