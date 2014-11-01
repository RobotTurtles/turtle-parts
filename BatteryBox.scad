/**
 * module: BatteryBox
 * description:
 *     Basic Battery Box which holds 4 AA cells
 */

include <BatteryBoxCover.scad>;

module BatteryBoxCavity(batteryHeight=50,batteryDiameter=15,offset=1)
{
	batteryCavityWidth = (batteryDiameter+offset)*4-offset;

	translate([-batteryCavityWidth/2,0,0])
	{
		cube(size=[batteryCavityWidth, batteryHeight, batteryDiameter/2], 
				center=false);	

		// 1st Battery
		translate([batteryDiameter/2,0,batteryDiameter/2])
			rotate([-90,0,0])
				cylinder(d=batteryDiameter, h=batteryHeight, center=false);

		// 2nd Battery
		translate([1*(offset + batteryDiameter) + batteryDiameter/2,0,batteryDiameter/2])
			rotate([-90,0,0])
				cylinder(d=batteryDiameter, h=batteryHeight, center=false);

		// 3rd Battery
		translate([2*(offset + batteryDiameter) + batteryDiameter/2,0,batteryDiameter/2])
			rotate([-90,0,0])
				cylinder(d=batteryDiameter, h=batteryHeight, center=false);

		// 4th Battery
		translate([3*(offset + batteryDiameter) + batteryDiameter/2,0,batteryDiameter/2])
			rotate([-90,0,0])
				cylinder(d=batteryDiameter, h=batteryHeight, center=false);
	}
}
//BatteryCavity()

module BatteryBox()
{
	batteryDiameter=15;
	batteryHeight = 50;
	boxHeight = batteryDiameter+2;
	boxWidth = 15*4+10;
	boxLength = batteryHeight+10;
	offset = 1;

	translate([-boxWidth/2,0,0])
			union()
			{	
				cube(size=[boxWidth, boxLength, boxHeight], center=false);	
				translate([boxWidth/2-10, -10,0])
					cube(size=[20,10,boxHeight], center=false);
			}	
		
}

//BatteryBox();