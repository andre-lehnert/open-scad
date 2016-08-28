use<lib-Floppy_Drive_Thread.scad>
use<lib-Threads.scad>

use<part-Plexiglass-Sockets.scad>


if (false) 
difference() {


floppyDriveSlide();

translate([-40/2, -40/2, 2])
cube([40,40,20]);

} else {
    floppyDriveSlide();
}


module floppyDriveSlide
(
    // Slide
    height = 16,
    width = 34,

    // Floppy Disk Thread
    diameter = 12,
    pitch = 24,    
    tolerance = 0.30,
    innerRadiusTolerance = 1.3,
    
    notchWidth=20,
    notchAngle=0.45,
    
    bearingWidth=3,
    bearingTolerance=0.35,

    sinkHeight=20
)
{
    length = height;
    
    union() {
    
    translate([-width/2,-width/2])   

        difference() {

            // Torso
            cube([width,width,height]);
            
            translate([width/2, width/2, height])
            sink(maxWidth=width, sinkWidth=10, sinkInnerWidth=11, sinkHeight=sinkHeight);
            
            // Floppy drive thread
            translate([width/2, width/2, 0]) {
                floppyDiskThread
                (
                    diameter=diameter,
                    pitch=pitch, 
                    length=length, 
                    beveledEdges=0, 
                    internal=true,
                    tolerancePercent=tolerance,
                    innerRadiusTolerance=innerRadiusTolerance
                ); 
            }
            
            // notches
            //   __         ___
            //  |O \_______/  O|  <-
            //  |              |
            //
            if (false) {
                // S          
                translate([((width - notchWidth)/2),0,-3]) rotate([0,0,0])
                notch(notchWidth=notchWidth, notchAngle=notchAngle);
                // E
                translate([width, ((width - notchWidth)/2),-3]) rotate([0,0,90])
                notch(notchWidth=notchWidth, notchAngle=notchAngle);
                // N
                translate([notchWidth + ((width - notchWidth)/2), width,-3]) rotate([0,0,180])
                notch(notchWidth=notchWidth, notchAngle=notchAngle);
                // W
                translate([0,notchWidth + ((width - notchWidth)/2),-3]) rotate([0,0,270])
                notch(notchWidth=notchWidth, notchAngle=notchAngle); 
            }
            
            // bearings
            //
            // 4 cylinder
            //  _________
            // |O       O| <-
            // |         |
            // |         |
            // |O_______O| <-
            //
            if (true) {
                bearingDiameter = bearingWidth * (1 + bearingTolerance);
                
                translate([bearingWidth + 1,bearingWidth + 1,0])                
                 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height, $fn=32);
                
                translate([width-bearingWidth - 1,bearingWidth + 1,0])                
                 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height, $fn=32);
                
                translate([width-bearingWidth-1,width-bearingWidth -1,0])                
                 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height, $fn=32);
                
                translate([bearingWidth + 1,width-bearingWidth-1,0])                
                 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height, $fn=32);
            }
            
            // bearing notches
            //  _________
            // /         \  <-
            // |O       O|
            // |         |
            // |         |
            // |O       O|
            // \_________/  <-
            //
            if (true) {
                translate([width/2,width/2,0])
                    for (i = [45 : 90 : 360]) {
                        rotate([0,0,i]) 
                            translate([-width/2 - 5,-5,0])
                            rotate([0,0,90])
                            cube([10, 10, height]);
                    }
            }
            
            // cable management
            //
            // triangles
            //
            if (false) {
                cableManagement(height=height, holes=4);
            }
            
            // slide plexiglas grooves 
            //
            // |       |
            // |_     _|
            //   |___|   <--
            //
            if (true) {
                plexiGlassGrooves(maxWidth = width,
                                maxHeight = height,
                                grooveWidth = 15.5,
                                grooveLength = 2.1,
                                grooveHeight = height - 1,
                                additionalDistance = -1);
            }
        
            
            // cable management
            //
            // spiralcable hole
            // diameter 3.8 mm
            rotate([0,0,45]) 
                translate([(width)/2.7,0,0]) {                   
                    cylinder(r=2.8, h=height , $fn=32);                    
                }   
            
             notchHeight = 0;
    notchDepth = 7;
                
                // E
                translate([width, ((width - notchWidth)/2),0]) rotate([0,0,90])
                cube([notchWidth,notchDepth,notchHeight]);
               

        }
        
        
   
        translate([0,0,height-sinkHeight/2]) 
            plexiglasSockets_2(
                maxWidth = 34,
                maxHeight = 10,
                socketHeight = 10,
                socketWidth = 5,
                grooveWidth = 20,
                grooveLength = 2.1,
                grooveHeight = 10
            );
        
          
    }
        
}





module foots
(
    maxWidth = 34,
    maxHeight = 15,
    footWidth = 20,
    footLength = 2,
    footHeight = 11
) {
    translate([maxWidth/2,maxWidth/2,0]) {
        for (i = [0 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([maxWidth/2,-footWidth/2,0])
                rotate([0,0,90])
                cube([footWidth, footLength, footHeight]);
            
            
        }
    }
}






if (false) 
union() {

cube([3,5,5]);
translate([0,0,5])
hook();
    
}


module hook
(
    hookWidth = 3,
    hookLength = 5,
    hookHeight = 4
) {
    union() { 
        translate([0,-hookWidth/3,hookHeight])    
        union() {
            
            translate([0,hookLength/5,0])
            cube([hookWidth, hookLength/3, hookHeight/5]);
            
            difference() {
                cube([hookWidth, hookLength/5, hookHeight/5]);
                
                translate([0,0,hookHeight/10])
                rotate([45,0,0])
                cube([hookWidth, hookLength/1, hookHeight/3]);
            }
        }    
        cube([hookWidth, hookLength/3, hookHeight]);
        
      
        translate([0,hookLength,0])
        mirror([0,1,0])
        union() { 
        translate([0,-hookWidth/3,hookHeight])    
        union() {
            
            translate([0,hookLength/5,0])
            cube([hookWidth, hookLength/3, hookHeight/5]);
            
            difference() {
                cube([hookWidth, hookLength/5, hookHeight/5]);
                
                translate([0,0,hookHeight/10])
                rotate([45,0,0])
                cube([hookWidth, hookLength/1, hookHeight/3]);
            }
        }    
        cube([hookWidth, hookLength/3, hookHeight]);
    }
    }
}

module hookSlots
(
    width = 34,
    hookWidth = 2,
    hookLength = 5,
    hookHeight = 10
) {
    translate([width/2,width/2,-1]) {
        for (i = [45 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([width/2.4,hookLength/2,-1])
                rotate([0,0,180])
                cube([hookWidth, hookLength, hookHeight]);
            
            
        }
    }
}

module sink
(
    maxWidth = 34,
    sinkWidth = 10,
    sinkInnerWidth = 7,
    sinkHeight = 3
) {
    difference() {
        cube([maxWidth,maxWidth,sinkHeight], center=true);
        //cylinder(sinkWidth, sinkInnerWidth,sinkHeight, center=true);
        cylinder(r=sinkWidth/1.16,h=sinkHeight, center=true, $fn=64);
    }
}

module cableManagement
(
    width = 34,
    height = 10,
    holes = 6
) {
    translate([width/2,width/2,-1]) {
        for (i = [0 : (360/holes) : 360]) {
            rotate([0,0,i]) 
                translate([width/2.9,0,-1])
                rotate([0,0,180])
                cylinder(r=2.2, h=height + 2, $fn=3);
            
            
        }
    }
}


//notch();

// Aussparungen an den Außenseiten
module notch
(
    notchWidth = 23,
    notchHeight = 10,
    notchDepth = 2,
    notchAngle = 0.45
) {
    difference() {
        
        cube([notchWidth,notchDepth,notchHeight]);
        
        translate([0,0,0]){  
            rotate([0,0,notchAngle*100])
            cube([notchDepth*2,notchDepth*2,notchHeight]);
        }
        
        translate([notchWidth,0,0]){ 
            mirror([1,0,0]) 
            rotate([0,0,notchAngle*100])
            cube([notchDepth*2,notchDepth*2,notchHeight]);
        }
    }
    
}

//bearing();

module bearing
(
    bearingDiameter = 5,
    bearingHeight = 10
) {
    $fn=32;
    
    length = bearingHeight;
    od=bearingDiameter;
    id=od/2.083333;    

    id_clearance = od/15;
   
    n = 5; // starts

    layer_height = 0;

	difference() {
		cylinder(r=id / 2 + id_clearance, h=length - layer_height);
		linear_extrude(height = length - layer_height, twist = 540 / n, slices = (length - layer_height))
			for (i=[0:360/n]) {
				rotate(360 / n * i)
					translate([id / 2 / sqrt(2), id / 2 / sqrt(2)])
						square([id, id]);
			}
	}	
}


