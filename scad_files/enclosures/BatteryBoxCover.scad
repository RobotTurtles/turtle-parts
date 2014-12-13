/**
 * Module: Battery Box Cover
 * Description:
 *     Battery Box Cover
 */
module BatteryBoxCover(batteryDiameter=15, batteryHeight=55, cThickness = 4, tabThickness = 2, screwDiameter =3, headDiameter=6, mountWidth=10, tabWidth=5, numBatteries = 5)
{
	rim = .5;
	width = batteryDiameter * numBatteries + rim;
	length = batteryHeight + rim;

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

module BatteryBoxCoverCavity(batteryHeight=55, numBatteries = 5)
{
	mountWidth=20;
	cThickness=4;
	union()
	{
		scale([1.005, 1.01, 1.01])
			BatteryBoxCover(batteryHeight=batteryHeight, numBatteries=numBatteries);
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
