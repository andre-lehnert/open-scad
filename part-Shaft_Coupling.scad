use <lib-Threads.scad>

// ---------------------------------------------------------------------------------

// ++++++++++++++++++++++++++++++++++++
// Shaft Coupling 
//
// shaftCoupling(H,R,h,r,sn,st,sh);
//
// - H = shaftCouplingHeight=20
// - R shaftCouplingDiameter=10
// - h shaftHeight=17
// - r shaftDiameter=5.1
// - s  numberOfLockingScrews=1,
// - st lockingScrew="M3"
// - sh lockingScrewHeight=14  
//
// ++++++++++++++++++++++++++++++++++++

module shaftCoupling(

shaftCouplingHeight=20, // cylinder height
shaftCouplingDiameter=10, // cylinder radius

shaftHeight=17, // internal motor shaft height
shaftDiameter=5.1, // internal motor shaft radius

numberOfLockingScrews=1,
lockingScrew="M4", // locking screw thread
lockingScrewHeight=14  // locking screw height < "shaftCouplingHeight"
) 
{
     
    difference()
    {
        difference()
        {	
            // +++++++++++++++++++++
            // Shaft Coupling  
            // +++++++++++++++++++++
            union() 
            {        
                cylinder(r=shaftCouplingDiameter,h=shaftCouplingHeight, $fn=1000);	
            }
            
            // Locking Screw Holes    
            translate([0,0,-0.5])
            {
                difference()
                {
                    cylinder(r=shaftDiameter/2, h=shaftHeight+0.5, $fn=100);				
                    
                    if(numberOfLockingScrews == 1) // splay
                    {
                        translate([-2.5,1.6,shaftHeight/2+0.6])
                        {
                            cube([10,5,shaftHeight/2]);
                        }
                    }
                }
            }
        }    
        
        // ++++++++++++++++++++++++++++++++++++
        // Locking Screw Holes
        // ++++++++++++++++++++++++++++++++++++
        
        if(numberOfLockingScrews >= 1) // n holes
        {
            steps = 360 / numberOfLockingScrews;
            for(i = [0:steps:360])
            {
                rotate([0,0,i])
                {
                    translate([0,0,lockingScrewHeight])
                    {
                        rotate([-90,90.0])
                        {
                            metricThread (lockingScrew, shaftCouplingDiameter, true);    
                            //cylinder(r=lockingScrewDiameter,h=15, $fn=100);
                        }
                    }
                }
            }
        }        
    }
    
}

// ---------------------------------------------------------------------------------


shaftCoupling();