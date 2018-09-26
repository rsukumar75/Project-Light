image_xscale = min(image_xscale + 0.025,1);
image_yscale = image_xscale;
if(image_xscale == 1)
{
	image_angle -= 180;
	instance_change(o_projectile,true);
}
