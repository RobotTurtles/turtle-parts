include <arduino_uno.scad>;
include <breadboard.scad>;
include <screw_attach.scad>;

module ScrewPlatform() {

   translate([0, 21, -3]) {
		ScrewAttachment();
   }

   translate([0, -108, -3]) {
		ScrewAttachment();
   }

}

module ElectronicsBase() {

   // arduino uno base
   translate([0, -73, 0]) {
      rotate(a=[0,0,90]) {
           ArduinoBase();
      }
   }
 	
   // half breadboard
   translate([0, -15, 0]) {
     rotate(a=[0,0,90]) {
		  breadboard_holder();
     }
   }

	translate([0, 0, 0]) {
	   ScrewPlatform();
   }
}


ElectronicsBase();

//ScrewAttachment();
//ScrewPlatform();