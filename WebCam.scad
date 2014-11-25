

module WebCam(width=36, height=5, depth=60,usbPlugWidth=15, usbPlugHeight=7, cableDiameter=3)
{
	// Body
	translate([-width/2,0,0])
		cube([width,depth,height]);

	// Space for USB Plug
	translate([-usbPlugWidth/2, 0, 0])
		cube([usbPlugWidth, depth, usbPlugHeight]);

	// USB Cable
	translate([0, 0, height+cableDiameter/2])
		rotate([-90,0,0])
			cylinder(d=cableDiameter, depth, $fn=100);

}
//WebCam();