/**
 * Name: CoreBasePlate.scad
 * Description:
 *     Base Plate that everything is attached to
 */
module CoreBasePlate(basewidth = 92.5, centralBoxLength=71.043, baseThickness=10, headScaleFactor=0.5, tailScaleFactor=1.2, shaftOffset=8)
{
		translate([-basewidth/2, -centralBoxLength+shaftOffset,0])
		{
			union()
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
		}
}

//CoreBasePlate();

module BasePlateHolePattern(basewidth = 92.5, centralBoxLength=71.043, baseThickness=10, headScaleFactor=0.5, tailScaleFactor=1.2, shaftOffset=8)
{
	holeDiamter = 3;
	// Servo Hole
	translate([-3,10,0])
		cube([6,10,baseThickness]);	

	// Screws
	translate([15,24,0])
		cylinder(baseThickness, d=holeDiamter);
	translate([-15,24,0])
		cylinder(baseThickness, d=holeDiamter);
	translate([basewidth/2-6,-65,0])
		cylinder(baseThickness, d=holeDiamter);
	translate([-basewidth/2+6,-65,0])
			cylinder(baseThickness, d=holeDiamter);
}
//BasePlateHolePattern();

module BaseInsetPlateHolePattern(basewidth = 92.5, centralBoxLength=71.043, baseThickness=10, headScaleFactor=0.5, tailScaleFactor=1.2, shaftOffset=8)
{
	holeDiamter = 6;
	innerHoleDiameter = 3;

	// Screw Inset Holes
	// Front
	translate([15,24,baseThickness/2])
		cylinder(baseThickness/2, d=holeDiamter);
	translate([-15,24,baseThickness/2])
		cylinder(baseThickness/2, d=holeDiamter);

	// Back
	translate([basewidth/2-6,-65,baseThickness/2])
		cylinder(baseThickness/2, d=holeDiamter);
	translate([-basewidth/2+6,-65,baseThickness/2])
			cylinder(baseThickness/2, d=holeDiamter);
}
//BaseInsetPlateHolePattern();