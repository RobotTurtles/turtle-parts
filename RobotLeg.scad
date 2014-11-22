
/**
 * Module Name: RobotLeg.scad
 * 
 * Description: 
 *     This is a "wheel" to be used by the robot
 */
module RobotLeg(radius=20)
{
	width = 5;
	servoMountDiameter = 2.5;
	screwDiameter = 6;
	screwInset = 1.5;

	difference()
	{
		union()
		{
			cylinder(r=radius, width);
		}
		cylinder(d=servoMountDiameter,width);
		translate([0,0,width-screwInset])
			cylinder(d=screwDiameter, screwInset);
	}
}
RobotLeg();