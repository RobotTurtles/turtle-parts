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
		translate([-3,0,0])
			cube([6,10,baseThickness]);	
		translate([15,22,0])
			cylinder(baseThickness, d=5);
		translate([-15,22,0])
			cylinder(baseThickness, d=5);
		translate([basewidth/2-6,-65,0])
			cylinder(baseThickness, d=5);
		translate([-basewidth/2+6,-65,0])
			cylinder(baseThickness, d=5);
}
//BasePlateHolePattern();