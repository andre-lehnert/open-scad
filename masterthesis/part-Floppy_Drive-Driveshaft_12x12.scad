use<lib-Floppy_Drive_Thread.scad>
use<lib-Threads.scad>
use<part-Shaft_Coupling_with_3_Nuts.scad>


floppyDriveShaft();

module floppyDriveShaft
(
    // drive shaft
    diameter=12,
    pitch=12,
    height=23,
    driveShaftTolerance = 0.3,
    innerRadiusTolerance = 0.0,

    // shaft coupling
    shaftCouplingHeight = 9,
    shaftCouplingDiameter = 24,
    lockingScrew = "M3",
    lockingScrewTolerance = 0.25,

    // motor shaft
    shaftHeight = 20,
    shaftDiameter = 5,
    motorShaftTolerance = 0.15
)
{
    function getTotalHeight() = height + shaftCouplingHeight;

    echo(str("Total drive shaft height: ", getTotalHeight()));

    difference() {
       
        // drive shaft with coupling 
        union() {
            
            // drive shaft
            translate([0,0, shaftCouplingHeight]) {
                floppyDiskThread
                (
                    diameter=diameter, 
                    pitch=pitch, 
                    length=height, 
                    beveledEdges=1,
                    tolerancePercent=driveShaftTolerance,
                    innerRadiusTolerance=innerRadiusTolerance
                );
            }

            shaftCoupling
            (
                shaftCouplingHeight=shaftCouplingHeight, // cylinder height
                shaftCouplingDiameter=shaftCouplingDiameter, // cylinder diameter
                shaftHeight=shaftHeight, // internal motor shaft height
                shaftDiameter=shaftDiameter, // internal motor shaft diameter
                lockingScrew=lockingScrew,
                lockingScrewTolerance=lockingScrewTolerance,
                motorShaftTolerance=motorShaftTolerance
            );
        }

        // motor shaft hole
        if (shaftCouplingHeight + 2 < shaftHeight * (1+motorShaftTolerance) && diameter/2 - 2 > (shaftDiameter * (1+motorShaftTolerance) )/2) {
            translate([0,0,shaftHeight/2])
            cylinder(h=shaftHeight * (1+motorShaftTolerance), r=(shaftDiameter * (1+motorShaftTolerance) )/2, center=true, $fn=32);
        } else {
            echo("WARNING: Shaft coupling height < motor shaft height!");
        }
    }
}