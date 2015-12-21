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

module BasePlateHolePattern(basewidth = 92.5, centralBoxLength=71.043, baseThickness=10, headScaleFactor=0.5, tailScaleFactor=1.2, shaftOffset=8, insetFromEdge = 4.5)
{
	holeDiamter = 3.3;
    minRoundFaces = 60;
	// Servo Hole
	translate([-3,10,0])
		cube([6,10,baseThickness]);	

	

	// Screws
	translate([15,24,0])
		cylinder(baseThickness, d=holeDiamter, $fn=minRoundFaces);
	translate([-15,24,0])
		cylinder(baseThickness, d=holeDiamter, $fn=minRoundFaces);
	translate([basewidth/2-insetFromEdge,-65,0])
		cylinder(baseThickness, d=holeDiamter, $fn=minRoundFaces);
	translate([-basewidth/2+insetFromEdge,-65,0])
		cylinder(baseThickness, d=holeDiamter, $fn=minRoundFaces);
}
//BasePlateHolePattern();

module BaseInsetPlateHolePattern(basewidth = 92.5, centralBoxLength=71.043, baseThickness=10, headScaleFactor=0.5, tailScaleFactor=1.2, shaftOffset=8, insetFromEdge = 5)
{
	holeDiamter = 8;
	insetAmount =2;
    minRoundFaces = 60;

	// Screw Inset Holes
	// Front
	translate([15,24,baseThickness/2])
		cylinder(baseThickness/2, d=holeDiamter, $fn=minRoundFaces);
	translate([-15,24,baseThickness/2])
		cylinder(baseThickness/2, d=holeDiamter, $fn=minRoundFaces);

	// Back
	translate([basewidth/2-insetFromEdge,-65,baseThickness/2])
		cylinder(baseThickness/2, d=holeDiamter, $fn=minRoundFaces);
	translate([-basewidth/2+insetFromEdge,-65,baseThickness/2])
			cylinder(baseThickness/2, d=holeDiamter, $fn=minRoundFaces);
}
//BaseInsetPlateHolePattern();