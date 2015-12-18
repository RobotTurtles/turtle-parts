/**
 * module: BatteryBox
 * description:
 *     Basic Battery Box which holds 4 AA cells
 */

include <BatteryBoxCover.scad>;
include <../libraries/BatteryContacts.scad>;

module BatteryBoxCavity(batteryHeight=56,batteryDiameter=14.5,offset=.1,numBatteries = 4)
{
	function isTop(cells) = cells%2 == 0;
	function numTopContacts(cells) = floor(cells/2);
	function numBottomContacts(cells) = ceil(cells/2);

	batteryCavityWidth = (batteryDiameter+offset)*numBatteries-offset;

	xOffsetTop = numTopContacts(numBatteries)* 2*batteryDiameter + batteryDiameter*0.5;
	xOffsetBottom = numBottomContacts(numBatteries)* 2 * batteryDiameter - batteryDiameter*.5;
	
	mirror([0,0,1])
	translate([-batteryCavityWidth/2,0,-(batteryDiameter+2)])
	{
		cube(size=[batteryCavityWidth, batteryHeight, batteryDiameter/2+2], 
				center=false);	

		// Battery Cells
		for(batNum = [0:numBatteries-1])
		{
			// 1st Battery
			translate([batNum*(offset + batteryDiameter) + batteryDiameter/2,
							0,batteryDiameter/2])
				rotate([-90,0,0])
					cylinder(d=batteryDiameter, h=batteryHeight, center=false);
		}



		// Battery Contacts
		union()
		{
			// Top Battery Connects
			if(numBatteries>1)
			{
				for(contact = [0:numTopContacts(numBatteries)-1])
				{
					translate([contact*2*batteryDiameter + batteryDiameter,
								batteryHeight,batteryDiameter])
							rotate([90,180,0])
								BatteryDualContact();
				}
			}

			// Bottom Battery Connects
			if(numBatteries>2){
				for(contact = [0:ceil(numBatteries/2)-2])
				{
					translate([contact*2*batteryDiameter + 2*batteryDiameter,
									0,batteryDiameter])
						rotate([90,180,180])
							BatteryDualContact();
				}
			}

			// Battery Contacts (Single)
			translate([batteryDiameter*0.5,0,batteryDiameter])
				rotate([90,180,180])
					BatterySingleContact();


			if(isTop(numBatteries))
			{
				translate([xOffsetBottom,0,batteryDiameter])
					rotate([90,180,180])
						BatterySingleContact();	
			} else {
				translate([xOffsetTop, batteryHeight,batteryDiameter])
					rotate([90,180,0])
						BatterySingleContact();	
			}
		}

	}
	
}
//BatteryBoxCavity();

module BatteryBox(batteryHeight=54,numBatteries = 4, boxWallThickness = 3.5)
{
	batteryDiameter=15;
	boxHeight = batteryDiameter+5;
	boxWidth = 15*numBatteries+boxWallThickness;
	boxLength = batteryHeight+boxWallThickness*2;

	translate([-boxWidth/2,-boxWallThickness,0])
			union()
			{	
				cube(size=[boxWidth, boxLength, boxHeight], center=false);	
				translate([boxWidth/2-10, -10,0])
					cube(size=[20,10,boxHeight], center=false);
			}	
		
}

//BatteryBox();
