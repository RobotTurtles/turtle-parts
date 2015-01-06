

module RaspberryPiMountHoles()
{
	mountDiameter = 2.95;
	mountHeight = 3.5;

	translate([0,-49/2,0])
	union()
	{
		cylinder(d=mountDiameter,mountHeight, $fn=100);
		translate([58,0,0])
			cylinder(d=mountDiameter,mountHeight, $fn=100);
		translate([58,49,0])
			cylinder(d=mountDiameter,mountHeight, $fn=100);
		translate([0,49,0])
			cylinder(d=mountDiameter,mountHeight, $fn=100);
	}
}
//RaspberryPiMountHoles();