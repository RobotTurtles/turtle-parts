// half breadboard is 8.5cm x 5.5cm
BREADBOARD_LENGTH = 87;
BREADBOARD_WIDTH = 57;

wall_thickness = 2;
wall_height = 7;
bottom_thickness = 1;

module breadboard_holder() {
 difference() {
	// Exterior box
	cube([BREADBOARD_WIDTH+(2*wall_thickness),BREADBOARD_LENGTH+(2*wall_thickness),wall_height+bottom_thickness], center=true);

	// Interior recess
	translate([0,0,bottom_thickness/2.0])
		cube([BREADBOARD_WIDTH,BREADBOARD_LENGTH,wall_height], center=true);
 }
}


//breadboard_holder();


