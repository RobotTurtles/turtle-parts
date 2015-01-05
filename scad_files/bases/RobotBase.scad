/***
 * Module: RobotBase
 * Description:
 *     Base that robot "sits" on. Mount point for servos. All Units in mm
 * Origin is at center of body lengthwise, and along the "legs"
 *
 * Author: Alex Gutierrez (turtles AT 2d12 DOT net)
 */

include <../libraries/StandardServo.scad>;
include <../libraries/RaspberryPiMountHoles.scad>;
include <../enclosures/BatteryBox.scad>;
include <../common/CoreBasePlate.scad>;

module RobotBase(basewidth=92.5)
{
	GOLDEN_RATIO = 1.61803398875;
	baseThickness = 10;
	bottomPlateThickness = 5;
	motorCenterOffset = 20;
	numBatteries = 4;

	xPosition = basewidth/2-12;
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

	batteryBoxY = 41;
	batteryBoxTranslationZ = 0;

	// Create Main Body
	difference(){
		union()
		{
			CoreBasePlate(basewidth, centralBoxLength, 
							  baseThickness, headScaleFactor, tailScaleFactor);

			// Add Battery Box
			translate([0,-batteryBoxY,batteryBoxTranslationZ])
				mirror([0,1,0])
						BatteryBox(numBatteries = numBatteries, boxWallThickness = 5);

			// Add Caster
			translate([0, -centralBoxLength-35, 15])
				union()
				{
					sphere(d=25);
					translate([0,0,-15])
						cylinder(h=15, d=25);
				}
		}

		// Hole Pattern
		BasePlateHolePattern(basewidth, centralBoxLength, 
							  baseThickness, headScaleFactor, tailScaleFactor);

		// Hole Pattern (For Screw Head)
		BaseInsetPlateHolePattern(basewidth, centralBoxLength, 
							  baseThickness, headScaleFactor, tailScaleFactor);


		// Left Motor
		translate([-basewidth/2 -2.25,0,bottomPlateThickness])
			StandardServo();

		// Right Motor
		translate([basewidth/2 +2.25,0,bottomPlateThickness])
			mirror([1,0,0])
				StandardServo();

		// Battery Cavity
		translate([0,-54-batteryBoxY,batteryBoxTranslationZ])
			#BatteryBoxCavity(numBatteries = numBatteries);

		// Battery Cover
		translate([0,-batteryBoxY+1,batteryBoxTranslationZ+16])
			mirror([0,1,0])
				BatteryBoxCoverCavity(numBatteries = numBatteries);

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

		// Raspberry Pi Mount
		rotate([0,0,-90])
		#RaspberryPiMountHoles();
	}
}

RobotBase();