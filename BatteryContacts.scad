

/**
 * Digikey Battery Contact Part: 5211K-ND
 * http://www.digikey.com/product-detail/en/5211/5211K-ND/316370
 */
module BatteryDualContact()
{
	overallHeight = 18.49;
	thickness = .65;
	tabDiameter = 4.1;
	mainBodyHeight = 11.99;
	tabRectangleHeight = overallHeight - mainBodyHeight - (tabDiameter/2);

	difference()
	{
		union()
		{
			translate([-23.01/2, 0,0])
				cube([23.01, mainBodyHeight,thickness]);
			translate([-tabDiameter/2,-tabRectangleHeight,0])
				cube([tabDiameter, tabRectangleHeight, thickness]);
			translate([0,-tabRectangleHeight,0])
				cylinder(d=tabDiameter,thickness);

			// Negative Contact
			translate([-7,mainBodyHeight-4.5,0])
				cylinder(d=6, 10.52);

			// Postiive Contact
			translate([7,mainBodyHeight-4.5,0])
				cylinder(d=6, 2);
		}
		translate([7,mainBodyHeight-4.5-5.74,0])
			cylinder(d=2.4, 2);
	}
}

//BatteryDualContact();

/**
 * Digikey Parts: 5201K-ND and 5223K-ND
 * http://www.keyelco.com/product-pdf.cfm?p=910
 */
module BatterySingleContact()
{
	overallHeight = 18.49;
	thickness = .65;
	tabDiameter = 4.1;
	mainBodyHeight = 11.99;
	tabRectangleHeight = overallHeight - mainBodyHeight - (tabDiameter/2);

	difference()
	{
		union()
		{
			translate([-11.2/2, 0,0])
				cube([11.2, mainBodyHeight,thickness]);
			translate([-tabDiameter/2,-tabRectangleHeight,0])
				cube([tabDiameter, tabRectangleHeight, thickness]);
			translate([0,-tabRectangleHeight,0])
				cylinder(d=tabDiameter,thickness);

			// Contact
			translate([0,mainBodyHeight-5,0])
				cylinder(d=6, 10.52);
		}
		translate([0,mainBodyHeight-5-5.74,0])
			cylinder(d=1.8, 2);
	}
}

//BatterySingleContact();