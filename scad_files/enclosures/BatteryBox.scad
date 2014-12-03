/**
 * module: BatteryBox
 * description:
 *     Basic Battery Box which holds 4 AA cells
 */

include <BatteryBoxCover.scad>;
include <../libraries/BatteryContacts.scad>;

module BatteryBoxCavity(batteryHeight=55,batteryDiameter=14.5,offset=.1)
{
	batteryCavityWidth = (batteryDiameter+offset)*4-offset;

	translate([-batteryCavityWidth/2,0,0])
	{
		cube(size=[batteryCavityWidth, batteryHeight, batteryDiameter/2+2], 
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
	union()
	{
		// Battery Contacts (Dual)
		translate([0,0,batteryDiameter])
			rotate([90,180,180])
				BatteryDualContact();
		translate([batteryDiameter,batteryHeight,batteryDiameter])
			rotate([90,180,0])
				BatteryDualContact();
		translate([-batteryDiameter,batteryHeight,batteryDiameter])
			rotate([90,180,0])
				BatteryDualContact();

		// Battery Contacts (Single)
		translate([batteryDiameter*1.5,0,batteryDiameter])
			rotate([90,180,180])
				BatterySingleContact();

		translate([-batteryDiameter*1.5,0,batteryDiameter])
			rotate([90,180,180])
				BatterySingleContact();	
	}
	
}
//BatteryBoxCavity();

module BatteryBox(batteryHeight=54)
{
	batteryDiameter=15;
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