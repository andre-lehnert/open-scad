use<lib-Floppy_Drive_Thread.scad>
use<lib-Threads.scad>

use<part-Plexiglass-Sockets.scad>

intersection() {
    translate([-20,-20,0])
cube([40,40,50]);
barHeader_2();

}


module barHeader_2
(
    // Slide
    height = 7,
    width = 34,
   
    bearingWidth=3,
    bearingTolerance=0.20
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
            
            // electronic socket
//
            // cable connector
//
connectorWidth = 10.9;
connectorHeight = 3.5;
eWidth = 24;
translate([5,7,-0.01])
            
    difference() {
        
        
        cube([eWidth,20, height*2]);
    //        translate([0,8,0])
    //        cube([eWidth,4, 2]);
        
            translate([0,0,0])
                difference(){
                    
                    cube([eWidth,20, 2]);
                    
                    translate([eWidth/2 - connectorWidth/2,0,-0.01]) {
                        cube([connectorWidth,connectorHeight,height*2]);
                        
                        translate([5.5,3,0])
                            cube([3,3,height*2]);
                    }
                    
                    translate([eWidth/2 - (connectorWidth+0)/2,20-connectorHeight-1.5,-0.01])
                        cube([(connectorWidth+3),connectorHeight+1,height*2]);
                    
                    translate([0,0,0])
                        cube([3.5,eWidth,height*2]);
                    
                    translate([22,0,0])
                        cube([2,eWidth,height*2]);
                }
    }
   
    translate([3.6,9.75,0])
     rotate([0,45,0])
    cube([3,14.5,2]);
         
    
      translate([27.5,9.75,0])
    rotate([0,45,0])
    cube([3,14.5,2]);     
            
            // cable management
            //
            // triangles
            //     
            
     
            
            
            
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
                                grooveHeight = height - 2,
                                additionalDistance = -1.9);
            }
        
            
            
         
            
            
            

            


        }
        
     
        
        
        
        // Outer sockets
        // plexiglas grooves
        //
        socketHeight = 17;
        translate([0,0,0]) 
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
                translate([-width/2 - 5,-5,-0.01])
                rotate([0,0,90])
                cube([10, 10, height*10]);
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
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=11, $fn=32);

translate([width-bearingWidth - 1,bearingWidth + 1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=11, $fn=32);

translate([width-bearingWidth-1,width-bearingWidth -1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=11, $fn=32);

translate([bearingWidth + 1,width-bearingWidth-1,0])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=11, $fn=32);
}          

}


//translate([-connectorWidth/2,9.9,-0.01])
//cube([connectorWidth,connectorHeight,height*2]);

//translate([-connectorWidth/2,-13,-0.01])
//cube([connectorWidth,connectorHeight,height*2]);

//translate([-13,-connectorWidth/2,-0.01])
//cube([connectorHeight,connectorWidth,height*2]);


//translate([-11.5,-1,-0.01])
//    cube([16,9,height*3]);
//
//translate([-4.5,-8,-0.01])
//    cube([16,9,height*3]);
//
//translate([-11.5,-16/2,-0.01])
//    cube([23,16,height*3]);


}




}



 
        

}





module barHeader_1
(
    // Slide
    height = 7,
    width = 34,
   
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
            
            // electronic socket
//
eWidth = 23;
translate([5.5,8.5,-0.01])

    cube([eWidth,eWidth-6, height*2]);

                      
            
            
            // cable management
            //
            // triangles
            //     
            
     
            
            
            
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
                                grooveHeight = height - 2,
                                additionalDistance = -1.9);
            }
        
            
            
         
            
            
            
            // connection screws
            if (true) {
//            translate([width/2 - 8,width/2 + 8, -0.01]) 
//            cylinder(d=3.2,h=height+0.02, $fn=32); 
         
//            translate([width/2 + 8,width/2 - 8,  -0.01]) 
//            cylinder(d=3.2,h=height+0.02, $fn=32);
            
//            translate([width/2 + 8,width/2 + 8, -0.01]) 
//            cylinder(d=2.3,h=height+0.02, $fn=32); 
//         
//            translate([width/2 - 8,width/2 - 8,  -0.01]) 
//            cylinder(d=2.3,h=height+0.02, $fn=32);
//            
        
       
            
        }
            


        }
        
     
        
        
        
        // Outer sockets
        // plexiglas grooves
        //
        socketHeight = 17;
        translate([0,0,0]) 
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
                translate([-width/2 - 5,-5,-0.01])
                rotate([0,0,90])
                cube([10, 10, height*10]);
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

// cable connector
//
connectorWidth = 10.5;
connectorHeight = 3.1;
//translate([-connectorWidth/2,9.9,-0.01])
//cube([connectorWidth,connectorHeight,height*2]);

translate([-connectorWidth/2,-13,-0.01])
cube([connectorWidth,connectorHeight,height*2]);

translate([-13,-connectorWidth/2,-0.01])
cube([connectorHeight,connectorWidth,height*2]);


//translate([-11.5,-1,-0.01])
//    cube([16,9,height*3]);
//
//translate([-4.5,-8,-0.01])
//    cube([16,9,height*3]);

translate([-11.5,-16/2,-0.01])
    cube([23,16,height*3]);


}




}



 
        

}
