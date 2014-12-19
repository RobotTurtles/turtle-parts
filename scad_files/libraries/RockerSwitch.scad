module RockerSwitch()
{
	height = 12;
	width = 18.6;
	depth = 22;

	fHeight = 14.95;
	fWidth = 21;
	fDepth = 10;

	sHeight = 5.4;
	sWidth = 3;
	sDepth = depth;

	// Body
	translate([-width/2,0,-height/2])
		cube([width, depth, height]);

	// Face Plate
	translate([-fWidth/2,-fDepth,-fHeight/2])
		cube([fWidth, fDepth, fHeight]);

	// Side holders
	translate([(-width/2)-sWidth,0,-sHeight/2])
		cube([sWidth, sDepth, sHeight]);
	// Side holders
	translate([(width/2),0,-sHeight/2])
		cube([sWidth, sDepth, sHeight]);

}
//RockerSwitch();