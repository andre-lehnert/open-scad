use <lib-Threads.scad>

// shaft coupling
shaftCouplingHeight = 10;
shaftCouplingDiameter = 12;

// motor shaft
shaftHeight = 18;
shaftDiameter = 5;
motorShaftTolerance = 0.05;

shaftHoleCoupling
(
    shaftCouplingHeight=shaftCouplingHeight, // cylinder height
    shaftCouplingDiameter=shaftCouplingDiameter, // cylinder diameter
    shaftHeight=shaftHeight, // internal motor shaft height
    shaftDiameter=shaftDiameter, // internal motor shaft diameter
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

module shaftHoleCoupling 
(
    shaftCouplingHeight = 10,
    shaftCouplingDiameter = 12,
    lockingHoleDiameter = 2,
    lockingHoleTolerance = 0.1,
    lockingHolePosition = 5, // Z-axis
    shaftHeight = 20, // internal motor shaft height
    shaftDiameter = 5, // internal motor shaft diameter    
    shaftTolerance = 0.1
)
{    
    
    motorShaftDiamter = (shaftDiameter/2 * (1+motorShaftTolerance) ) * 2;
    
    echo("--- MOTOR SHAFT ---");
    echo(str("Motor shaft tolerance: ", motorShaftTolerance * 100, " %") );   
    echo(str("Motor shaft height: ", shaftHeight));
    echo(str("Motor shaft diameter with tolerance: ", motorShaftDiamter));
      
        
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
        
        holeDiameter = lockingHoleDiameter*(1+shaftTolerance);
        
        //
        translate([-(shaftCouplingDiameter/2),0,lockingHolePosition])
        rotate([0,90,0])
        cylinder(d=holeDiameter, h=shaftCouplingDiameter*2, $fn=16);
            
    }            
    
}

// ---------------------------------------------------------------------------------

