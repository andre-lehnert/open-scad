use <lib-Threads.scad>

// shaft coupling
shaftCouplingHeight = 10;
shaftCouplingDiameter = 24;
lockingScrew = "M3";
lockingScrewTolerance = 0.15;

// motor shaft
shaftHeight = 18;
shaftDiameter = 5;
motorShaftTolerance = 0.1;

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

module shaftCoupling(

shaftCouplingHeight=10, // cylinder height
shaftCouplingDiameter=18, // cylinder diameter

shaftHeight=18, // internal motor shaft height
shaftDiameter=5, // internal motor shaft diameter

lockingScrew="M3", // locking screw thread

lockingScrewTolerance=0,
motorShaftTolerance=0
) 
{    
    numberOfLockingScrews = 3;
    lockingScrewHeight = getMetricThreadDiameter(lockingScrew) * (1+lockingScrewTolerance);
    lockingScrewWidth = getMetricHexNutDiameter(lockingScrew) * (1+lockingScrewTolerance);
    lockingScrewBoltDiameter = ( getMetricThreadDiameter(lockingScrew)/2 *(1+lockingScrewTolerance) ) * 2;
    
    motorShaftDiamter = (shaftDiameter/2 * (1+motorShaftTolerance) ) * 2;
    
    echo("--- MOTOR SHAFT ---");
    echo(str("Motor shaft tolerance: ", motorShaftTolerance * 100, " %") );   
    echo(str("Motor shaft height: ", shaftHeight));
    echo(str("Motor shaft diameter with tolerance: ", motorShaftDiamter));
   
    
    echo("--- LOCKING SCREW ---");
    echo(str("Locking screw tolerance: ", lockingScrewTolerance * 100, " %") );
    echo(str("Locking screw nut height: Screw: ", getMetricThreadDiameter(lockingScrew), " | Coupling: ", lockingScrewHeight) );
    echo(str("Locking screw nut width: Screw: ", getMetricHexNutDiameter(lockingScrew), " | Coupling: ", lockingScrewWidth));
    echo(str("Locking screw bolt (hole) diameter: Screw: ", getMetricThreadDiameter(lockingScrew), " | Coupling: ", lockingScrewBoltDiameter));
        
    difference()
    {
        difference()
        {	
            // +++++++++++++++++++++
            // Shaft Coupling  
            // +++++++++++++++++++++
            cylinder(r=shaftCouplingDiameter/2,h=shaftCouplingHeight, $fn=1000);	
           
            translate([0,0,-1])
                cylinder
                (
                    r=shaftDiameter/2 * (1+motorShaftTolerance),
                    h=shaftHeight+0.5 * (1+motorShaftTolerance), 
                    $fn=16
                );
            
        }            
        
        // ++++++++++++++++++++++++++++++++++++
        // Locking Screw Holes
        // ++++++++++++++++++++++++++++++++++++     
        //steps = 360 / numberOfLockingScrews;
        for(i = [0:120:360])
        {
            rotate([0,0,i])
            {
                translate([0,-0.5,lockingScrewHeight])
                {
                    rotate([-90,90.0])
                    {  
                       union() 
                       {   
//                           translate([0,0,12])
//                           cylinder
//                           (
//                                h=2, 
//                                d=6.2, 
//                                $fn=64
//                           );                     
                           
                           cylinder
                           (
                                h=shaftCouplingDiameter/2 *(1+lockingScrewTolerance), 
                                r= getMetricThreadDiameter(lockingScrew)/2 *(1+lockingScrewTolerance), 
                                $fn=64
                           );
                           
                           translate([0,0,shaftCouplingDiameter/4.5 * (1+lockingScrewTolerance)]) {
                               
                               union() 
                               {
                                    metricHexNut
                                    (
                                        lockingScrew, 
                                        hasThread=false,
                                        tolerance=lockingScrewTolerance
                                    );	
                                   
                                    translate([
                                        lockingScrewHeight/2 ,
                                        0,
                                        getMetricHexNutHeight(lockingScrew)/2 * (1+lockingScrewTolerance)
                                    ]) {
                                   
                                    cube
                                    (
                                        size=
                                        [
                                            lockingScrewHeight+0.1 * (1+lockingScrewTolerance), 
                                            getMetricHexNutDiameter(lockingScrew)*0.87  * (1+lockingScrewTolerance), 
                                            getMetricHexNutHeight(lockingScrew) * (1+lockingScrewTolerance)
                                        ], 
                                        center = true);
                                    }
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

