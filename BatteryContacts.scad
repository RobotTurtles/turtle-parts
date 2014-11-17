
/**
 * Digikey Battery Contact Part: 5214K-ND
 * http://www.keyelco.com/product-pdf.cfm?p=894
 */
module BatteryDualContact()
{
	// Overall Properties
	thickness = .69;

	// Lower Tabs
	bottomTabHeight = 1.5;
	bottomTabWidth = 4.50;
	bottomTabDistanceFromCenter = 11.51/2;

	// Body
	overallHeight = 11;
	overallWidth = 21.01;
	mainBodyHeight = overallHeight - bottomTabHeight;


	// Middle Cut
	middleCutWidth = 1.93;
	middleCutHeight = 7.01 - bottomTabHeight;

	// Contacts
	contactDiameter = 5.5;
	contactFromBottom = 7.49 - bottomTabHeight;
	contactFromCenter = 11.51/2;

	// Noch
	nochWidth = 1.95;
	nochHeight = 1.5;
	nochThickness = thickness;
	nochFromCenter = contactFromCenter;
	nochFromBottom = 3.51;

	difference()
	{
		union()
		{
			// Main Body
			translate([-overallWidth/2, 0,0])
				cube([overallWidth, mainBodyHeight,thickness]);
			
			// Bottom Tabs
			translate([-bottomTabWidth/2 - bottomTabDistanceFromCenter,-bottomTabHeight,0])
				cube([bottomTabWidth, bottomTabHeight, thickness]);
			translate([-bottomTabWidth/2 + bottomTabDistanceFromCenter,-bottomTabHeight,0])
				cube([bottomTabWidth, bottomTabHeight, thickness]);

			// Negative Contact
			translate([-contactFromCenter,contactFromBottom,0])
				cylinder(d=contactDiameter, 7.6);

			// Postiive Contact
			translate([contactFromCenter,contactFromBottom,0])
				cylinder(d=contactDiameter, 1.52);

			// Mount Noche
			translate([-nochWidth/2 - nochFromCenter, nochFromBottom-nochHeight, -nochThickness])
				cube([nochWidth, nochHeight, nochThickness]);
			translate([-nochWidth/2 + nochFromCenter, nochFromBottom-nochHeight, -nochThickness])
				cube([nochWidth, nochHeight, nochThickness]);
		}
		
		// Middle Cut
		translate([-middleCutWidth/2,0,0])
			cube([middleCutWidth, middleCutHeight,thickness]);
	}
}

//BatteryDualContact();

/**
 * Digikey Battery Contact Part: 5211K-ND
 * http://www.digikey.com/product-detail/en/5211/5211K-ND/316370
 */
module BatteryDualContactTab()
{
	overallHeight = 18.49;
	thickness = .69;
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

//BatteryDualContactTab();

/**
 * Digikey Parts: 5201K-ND and 5223K-ND
 * http://www.keyelco.com/product-pdf.cfm?p=910
 */
module BatterySingleContact()
{
	overallHeight = 18.49;
	thickness = .69;
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