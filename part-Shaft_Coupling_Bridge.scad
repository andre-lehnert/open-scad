use <lib-Threads.scad>


bridgeCoupling();


module bridgeCoupling
(
    motorShaftDiameter = 5,
    driveShaftDiameter = 10,
    tolerance = 0.0,
    
    couplingHeight = 8,
    
    holeX = 8,
    corner_cut = 26
)
{
   
   holeY = driveShaftDiameter - 2; 

    translate([0, holeX*1.6, couplingHeight/2]) {
        union() {
            
            difference(){
            
                cube(size = [holeX*4,holeY*3,couplingHeight], center = true);        
            
                //slot
                cube(size = [2,40,30], center = true);
                
                //nut holes
                translate([-holeX, -holeY, -couplingHeight/2]) metricHexBolt(name="M3", additionalWidth=0.2, height=couplingHeight+1, hasThread=true, debug= true);
                translate([-holeX, holeY, -couplingHeight/2]) metricHexBolt(name="M3", additionalWidth=0.2, height=couplingHeight+1, hasThread=true, debug= true);
                translate([holeX, -holeY, -couplingHeight/2]) metricHexBolt(name="M3", additionalWidth=0.2, height=couplingHeight+1, hasThread=true, debug= true);
                translate([holeX, holeY, -couplingHeight/2]) metricHexBolt(name="M3", additionalWidth=0.2, height=couplingHeight+1, hasThread=true, debug= true);
                
                //shaft groves
                translate([-holeX*2-1, 0, 5]) rotate([0,90,0]) cylinder(h = holeX*2+1, r=motorShaftDiameter/2 + tolerance, $fn=16);
                translate([-0.5, 0, 5]) rotate([0,90,0]) cylinder(h = holeX*2+1, r=driveShaftDiameter/2 + tolerance, $fn=16);
                
                rotate([0,0,30]) translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
                rotate([0,0,-30]) translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
                rotate([0,0,150]) translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
                rotate([0,0,-150]) translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
            }
        }
    }

    translate([0, -holeX*1.6, couplingHeight/2]) rotate([0,0,180]) {
        union() {
            
            difference(){
            
                cube(size = [holeX*4,holeY*3,couplingHeight], center = true);       
            
                
                //nut holes
                translate([-holeX, -holeY, -couplingHeight/2]) metricHexBolt(name="M3", additionalWidth=0.2, height=couplingHeight+1, hasThread=true, debug= true);
                translate([-holeX, holeY, -couplingHeight/2]) metricHexBolt(name="M3", additionalWidth=0.2, height=couplingHeight+1, hasThread=true, debug= true);
                translate([holeX, -holeY, -couplingHeight/2]) metricHexBolt(name="M3", additionalWidth=0.2, height=couplingHeight+1, hasThread=true, debug= true);
                translate([holeX, holeY, -couplingHeight/2]) metricHexBolt(name="M3", additionalWidth=0.2, height=couplingHeight+1, hasThread=true, debug= true);
                
                //shaft groves
                translate([-holeX*2-1, 0, 5]) rotate([0,90,0]) cylinder(h = holeX*2+1, r=motorShaftDiameter/2 + tolerance, $fn=16);
                translate([-0.5, 0, 5]) rotate([0,90,0]) cylinder(h = holeX*2+1, r=driveShaftDiameter/2 + tolerance, $fn=16);
                
                rotate([0,0,30]) translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
                rotate([0,0,-30]) translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
                rotate([0,0,150]) translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
                rotate([0,0,-150]) translate([corner_cut, 0, 0]) cube(size = [20,40,20], center = true);
            }
        }
    }
    
}


