
/**
 * Module Name: RobotLeg.scad
 * 
 * Description: 
 *     This is a "wheel" to be used by the robot
 */
module RobotLeg(radius=25)
{
	width = 6;
	servoMountDiameter = 2.52+.65;
	screwDiameter = 5.91+.3;
	servoInset = 3.75;
	GOLDEN_RATIO = 1.61803398875;

	difference()
	{
		union()
		{
			cylinder(r=radius, width);
			CircleOfSpikes(radius=radius, width = width);
			difference()
			{
				scale([1,GOLDEN_RATIO,1])
					union(){
						cylinder(r=radius, width);
						CircleOfSpikes(radius=radius, width = width);
					}
				translate([-radius*1.5,0,0])
					cube([radius*3, radius*GOLDEN_RATIO*2,width]);
			}

		}
		cylinder(d=servoMountDiameter,width);
		translate([0,0,width-servoInset])
			cylinder(d=screwDiameter, servoInset);
	}
}
RobotLeg();

function calc_y(theta,r) = r * sin(theta);
function calc_x(theta,r) = r * cos(theta);
function calc_angle(x, radius) = -90 * (x/radius);

module CircleOfSpikes(width = 6, radius = 25, stepSize=2, spikeHeight=2)
{
	
	for ( theta = [-180 : stepSize : 180] )
	{
		translate([calc_x(theta,radius),calc_y(theta,radius),0])
			rotate([0,0,theta-90])
				Spike(thickness=width);
	}
}
//CircleOfSpikes();

module Spike(spikeWidth = 1, spikeHeight = 1, thickness = 3)
{
	p0 = [0,0,0];
	p1 = [spikeWidth/2, spikeHeight, 0];
	p2 = [spikeWidth, 0, 0];
	t3 = [0,0,thickness];
	t4 = [spikeWidth/2, spikeHeight, thickness];
	t5 = [spikeWidth, 0, thickness];
	
	translate([-spikeWidth/2, -spikeHeight/4,0])
		polyhedron(
			points = [p0,p1,p2,t3,t4,t5],
			faces = [[0,2,1], [3,4,5], // Top/Bottom
						[0,1,3], [1,4,3],
						[1,2,4], [2,5,4],
						[0,3,5], [0,5,2]
						]
			);
}
//Spike();