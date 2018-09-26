if fading==1
{
	image_alpha -= 0.005;
}

if image_alpha <= 0
{
	instance_destroy();
}

image_xscale += 0.01;
image_yscale += 0.01;