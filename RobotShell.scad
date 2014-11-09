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

	%difference()
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
	
		translate([0,32,baseThickness])
			#InnerCavity();
	}
		translate([0,32,baseThickness])
			#InnerCavity();
}
//RobotShell();

module Tent(h=10,w=20,l=20)
{
	p0 = [10,10,0];
	p1 = [10,-10,0];
	p2 = [-10,-10,0];
	p3 = [-10,10,0];
	p4 = [0,-10,10];
	p5 = [0,10,10];
	polyhedron(
  points=[ p0,p1,p2,p3, // the four points at base
             p4,p5],                                 // the apex point 
  faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],           // each triangle side
              [1,0,3],[2,1,3] ]                         // two triangles for square base
 );
}
Tent();

module InnerCavity(shellWidth=100, shellLength=100, headRadius=44)
{
	radiusX = 46;
	yPosition = 50;
	height = 40;

	pointForSides = (headRadius<height)?0:headRadius-height;

	headInsert = 15;
	tailInsert = 40;

	// Base Points
	p0 = [0,0,0];
	p1 = [headRadius,-headInsert,0];
	p2 = [headRadius,-shellLength-headInsert,0];
	p3 = [0,-shellLength-headInsert-tailInsert,0];
	p4 = [-headRadius, -shellLength-headInsert,0];
	p5 = [-headRadius,-headInsert,0];

	// Top Points
	p6 = [0, -height, height];
	p7 = [0, -shellLength-headInsert-tailInsert+height, height];

	topFront = 3;
	topBack = topFront;

	polyhedron(
  points=[ p0, p1, p2,
			  p6],
  faces=[ [0,1,topFront], [1,topFront,topBack], [1,2,topBack], // front
			 [2,3,topBack], [3,4,topBack],
			 [4,5,topBack],[5,topFront,topBack],[topFront,0,5],
			 [0,1,2],[0,2,3],[0,3,4],[4,5,0]
		  ]);

}
//InnerCavity();