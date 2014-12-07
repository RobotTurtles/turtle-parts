include <BatteryBox.scad>

module BatteryBoxStandAlone(batteryHeight=54)
{
	batteryDiameter = 15;
	difference()
	{
		BatteryBox(batteryHeight=batteryHeight);
		BatteryBoxCavity(batteryHeight=batteryHeight);
		translate([0,-1,batteryDiameter-2])
			BatteryBoxCoverCavity(batteryHeight=batteryHeight);

	}
}
BatteryBoxStandAlone();