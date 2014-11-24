
/**
 * Module Name: RobotLeg.scad
 * 
 * Description: 
 *     This is a "wheel" to be used by the robot
 */
module RobotLeg(radius=25)
{
	width = 6;
	servoMountDiameter = 2.52+.65;
	screwDiameter = 5.91+.3;
	servoInset = 3.75;

	difference()
	{
		union()
		{
			cylinder(r=radius, width);
		}
		cylinder(d=servoMountDiameter,width);
		translate([0,0,width-servoInset])
			cylinder(d=screwDiameter, servoInset);
	}
}
RobotLeg();