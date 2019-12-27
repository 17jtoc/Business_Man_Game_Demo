/// @desc ScreenShake(magnitude,frames)
/// @arg magnitude sets the strength of the shake (r in pixels)
/// @arg frames sets the length of shake in frames

with (oCamera)
{
	if (argument0 > shake_remain)
	{
		shake_magnitude = argument0;
		shake_remain = argument0;
		shake_length = argument1;
	}
}
