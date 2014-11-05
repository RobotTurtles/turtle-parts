/***
 * Module: RobotBase
 * Description:
 *     Base that robot "sits" on. Mount point for servos. All Units in mm
 * Origin is at center of body lengthwise, and along the "legs"
 *
 * Author: Alex Gutierrez (firstname.lastname AT gmail)
 */

include <StandardServo.scad>;
include <BatteryBox.scad>;

module RobotBase(basewidth=92.5)
{
	GOLDEN_RATIO = 1.61803398875;
	baseThickness = 10;
	bottomPlateThickness = 5;
	motorCenterOffset = 20;

	xPosition = 25;
	tieWidth = 5;
	tieLength = 3;

	// Compute Base Length as a function of width
	baselength = basewidth * GOLDEN_RATIO;
	echo(baselength);
	
	// Upper Cylinder (by head)
	headScaleFactor = 0.5;
	headContributionToLength = (basewidth * headScaleFactor)/2;

	// Lower Cylinder (by tail)
	tailScaleFactor = 1.2;
	tailContributionToLength = (basewidth * tailScaleFactor)/2;

	centralBoxLength = baselength - headContributionToLength - tailContributionToLength;

	batteryBoxY = 36;
	// Create Main Body
	difference(){
		union()
		{
			translate([-basewidth/2, -centralBoxLength+8,0])
			{
	
				// Create Central Cube
				cube([basewidth, centralBoxLength, baseThickness]);

				// Create Head Cylinder
				translate([basewidth/2,centralBoxLength,0])
					scale([1,headScaleFactor,1])
						cylinder(baseThickness, d=basewidth);

				// Create Tail Cylinder
				translate([basewidth/2,0,0])
					scale([1,tailScaleFactor,1])
						cylinder(baseThickness, d=basewidth);
			}

			// Add Battery Box
			translate([0,-batteryBoxY,0])
				mirror([0,1,0])
						BatteryBox();

			// Add Caster
			translate([0, -centralBoxLength-35, 15])
				union()
				{
					sphere(d=20);
					translate([0,0,-10])
						cylinder(h=10, d=20);
				}
		}

		translate([0,-centralBoxLength+batteryBoxY-4,15.006])
			mirror([0,1,0])
					BatteryBoxCoverCavity();

		// Left Motor
		translate([-basewidth/2 -.01,0,bottomPlateThickness])
			StandardServo();

		// Right Motor
		translate([basewidth/2 +.01,0,bottomPlateThickness])
			mirror([1,0,0])
				StandardServo();

		// Battery Cavity
		translate([0,-centralBoxLength-batteryBoxY+15,16])
			mirror([0,0,1])
				BatteryBoxCavity();


		// Zip Tie Holes
		union()
		{
			translate([-xPosition-tieWidth/2, 7, -5])
				cube([tieWidth,tieLength,30]);
			translate([-xPosition-tieWidth/2, -35, -5])
				cube([tieWidth,tieLength,30]);
			translate([xPosition-tieWidth/2, 7, -5])
				cube([tieWidth,tieLength,30]);
			translate([xPosition-tieWidth/2, -35, -5])
				cube([tieWidth,tieLength,30]);

		}
	}
}

RobotBase();