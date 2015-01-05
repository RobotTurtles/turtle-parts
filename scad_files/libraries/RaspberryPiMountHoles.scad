

module RaspberryPiMountHoles()
{
	mountDiameter = 2.5;
	mountHeight = 3.5;

	translate([0,-49/2,0])
	union()
	{
		cylinder(d=mountDiameter,mountHeight);
		translate([58,0,0])
			cylinder(d=mountDiameter,mountHeight);
		translate([58,49,0])
			cylinder(d=mountDiameter,mountHeight);
		translate([0,49,0])
			cylinder(d=mountDiameter,mountHeight);
	}
}
//RaspberryPiMountHoles();