
/**
 * Module Name: RobotLeg.scad
 * 
 * Description: 
 *     This is a "wheel" to be used by the robot
 */
module RobotLeg(radius=25)
{
	width = 5;
	servoMountDiameter = 2.48+.65;
	screwDiameter = 5.92+.65;
	screwInset = 3;

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