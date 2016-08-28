use <Thread_Library.scad>
use <lib-Metric_Threads.scad>

diameter=12;
pitch=12;
height=30;
thread_size = diameter / 2;

flip = true;
if (flip) {
    
    //intersection() {
    translate([0,0,1])    
    threaded_fitting_12x12(height=15, tolerancePercent=0.4);
    
    floppyDiskThread
        (
            diameter=diameter, 
            pitch=pitch, 
            length=height, 
            beveledEdges=1
        );
     
  
    
    //}
    
}

if (!flip) {
    //intersection() {

        floppyDiskThread
        (
            diameter=diameter, 
            pitch=pitch, 
            length=height, 
            beveledEdges=1
        );

        translate([0,0,height/2 + 1.1]) {
            
            difference() {
                
                
                translate([0,diameter/3,0]) 
                cube(size=[diameter+10,diameter/1.5,height], center=true);

                translate([0,0,-height/2])
                floppyDiskThread
                (
                    diameter=diameter, 
                    pitch=pitch, 
                    length=height, 
                    beveledEdges=0, 
                    internal=true,
                    tolerancePercent=0.4
                );
            }
        }

    //}
}

module floppyDiskThread(diameter=14, pitch=14, length=30, beveledEdges=1, internal=false, tolerancePercent=0.05, innerRadiusTolerance=0.0) {
    
    thread_size = diameter / 2;

    rectangle = pitch / 20;
    
    difference() {
        
        metric_thread(
            diameter=diameter, 
            pitch=pitch, 
            length=length, 
            thread_size=thread_size, 
            rectangle=rectangle, 
            internal=internal, 
            groove=true,
            tolerancePercent = tolerancePercent,
            innerRadiusTolerance = innerRadiusTolerance
        );
            
        
        if (beveledEdges==1) {
            
            translate([0,0,length-0.5])
            difference() {
                cylinder(h=diameter,r1=diameter,r2=2,center=true,$fn=64);
                translate([0,0,-2]) cylinder(h=diameter,r1=diameter,r2=2,center=true,$fn=64);
            }
            
        } else if (beveledEdges==2) {
            
            translate([0,0,length-0.5])
            difference() {
                cylinder(h=diameter,r1=diameter,r2=2,center=true,$fn=64);
                translate([0,0,-2]) cylinder(h=diameter,r1=diameter,r2=2,center=true,$fn=64);
            }
            
            translate([0,0,0.5])
            rotate([180,0,0])
            difference() {
                cylinder(h=diameter,r1=diameter,r2=2,center=true,$fn=64);
                translate([0,0,-2]) cylinder(h=diameter,r1=diameter,r2=2,center=true,$fn=64);
            }           
        } 
    }
}



module threaded_fitting_with_bracket_12x12() {

    difference() {
        
        difference() {
            rotate([0,0,90]) threadModule(height=25);
            cylinder(h=height,r=diameter/2,center=true,$fn=64);
          translate([0,9, 12.5]) {
            difference() {
                cube(size=[6,8,pitch+4],center=true);
                
            }
        }
        }      
    }
}

module bracket_12x12(noHole=false) {
    union() {  
        translate([0,3,(pitch)/2])
        difference() {
            cube(size=[6,4,pitch+4],center=true);
            if (!noHole) {
                translate([0,-2,0]) rotate([90,0,0]) cylinder(h=2,r=1.5,center=true, $fn=16);
                translate([0,0,0]) rotate([90,0,0]) cylinder(h=5,r=1,center=true, $fn=16);
            }
        }
   
        translate([0,0,0])
        rotate([0,18,0]) {
            
            difference() {
                cube(size=[5, 5,2], center=true);
                translate([0,-1,1.6]) rotate([30,0,0]) cube(size=[6, 6, 1], center=true);
                rotate([0,180,0])translate([0,-1,1.6]) rotate([30,0,0]) cube(size=[6, 6, 1], center=true);
            }
        }
        
        translate([0,0,pitch])
        rotate([0,18,0]) {
            
            difference() {
                cube(size=[5, 5,2], center=true);
                translate([0,-1,1.6]) rotate([30,0,0]) cube(size=[6, 6, 1], center=true);
                rotate([0,180,0])translate([0,-1,1.6]) rotate([30,0,0]) cube(size=[6, 6, 1], center=true);
            }
        }
    }
}

module threaded_fitting_12x12(height=25, tolerancePercent=0.3, bevealedInnerThread=false) {
    
    difference() {
        
        difference() {
            difference() {
                threadModule(height=height);                
                
                if (bevealedInnerThread) {
                translate([0,0,height + 1.1])               
                    cylinder(h=3,r1=diameter/2,r2=diameter*1.5,center=true,$fn=64);  
                  
                
                translate([0,0,-1.1])
                rotate([0,180,0])               
                     cylinder(h=3,r1=diameter/2,r2=diameter*1.5,center=true,$fn=64);  
                }       
            }   
            floppyDiskThread
            (
                diameter=diameter, // <- ADDED TOLERANCE
                pitch=pitch, 
                length=height, 
                beveledEdges=0, 
                internal=true,
                tolerancePercent=tolerancePercent
            ); 
        }
    }
}



module threadModule(height=15, radius=12)
{
    translate([ 0.00, 0.00, height/2 ])
    {
        difference() 
        {
            // Gewinde
            color([0,0.5,1]) cylinder(height, radius, radius, center = true, $fn=500);
                    
            // Rotationsschutz
            translate([(radius+1), 0, 1]) {
               cube(size = [(radius-1)/2,(radius+3),height+3], center = true);
            }

            translate([-(radius+1), 0, 1]) {
               cube(size = [(radius-1)/2,(radius+3),height+3], center = true);
            }        
        }
    }
}
