
include<RobotShell.scad>;
module ShellForPrintrBot()
{
	intersect()
	{
		translate([-75,-120,0])
			cube([150,150,100]);
		RobotShell();
	}
}
ShellForPrintrBot();
