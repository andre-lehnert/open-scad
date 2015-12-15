use <lib-Threads.scad>

use <part-Shaft_Coupling.scad>
use <part-Motor_PSM35BYG104.scad>



// ---------------------------------------------------------------------------------

module metricDriveShaft
(
    driveShaftThread="M16",
    driveShaftLength=100,
    
    shaftCouplingHeight=20,
    shaftCouplingDiameter=8,
    numberOfLockingScrews=1,
    lockingScrew="None",
    lockingScrewHeight=14,
    
    additionalMounting=true
) {
    
    color([1,1,0]) 
    union () {
        
        translate([0,0,shaftCouplingHeight-1]) 
        {        
            metricThread (driveShaftThread,driveShaftLength+1);    
        }
        
        if (additionalMounting) {
            translate([0,0,shaftCouplingHeight]) 
            {        
                cylinder(shaftCouplingHeight/6, shaftCouplingDiameter);
            }
        }    
        
        shaftCoupling(
            shaftCouplingHeight, 
            shaftCouplingDiameter, 
            getMotorShaftHeight()+(getMotorShaftHeight()*getMotorShaftTolerance()), 
            getMotorShaftDiameter()+(getMotorShaftDiameter()*getMotorShaftTolerance()), 
            numberOfLockingScrews,
            lockingScrew, 
            lockingScrewHeight
        );
    }
    
}

// ---------------------------------------------------------------------------------

metricDriveShaft();

PSM35BYG104();