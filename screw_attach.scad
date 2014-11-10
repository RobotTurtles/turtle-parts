module ScrewAttachment()
{
    height = 2;
    length = 12;
    width = 12;

    hole_radius = 1.6;

   difference() {
    cube([length, width, height], center=true);

        cylinder(r=hole_radius, h=height, center=true, $fn=10);
    }
}

//ScrewAttachment();