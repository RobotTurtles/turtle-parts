/**
 * Module: Battery Box Cover
 * Description:
 *     Battery Box Cover
 */
module BatteryBoxCover(batteryDiameter=15, batteryHeight=56, cThickness = 4, tabThickness = 2, screwDiameter =3, headDiameter=6, mountWidth=10, tabWidth=5, numBatteries = 4, rim = .5, tolerance=0.1)
{
	
	width = batteryDiameter * numBatteries + 2*rim;
	length = batteryHeight + 2*rim;
    
    tabInsertLength = 3;

	echo(width);

	module batteryTab()
	{
		translate([-(tabWidth - tolerance)/2,0,0])
			cube(center=false, size=[tabWidth - tolerance, tabInsertLength, cThickness-tabThickness-tolerance]);
	}

	module screwMount()
	{

		difference()
		{
			union()
			{
				translate([0,mountWidth/2,0])
					cylinder(cThickness, d=mountWidth-tolerance);

				translate([-mountWidth/2,0,0])
					cube(center=false, size=[mountWidth-tolerance,mountWidth/2,cThickness]);
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
			cube(center=false, size=[width - tolerance, length - tolerance, cThickness]);

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

module BatteryBoxCoverCavity(batteryHeight=56, numBatteries = 4)
{
	mountWidth=20;
	cThickness=4;
	union()
	{
		scale([1.01, 1.01, 1.01])
			BatteryBoxCover(batteryHeight=batteryHeight, numBatteries=numBatteries);
		translate([0,-4,0])
			union()
			{
				cylinder(cThickness, d=mountWidth/2, $fn=60);
				mirror([0,0,1])
					cylinder(cThickness*2, d=3, $fn=60);
			}
	}
}

//BatteryBoxCoverCavity();
