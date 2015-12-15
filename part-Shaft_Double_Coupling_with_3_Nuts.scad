use <lib-Threads.scad>

// ---------------------------------------------------------------------------------

// ++++++++++++++++++++++++++++++++++++
// Shaft Coupling 
//
// shaftCoupling(H,R,h,r,sn,st,sh);
//
// - H = shaftCouplingHeight=17
// - R shaftCouplingDiameter=10
// - h shaftHeight=17
// - r shaftDiameter=5
// - st lockingScrew="M3"
//
// ++++++++++++++++++++++++++++++++++++

module doubleShaftCoupling
(   
    shaftCouplingDiameter=20, // cylinder diameter

    motorShaftHeight=17, // internal motor shaft height
    motorShaftDiameter=5.2, // internal motor shaft diameter

    driveShaftHeight=17,
    driveShaftDiameter=10.2,

    lockingScrew="M3" // locking screw thread
)
{
    union()
    {
        shaftCoupling
        (
            motorShaftHeight,
            shaftCouplingDiameter,
            motorShaftHeight,
            motorShaftDiameter,
            lockingScrew
        );
        
        translate([ 0.00, 0.00, motorShaftHeight+driveShaftHeight])
        {
            rotate([180,0,0])
            {
                shaftCoupling
                (
                    driveShaftHeight,
                    shaftCouplingDiameter+5,
                    driveShaftHeight,
                    driveShaftDiameter,
                    lockingScrew
                );
            }
        }
    }
}

module shaftCoupling(

shaftCouplingHeight=17, // cylinder height
shaftCouplingDiameter=20, // cylinder diameter

shaftHeight=17, // internal motor shaft height
shaftDiameter=5.2, // internal motor shaft diameter

lockingScrew="M3" // locking screw thread
) 
{    
    numberOfLockingScrews = 3;
    lockingScrewHeight = getMetricThreadDiameter(lockingScrew)*1.5;
    
    difference()
    {
        difference()
        {	
            // +++++++++++++++++++++
            // Shaft Coupling  
            // +++++++++++++++++++++
            cylinder(r=shaftCouplingDiameter/2,h=shaftCouplingHeight, $fn=1000);	
           
            translate([0,0,-1])
                cylinder(r=shaftDiameter/2,h=shaftHeight+1, $fn=16);
            
        }            
        
        // ++++++++++++++++++++++++++++++++++++
        // Locking Screw Holes
        // ++++++++++++++++++++++++++++++++++++     
        steps = 360 / numberOfLockingScrews;
        for(i = [0:steps:360])
        {
            rotate([0,0,i])
            {
                translate([0,0,lockingScrewHeight])
                {
                    rotate([-90,90.0])
                    {  
                       union() 
                       {         
                           cylinder(h=shaftCouplingDiameter/2, r= getMetricThreadDiameter(lockingScrew)/2, $fn=64);
                           
                           translate([0,0,shaftDiameter/1.3]) {
                               
                               union() 
                               {
                                    metricHexNut(lockingScrew, hasThread=false);	
                                    translate([lockingScrewHeight/2,0,getMetricHexNutHeight(lockingScrew)/2])
                                    cube (size=[lockingScrewHeight+0.1, getMetricHexNutDiameter(lockingScrew)*0.87, getMetricHexNutHeight(lockingScrew)], center = true);
                               }
                           }
                       }
                    }
                }
            }
        }                
    }    
}

// ---------------------------------------------------------------------------------


doubleShaftCoupling();