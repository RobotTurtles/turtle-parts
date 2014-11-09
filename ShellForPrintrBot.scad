
include<RobotShell.scad>;
module ShellForPrintrBot()
{
	headSpot = 32;
	difference()
	{
		RobotShell();
		translate([-75,headSpot,0])
				cube([150,50,100], $fn=10);
		translate([-75,-148+headSpot,0])
			mirror([0,1,0])
				cube([150,150,100], $fn=10);
	}
}
ShellForPrintrBot();
