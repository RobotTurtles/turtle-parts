/**
 * Module: Battery Box Cover
 * Description:
 *     Battery Box Cover
 */
module BatteryBoxCover(width = 67, length = 60, cThickness = 4, tabThickness = 2, screwDiameter =3, headDiameter=6, mountWidth=10, tabWidth=5)
{
	module batteryTab()
	{
		translate([-tabWidth/2,0,0])
			cube(center=false, size=[tabWidth, 3, cThickness-tabThickness]);
	}

	module screwMount()
	{

		difference()
		{
			union()
			{
				translate([0,mountWidth/2,0])
					cylinder(cThickness, d=mountWidth);

				translate([-mountWidth/2,0,0])
					cube(center=false, size=[mountWidth,mountWidth/2,cThickness]);
			}
			translate([0,5,cThickness/2])
				cylinder(cThickness/2, d=headDiameter);
			translate([0,5,-1])
				cylinder(cThickness+2, d=screwDiameter);
		}
	}

	translate([-width/2, 0,0])
	{
		union()
		{
			// Main Cover
			cube(center=false, size=[width, length, cThickness]);

			// Screw Mount
			translate([width/2,1,0])
				mirror([0,1,0])
					screwMount();

			// Tabs
			translate([width/4,length,0])
				batteryTab();
			translate([3*width/4,length,0])
				batteryTab();
		}
	}
}
//BatteryBoxCover();

module PrintableBoxCover()
{
	BatteryBoxCover(mountWidth=9.5, width=66.5, length=59.5, tabThickness=2.1, tabWith=4.5);
}
//PrintableBoxCover();

module BatteryBoxCoverCavity()
{
	mountWidth=20;
	cThickness=4;
	union()
	{
		BatteryBoxCover();
		translate([0,-4,0])
			union()
			{
				cylinder(cThickness, d=mountWidth/2);
				mirror([0,0,1])
					cylinder(cThickness*2, d=3);
			}
	}
}

//BatteryBoxCoverCavity();
