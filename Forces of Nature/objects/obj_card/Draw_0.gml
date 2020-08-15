/// @description Insert description here
// You can write your code in this editor

if (abs(x - target_x) > 1){
	x = lerp(x, target_x, 0.4);
} else{
	x = target_x;
}

if (abs(y - target_y) > 1){
	y = lerp(y, target_y, 0.4);
} else{
	y = target_y;
}

if (face_index == 0) sprite_index = spr_wood;
if (face_index == 1) sprite_index = spr_fire;
if (face_index == 2) sprite_index = spr_metal;
if (face_index == 3) sprite_index = spr_water;
if (face_index == 4) sprite_index = spr_soil;
if (face_up == false) sprite_index = spr_back;

draw_sprite(sprite_index, image_index, x, y);

image_index = 0;
image_speed = 0;