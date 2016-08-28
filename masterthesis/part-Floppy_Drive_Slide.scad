use<lib-Floppy_Drive_Thread.scad>
use<lib-Threads.scad>

use<part-Plexiglass-Sockets.scad>


if (false) 
difference() {


floppyDriveSlide();

translate([-40/2, -40/2, 2])
cube([40,40,20]);

} else {
    floppyDriveSlide_4();
}


//microButtonSpacer (width=34, sinkHeight=20, height=16);
module floppyDriveSlide_4
(
    // Slide
    height = 15,
    width = 34,

    // SG8x15
    nutDiameter = 18,  
    nutHeight = 12,
    nutThreadDiameter = 10,
    nutTolerance = 0.05,
    
    
    notchWidth=20,
    notchAngle=0.45,
    
    bearingWidth=3,
    bearingTolerance=0.30
)
{
    length = height;
    
    union() {
    
    difference() {
    
    union() {
    
    translate([-width/2,-width/2])   

        difference() {
            
            union() {
            // Torso
            cube([width,width,height]);
            
            // Plexglas
            translate([-2, -2, 0])
            cube([width+4,width+4,2]);
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
            
            
            
            // cable management
            //
            // triangles
            //
            if (false) {
                cableManagement(height=height, holes=4);
            }
            
            // cable management
            //
            // robber cables  
            //
            if (false) {
                cableHoleWidth = 12;
                translate([4.3,(width)/2 - cableHoleWidth/2,0]) { 
                    cube([4,cableHoleWidth,height]);                                        
                }   
                
                translate([25.7,(width)/2 - cableHoleWidth/2,0]) { 
                    cube([4,cableHoleWidth,height]);
                                        
                } 
                
            }
            
             if (true) {
                
                 
                 
            
                translate([(width)/2 - 6.6,(width)/2 - 10,0]) { 
                    rotate([0,0,135])
                    cube([5,2.5,height]);                  
                }   
                
           
              translate([(width)/2 - 6.6  + 18.45,(width)/2 - 10 + 18.3,0]) { 
                    rotate([0,0,135])
                    cube([5,2.5,height]);                  
                }  
                
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
                                grooveWidth = 15.7,
                                grooveLength = 2.1,
                                grooveHeight = height - 3,
                                additionalDistance = -1.9);
            }
        
            
            
            
             notchHeight = 0;
             notchDepth = 7;
                
//                // E
//                translate([width, ((width - notchWidth)/2),0]) rotate([0,0,90])
//                cube([notchWidth,notchDepth,notchHeight]);
               
            
            
            // nutSockettranslate([-width/2,-width/2])  
            
            translate([width/2,width/2, 3]) // bottomWallStrength
            rotate([0,0,45]) 
            difference() {
                cylinder(d = (nutDiameter * (1+nutTolerance)), h = nutHeight + 0.01, $fn=64);
                
                translate([-(nutDiameter * (1+nutTolerance))/2,-(nutDiameter * (1+nutTolerance))/2, 0])
                cube([(nutDiameter * (1+nutTolerance)), 1.5, nutHeight + 0.01]);
                
                translate([-(nutDiameter * (1+nutTolerance))/2,(nutDiameter * (1+nutTolerance))/2 - 1.5, 0])
                cube([(nutDiameter * (1+nutTolerance)), 1.5, nutHeight + 0.01]);
            }
                
            translate([width/2,width/2, -0.01]) // bottomWallStrength
            cylinder(d = (nutThreadDiameter * (1+nutTolerance)), h = nutHeight + 0.01, $fn=64);
            
            
            
            
            // connection screws
            
            translate([width/2 - 8,width/2 + 8, 2.85]) 
            cylinder(d=3.2,h=height+0.02, $fn=32); 
          
            
            translate([width/2 - 8,width/2 + 8, -0.01]) 
            rotate([0,0,45])
            difference() {
            metricHexNut
            (
                "M3", 
                hasThread=false,
                tolerance=0.2
            );	
                translate([-0.35,-3,0])
                cube([0.7,6,0.5]);
                
                translate([-0.35,-1.75,0])
                cube([0.7,3.5,3]);
                
                rotate([0,0,90])
                translate([-0.35,-1.75,0])
                cube([0.7,3.5,3]);
                
            }
            
   
            translate([width/2 + 8,width/2 - 8, 2.85]) 
            cylinder(d=3.2,h=height+0.02, $fn=32);
            
            
            translate([width/2 + 8,width/2 - 8, -0.01]) 
            //cylinder(d=6, h=3, $fn=32);
            rotate([0,0,45])
            difference() {
            metricHexNut
            (
                "M3", 
                hasThread=false,
                tolerance=0.2
            );	
                translate([-0.35,-3,0])
                cube([0.7,6,0.5]);
                
                translate([-0.35,-1.75,0])
                cube([0.7,3.5,3]);
                
                rotate([0,0,90])
                translate([-0.35,-1.75,0])
                cube([0.7,3.5,3]);
                
            }
            
            
            
            
            translate([width/2 - 7.75,width - 4, -0.01]) 
            cube([7.75,2.1, 3.02]);
            


        }
        
      
        
        
        
        // Outer sockets
        // plexiglas grooves
        //
        socketHeight = 15;
        translate([0,0,height]) 
            plexiglasSockets_3(
                maxWidth = 34,
                maxHeight = socketHeight,
                socketHeight = socketHeight,
                socketWidth = 5,
                grooveWidth = 18,
                grooveLength = 2.1,
                grooveHeight = socketHeight
            );
        
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
    translate([0,0,0])
        for (i = [45 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([-width/2 - 5,-5,0])
                rotate([0,0,90])
                cube([10, 10, height*3]);
        }
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

translate([-width/2,-width/2,0]) {
translate([bearingWidth + 1,bearingWidth + 1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

translate([width-bearingWidth - 1,bearingWidth + 1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

translate([width-bearingWidth-1,width-bearingWidth -1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

translate([bearingWidth + 1,width-bearingWidth-1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);
}          

}

}}



 
        

}

module floppyDriveSlide_3
(
    // Slide
    height = 15,
    width = 34,

    // SG8x15
    nutDiameter = 18,  
    nutHeight = 12,
    nutThreadDiameter = 10,
    nutTolerance = 0.05,
    
    
    notchWidth=20,
    notchAngle=0.45,
    
    bearingWidth=3,
    bearingTolerance=0.30
)
{
    length = height;
    
    union() {
    
    difference() {
    
    union() {
    
    translate([-width/2,-width/2])   

        difference() {

            // Torso
            cube([width,width,height]);
            

            
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
            
            
            
            // cable management
            //
            // triangles
            //
            if (false) {
                cableManagement(height=height, holes=4);
            }
            
            // cable management
            //
            // robber cables  
            //
            if (false) {
                cableHoleWidth = 12;
                translate([4.3,(width)/2 - cableHoleWidth/2,0]) { 
                    cube([4,cableHoleWidth,height]);                                        
                }   
                
                translate([25.7,(width)/2 - cableHoleWidth/2,0]) { 
                    cube([4,cableHoleWidth,height]);
                                        
                } 
                
            }
            
             if (true) {
                
                 
                 
            
                translate([(width)/2 - 6.6,(width)/2 - 10,0]) { 
                    rotate([0,0,135])
                    cube([5,2.5,height]);                  
                }   
                
           
              translate([(width)/2 - 6.6  + 18.45,(width)/2 - 10 + 18.3,0]) { 
                    rotate([0,0,135])
                    cube([5,2.5,height]);                  
                }  
                
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
                                grooveHeight = height - 3,
                                additionalDistance = -1.9);
            }
        
            
            
            
             notchHeight = 0;
             notchDepth = 7;
                
//                // E
//                translate([width, ((width - notchWidth)/2),0]) rotate([0,0,90])
//                cube([notchWidth,notchDepth,notchHeight]);
               
            
            
            // nutSockettranslate([-width/2,-width/2])  
            
            translate([width/2,width/2, 3]) // bottomWallStrength
            rotate([0,0,45]) 
            difference() {
                cylinder(d = (nutDiameter * (1+nutTolerance)), h = nutHeight + 0.01, $fn=64);
                
                translate([-(nutDiameter * (1+nutTolerance))/2,-(nutDiameter * (1+nutTolerance))/2, 0])
                cube([(nutDiameter * (1+nutTolerance)), 1.5, nutHeight + 0.01]);
                
                translate([-(nutDiameter * (1+nutTolerance))/2,(nutDiameter * (1+nutTolerance))/2 - 1.5, 0])
                cube([(nutDiameter * (1+nutTolerance)), 1.5, nutHeight + 0.01]);
            }
                
            translate([width/2,width/2, -0.01]) // bottomWallStrength
            cylinder(d = (nutThreadDiameter * (1+nutTolerance)), h = nutHeight + 0.01, $fn=64);
            
            
            
            
            // connection screws
            
            translate([width/2 - 8,width/2 + 8, 2.85]) 
            cylinder(d=3.2,h=height+0.02, $fn=32); 
          
            
            translate([width/2 - 8,width/2 + 8, -0.01]) 
            rotate([0,0,45])
            difference() {
            metricHexNut
            (
                "M3", 
                hasThread=false,
                tolerance=0.2
            );	
                translate([-0.35,-3,0])
                cube([0.7,6,0.5]);
                
                translate([-0.35,-1.75,0])
                cube([0.7,3.5,3]);
                
                rotate([0,0,90])
                translate([-0.35,-1.75,0])
                cube([0.7,3.5,3]);
                
            }
            
   
            translate([width/2 + 8,width/2 - 8, 2.85]) 
            cylinder(d=3.2,h=height+0.02, $fn=32);
            
            
            translate([width/2 + 8,width/2 - 8, -0.01]) 
            //cylinder(d=6, h=3, $fn=32);
            rotate([0,0,45])
            difference() {
            metricHexNut
            (
                "M3", 
                hasThread=false,
                tolerance=0.2
            );	
                translate([-0.35,-3,0])
                cube([0.7,6,0.5]);
                
                translate([-0.35,-1.75,0])
                cube([0.7,3.5,3]);
                
                rotate([0,0,90])
                translate([-0.35,-1.75,0])
                cube([0.7,3.5,3]);
                
            }
            
            
            
            
            translate([width/2 - 7.75,width - 4, -0.01]) 
            cube([7.75,2.1, 3.02]);
            


        }
        
      
        
        
        
        // Outer sockets
        // plexiglas grooves
        //
        socketHeight = 15;
        translate([0,0,height]) 
            plexiglasSockets_3(
                maxWidth = 34,
                maxHeight = socketHeight,
                socketHeight = socketHeight,
                socketWidth = 5,
                grooveWidth = 18,
                grooveLength = 2.1,
                grooveHeight = socketHeight
            );
        
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
    translate([0,0,0])
        for (i = [45 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([-width/2 - 5,-5,0])
                rotate([0,0,90])
                cube([10, 10, height*3]);
        }
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

translate([-width/2,-width/2,0]) {
translate([bearingWidth + 1,bearingWidth + 1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

translate([width-bearingWidth - 1,bearingWidth + 1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

translate([width-bearingWidth-1,width-bearingWidth -1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

translate([bearingWidth + 1,width-bearingWidth-1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);
}          

}

}}



 
        

}







module floppyDriveSlide_2
(
    // Slide
    height = 16,
    width = 34,

    // Floppy Disk Thread
    diameter = 12,
    pitch = 18,    
    tolerance = 0.30,
    innerRadiusTolerance = 1.7,
    
    notchWidth=20,
    notchAngle=0.45,
    
    bearingWidth=3,
    bearingTolerance=0.30,

    sinkHeight=16
)
{
    length = height;
    
    union() {
    
    difference() {
    
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
            
            
            
            // cable management
            //
            // triangles
            //
            if (false) {
                cableManagement(height=height, holes=4);
            }
            
            // cable management
            //
            // robber cables  
            //
            if (true) {
                cableHoleWidth = 12;
                translate([4.3,(width)/2 - cableHoleWidth/2,0]) { 
                    cube([4,cableHoleWidth,height]);                                        
                }   
                
                translate([25.7,(width)/2 - cableHoleWidth/2,0]) { 
                    cube([4,cableHoleWidth,height]);
                                        
                } 
                
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
        
            
            
            
             notchHeight = 0;
             notchDepth = 7;
                
//                // E
//                translate([width, ((width - notchWidth)/2),0]) rotate([0,0,90])
//                cube([notchWidth,notchDepth,notchHeight]);
               

        }
        
        
        // Outer sockets
        // plexiglas grooves
        //
        socketHeight = 15;
        translate([0,0,height-sinkHeight/2]) 
            plexiglasSockets_3(
                maxWidth = 34,
                maxHeight = socketHeight,
                socketHeight = socketHeight,
                socketWidth = 5,
                grooveWidth = 20,
                grooveLength = 2.1,
                grooveHeight = socketHeight
            );
        
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
    translate([0,0,0])
        for (i = [45 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([-width/2 - 5,-5,0])
                rotate([0,0,90])
                cube([10, 10, height*2]);
        }
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

translate([-width/2,-width/2,0]) {
translate([bearingWidth + 1,bearingWidth + 1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*2, $fn=32);

translate([width-bearingWidth - 1,bearingWidth + 1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*2, $fn=32);

translate([width-bearingWidth-1,width-bearingWidth -1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*2, $fn=32);

translate([bearingWidth + 1,width-bearingWidth-1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*2, $fn=32);
}          

}

}



    // feets
        translate([-5/2 - 2,width/2,0])
            difference() {
                cube([5,8,8]);
                
                translate([0,8,0])
                rotate([45,0,0])
                cube([5,8,16]);
            }
        
        rotate([0,0,180])    
        translate([-20/2,width/2,0])
            difference() {
                cube([20,11,6]);
                
                translate([0,11,-0.6])
                rotate([60,0,0])
                cube([20,20,20]);
            }

        }
 
        

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
    bearingTolerance=0.25,

    sinkHeight=12
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
        
       
        
        translate([-(width/1.5)/2,width/2,0])
            microButtonSpacer (width=width);
        
        
        translate([(width/1.5)/2,-width/2,0])
             rotate([0,0,180]) 
                microButtonSpacer (width=width);
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


module microButtonSpacer (

width, 
sinkHeight = 20, 
height = 16

) {
    
     
        lockingScrew="M3"; // locking screw thread

        lockingScrewTolerance = 0.20;
        
        lockingScrewHeight = getMetricThreadDiameter(lockingScrew) * (1+lockingScrewTolerance);
        lockingScrewWidth = getMetricHexNutDiameter(lockingScrew) * (1+lockingScrewTolerance);
        lockingScrewBoltDiameter = ( getMetricThreadDiameter(lockingScrew)/2 *(1+lockingScrewTolerance) ) * 2;
        
    
    union() {
                
                difference() {
                    cube([width/4,8,height-sinkHeight/2]);
                    
                    translate([3,4,-1])
                    cylinder(d=3.2,h=20, $fn=32);
                    
                    translate([3,4,2])
                    rotate([0,0,180])
                    union() {
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
               
               translate([5.5,8,0.8])
                 difference() {   
                   rotate([-30,0,270])                    
                    cube([8,width/2,height-sinkHeight/2]);
                    
                    translate([0,-9,-10.8])    
                        cube([30,10,10]);
                     
                     
                      translate([0,3,-1]) 
                        rotate([0,0,-45])
                        cube([30,10,10]);
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


