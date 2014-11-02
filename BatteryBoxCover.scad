/**
 * Module: Battery Box Cover
 * Description:
 *     Battery Box Cover
 */
module BatteryBoxCover(width = 67, length = 55, cThickness = 2, tabThickness = 1)
{
	module batteryTab()
	{
		tabWidth = 5;
		translate([-tabWidth/2,0,0])
			cube(center=false, size=[tabWidth, 3, cThickness-tabThickness]);
	}

	module screwMount()
	{
		mountWidth=10;

		difference()
		{
			union()
			{
				translate([0,mountWidth/2,0])
					cylinder(cThickness, d=mountWidth);

				translate([-mountWidth/2,0,0])
					cube(center=false, size=[mountWidth,mountWidth/2,cThickness]);
			}
			translate([0,mountWidth/2,-1])
				cylinder(cThickness+2, d=mountWidth/2);
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
// BatteryBoxCover();

module BatteryBoxCoverCavity()
{
	mountWidth=20;
	cThickness=2;
	union()
	{
		BatteryBoxCover();
		translate([0,-4,0])
			cylinder(cThickness, d=mountWidth/2);
	}
}

//BatteryBoxCoverCavity();
