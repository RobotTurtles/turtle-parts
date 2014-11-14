/**
 * Module Name: Robot Shell
 * 
 * Description:
 *     Robot Shell
 *
 */
include <CoreBasePlate.scad>;

module RobotShell(basewidth=92.5)
{
	GOLDEN_RATIO = 1.618;
	centralBoxLength=71.043;
	baseThickness=10;
	headScaleFactor=0.5;
	tailScaleFactor=1.2;
	heightScaleFactor = .4; //1/GOLDEN_RATION
	shellWidth = basewidth;

	topShellScaleFactor = 1;

	difference()
	{
		union()
		{
			// Top-Back Roundess
			translate([0,-44,baseThickness])
				scale([1, 1.6,topShellScaleFactor])
					sphere(d=shellWidth);

			// Top-Front Roundess
			translate([0,-15,baseThickness])
				scale([1, 1,topShellScaleFactor])
					sphere(d=shellWidth);

			// Connection of front to back
			translate([0,-15, baseThickness])
				scale([1, 1,topShellScaleFactor])
					rotate([90,0,0])
						cylinder(d=shellWidth, 44-15);

			// Head Roundess
			translate([0,8,baseThickness])
				scale([1, headScaleFactor,heightScaleFactor])
					sphere(d=shellWidth);

			// Tail Roundness
			translate([0,-63,baseThickness])
				scale([1, tailScaleFactor,heightScaleFactor])
					sphere(d=shellWidth);

			// Connection of front to back
			translate([0,8, baseThickness])
				scale([1, 1,heightScaleFactor])
					rotate([90,0,0])
						cylinder(d=shellWidth, centralBoxLength);
	
			// Connection to base
			CoreBasePlate(basewidth=shellWidth, centralBoxLength=centralBoxLength, 
						  baseThickness=baseThickness, headScaleFactor=headScaleFactor, 
						  tailScaleFactor=tailScaleFactor);
		}
		translate([-100,-150,-200])
			cube([200,200,200]);
		translate([0,25,25])
			sphere(d=30);
	
		translate([0,0,0])
			#InnerCavity(basewidth=shellWidth-20, centralBoxLength=centralBoxLength);
	}
}
RobotShell();

module InnerCavity(basewidth=100,maxHeight=50,centralBoxLength=100, 
						 baseThickness=10,
						 headScaleFactor=0.5, tailScaleFactor=1.2, shaftOffset=8)
{
	headLength = basewidth/2 * headScaleFactor;
	tailLength = basewidth/2 * tailScaleFactor;
	h=20;

	tentWidth=65;
	p0 = [tentWidth,centralBoxLength,0];
	p1 = [tentWidth,0,0];
	p2 = [0,0,0];
	p3 = [0,centralBoxLength,0];

	t4 = [tentWidth/2,0,h];
	t5 = [tentWidth/2,centralBoxLength,h];

	p6 = [tentWidth/2, centralBoxLength+h,0];
	p7 = [tentWidth/2, -h,0];

	piHeight = 8;
	piLength = 69;

	CoreBasePlate(basewidth=basewidth, centralBoxLength=centralBoxLength, 
					  baseThickness=baseThickness, headScaleFactor=headScaleFactor, 
					  tailScaleFactor=tailScaleFactor, shaftOffset=shaftOffset);

	// board
	translate([-30,-20-piLength,0])
		cube([60, 100,22+piHeight]);

	// SD Card
	translate([-16,-50-piLength,7+piHeight])
		cube([28, 50,5]);

	// audio + vga
	translate([-37,10-piLength,10])
		cube([10, 40,10+piHeight]);

	translate([-tentWidth/2,-centralBoxLength+shaftOffset,baseThickness+piHeight+10])
		polyhedron
		(
			points=[p0,p1,p2,p3, // the four points at base
         	 	  t4,t5,       // Apexes
       			  p6, p7],     // head and tail 
		   faces =[[0,1,4],[2,3,4],[3,5,4],[5,0,4],   // base sides
	     			  [0,5,6],[3,6,5],[0,6,3],           // head
					  [1,7,4],[2,4,7],[1,2,7],           // tail
		           [1,0,3],[2,1,3] ]                  // base bottom
		);
}
//InnerCavity();