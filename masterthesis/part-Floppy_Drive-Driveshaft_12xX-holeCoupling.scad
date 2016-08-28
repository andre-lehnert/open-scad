use<lib-Floppy_Drive_Thread.scad>
use<lib-Threads.scad>
use<part-Shaft_HoleCoupling.scad>


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
    shaftCouplingHeight = 8,
    //shaftCouplingDiameter = diameter,
    //lockingScrew = "M3",
    lockingHoleDiameter = 2,
    lockingHolePosition = 5,
    lockingHoleTolerance = 0.25,

    // motor shaft
    shaftHeight = 19,
    shaftDiameter = 5,
    motorShaftTolerance = 0.1
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

            shaftHoleCoupling 
            (
                shaftCouplingHeight=shaftCouplingHeight,
                shaftCouplingDiameter=diameter,
                lockingHoleDiameter=lockingHoleDiameter,
                lockingHolePosition=lockingHolePosition,
                lockingHoleTolerance=lockingHoleTolerance,
                shaftHeight=0, // internal motor shaft height
                shaftDiameter=0, // internal motor shaft diameter
                shaftTolerance=0
            );
//            shaftCoupling
//            (
//                shaftCouplingHeight=shaftCouplingHeight, // cylinder height
//                shaftCouplingDiameter=shaftCouplingDiameter, // cylinder diameter
//                shaftHeight=shaftHeight, // internal motor shaft height
//                shaftDiameter=shaftDiameter, // internal motor shaft diameter
//                lockingScrew=lockingScrew,
//                lockingScrewTolerance=lockingScrewTolerance,
//                motorShaftTolerance=motorShaftTolerance
//            );
        }

        // motor shaft hole
        if (shaftCouplingHeight + 2 < shaftHeight * (1+motorShaftTolerance) && diameter/2 - 2 > (shaftDiameter * (1+motorShaftTolerance) )/2) {
            translate([0,0,shaftHeight/2])
            difference() {
                cylinder(h=shaftHeight * (1+motorShaftTolerance), r=(shaftDiameter * (1+motorShaftTolerance) )/2, center=true, $fn=32);
                translate([2,-(shaftDiameter * (1+motorShaftTolerance) )/2,-shaftHeight/2])
                cube([(shaftDiameter * (1+motorShaftTolerance) ),(shaftDiameter * (1+motorShaftTolerance) ),(shaftHeight * (1+motorShaftTolerance))*2]);
            }
        } else {
            echo("WARNING: Shaft coupling height < motor shaft height!");
        }
    }
}