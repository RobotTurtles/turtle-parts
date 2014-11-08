module CoreBasePlate(basewidth = 92.5, centralBoxLength=71.043, baseThickness=10, headScaleFactor=0.5, tailScaleFactor=1.2)
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
}

//CoreBasePlate();