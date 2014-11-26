

module WebCam(width=36, height=5, depth=60,usbPlugWidth=15, usbPlugHeight=7, cableDiameter=3)
{
	// Body
	translate([-width/2,0,0])
		cube([width,depth,height]);

	p0 = [0,depth,0];
	p1 = [width,depth,0];
	p2 = [width,0,0];
	p3 = [0,0,0];

	t4 = [width/2,depth,height];
	t5 = [width/2,0,height];

	// USB Cable
	translate([-width/2, 0, height])
		polyhedron
		(
			points=[p0,p1,p2,p3,t4,t5],
			faces = [[0,2,1], [0,3,2], // Bottom
						[0,1,4], [4,2,5], // sides
						[4,1,2], 
						[5,2,3],
						[3,4,5], [3,0,4]
					  ]
		);
}
//WebCam();