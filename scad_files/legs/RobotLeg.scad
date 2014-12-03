
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
	GOLDEN_RATIO = 1.61803398875;

	difference()
	{
		union()
		{
			cylinder(r=radius, width);
			difference()
			{
				scale([1,GOLDEN_RATIO,1])
					cylinder(r=radius, width);
				translate([-radius,0,0])
					cube([radius*2, radius*GOLDEN_RATIO,width]);
			}

		}
		cylinder(d=servoMountDiameter,width);
		translate([0,0,width-servoInset])
			cylinder(d=screwDiameter, servoInset);
	}
}
RobotLeg();