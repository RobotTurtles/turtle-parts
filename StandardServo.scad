/**
 * Module: Standard Servo
 * 
 * Description: 
 *      Outline of a standard servo, origin is location of motor attachment point
 **/

module StandardServo()
{
	servoBodyWidth = 38;
	servoBodyLength = 40;
	servoHeight = 20;
	mountLength = 55;
	mountWidth = 3;
	mountPoint = 15;
	translate([0,-mountLength + mountPoint,0])
	{
		// Servo Body
		translate([0,(mountLength-servoBodyLength)/2,0])
			cube([servoBodyWidth,servoBodyLength,servoHeight]);

		// Servo Mount
		translate([7,0,0])
			cube([mountWidth,mountLength,servoHeight]);
	}
}
//StandardServo();