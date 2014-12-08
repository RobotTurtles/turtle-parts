include <BatteryBox.scad>

module BatteryBoxStandAlone(batteryHeight=54)
{
	batteryDiameter = 15;
	difference()
	{
		BatteryBox(batteryHeight=batteryHeight);
		translate([0,0,0])
			#BatteryBoxCavity(batteryHeight=batteryHeight);
		translate([0,-1,batteryDiameter+1])
			BatteryBoxCoverCavity(batteryHeight=batteryHeight);

	}
}
BatteryBoxStandAlone();