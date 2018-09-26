if keyboard_check(vk_right)
{
	hsp = walkPwr;
}
if keyboard_check(vk_left)
{
	hsp = -walkPwr;
}
if (keyboard_check_pressed(vk_up) && (canJump == true))
{
	if(jump_current == 1)
	{
		vsp = -jumpPwr + jumpPwr*0.15;
	}
	else
	{
		vsp = -jumpPwr;
	}
	jump_current+=1;
}

hsp *= frc;
vsp *= air_frc;
vsp += grav;

if place_meeting(x+hsp,y,o_ground)
{
	while(!place_meeting(x+sign(hsp),y,o_ground))
	{
		x += sign(hsp)
	} 
	hsp = 0;
}

if place_meeting(x,y+vsp,o_ground)
{
	while(!place_meeting(x,y+sign(vsp),o_ground))
	{
		y += sign(vsp)
	} 
	vsp = 0;
	canJump = true;
	jump_current = 0;
}

if place_meeting(x+hsp,y,o_blocks1)
{
	hsp = 0;
}

if place_meeting(x,y+vsp,o_blocks1)
{
	vsp = 0;
	if o_blocks1.hsp == 0
		hsp += o_blocks1.hsp;
	canJump = true;
	jump_current = 0;
}

if place_meeting(x+hsp,y,o_blocks2)
{
	hsp = 0;
}

if place_meeting(x,y+vsp,o_blocks2)
{
	vsp = 0;
	if o_blocks1.hsp == 0
		hsp += o_blocks2.hsp;
	canJump = true;
	jump_current = 0;
}

if jump_current==jump_number
{
	canJump = false;
}

if place_meeting(self.x,self.bbox_bottom,o_blocks1)
	{
		self.hsp += o_blocks1.hsp;
	}
if place_meeting(self.x,self.bbox_bottom,o_blocks2)
	{
		self.hsp += o_blocks2.hsp;
	}
	
if collision_line(bbox_left,bbox_top,bbox_left,bbox_bottom,o_blocks1,false,false) != noone
	{
		self.hsp = o_blocks1.hsp+10;
		vsp += grav;
	}
if collision_line(bbox_right,bbox_top,bbox_right,bbox_bottom,o_blocks1,false,false) != noone
	{
		self.hsp = o_blocks1.hsp-10;
		
		vsp += grav;
	}
if collision_line(bbox_left,bbox_top,bbox_left,bbox_bottom,o_blocks2,false,false) != noone
	{
		self.hsp = o_blocks2.hsp+10;
		vsp += grav;
	}
if collision_line(bbox_right,bbox_top,bbox_right,bbox_bottom,o_blocks2,false,false) != noone
	{
		self.hsp = o_blocks2.hsp-10;
		vsp += grav;
	}

x += hsp;
y += vsp;

if place_meeting(self.x,self.bbox_bottom,o_blocks1)
	{
		hsp = 0;
	}
if place_meeting(self.x,self.bbox_bottom,o_blocks2)
	{
		hsp = 0;
	}
	
if (global.curr_health <= 0)
{
	global.num_lives--;
	global.curr_health = global.max_health;
	global.num_coins = 0;
	room_restart();
}