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
	shellWidth = basewidth + 10;

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
		CoreBasePlate(basewidth=basewidth, centralBoxLength=centralBoxLength, 
					  baseThickness=baseThickness, headScaleFactor=headScaleFactor, 
					  tailScaleFactor=tailScaleFactor);
		translate([-100,-150,-200])
			cube([200,200,200]);
	
		translate([0,-40,0])
			#InnerCavity();
	}

}
RobotShell();

module InnerCavity()
{
	radiusX = 46;
	yPosition = 50;
	height = 30;

	polyhedron(
  points=[ [ radiusX,yPosition,0], [ radiusX,-yPosition,0],
			  [-radiusX,-yPosition,0],[-radiusX,yPosition,0], // the four points at base
           [0,0,height]  ],                                 // the apex point 
  faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
              [1,0,3],[2,1,3] ]                         // two triangles for square base
 );

}