use<lib-Floppy_Drive_Thread.scad>
use<lib-Threads.scad>

use<part-Plexiglass-Sockets.scad>

innerBarHeader_1();


module innerBarHeader_2
(
    // Slide
    height = 6,
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
    
    difference() {
    
    union() {
    
    difference() {
    
    union() {
    
    translate([-width/2,-width/2])        
                

        difference() {

            // Torso
            cube([width,width,height]);    

              
            
            
            
            
            
           

       

        }
        
      
        
        
        
       
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
translate([bearingWidth + 1,bearingWidth + 1,-0.01])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

translate([width-bearingWidth - 1,bearingWidth + 1,-0.01])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

translate([width-bearingWidth-1,width-bearingWidth -1,-0.01])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

translate([bearingWidth + 1,width-bearingWidth-1,-0.01])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);
    

    
    
}          

}

// side notches
//
if (true) {
    size = 18;
    for (i = [0:90:360]) {
        rotate([0,0,i])
        translate([-width/2,-size/1.4,-0.01]) {
            rotate([0,0,45])
            cube([size,size,height+0.02]);
            
        }
    }
}

}

// driveshaft socket

    cylinder(d=13, h=height, $fn=64);

    translate([-14,-7,0])
    difference() {
        cube([8,14,height]); 
        
        rotate([0,10,0])
        translate([1.5,4.25,-0.01]) 
        cube([1.5,5.5,height*2]);
        //cylinder(d=5, h=height, $fn=32);
        
        translate([0,-3,-0.01])
        rotate([0,0,45])
        cube([5,5,height+0.02]);
        
        translate([0,10,-0.01])
        rotate([0,0,45])
        cube([5,5,height+0.02]);
    }
}    


// cable management
            //    
             if (true) {
                translate([-width/2,-width/2,0]) {
                 
                rotate([0,0,45])
                translate([10,-1.5,-0.01])                   
                    cube([1.5,3,height+0.02]);                  
                
                rotate([0,0,45])
                translate([10,-1.5,-0.01])                   
                    cube([8,3,1.5]); 
                
                rotate([0,0,45])
                translate([14.4+1,-1.5,-0.01])                   
                    cube([3,10,1.5]); 
                 
                 
                rotate([0,0,45])
                translate([36.5,-1.5,-0.01])                   
                    cube([1.5,3,height+0.02]);                  
                
                 rotate([0,0,45])
                translate([36.5-7,-1.5,-0.01])                   
                    cube([8,3,1.5]); 
                 
                  rotate([0,0,45])
                translate([36.5-7,-1.5,-0.01])                   
                    cube([4,6,1.5]); 
                  
                
                
               rotate([0,0,45])
                translate([17.5,2.65,-0.01])   
                    rotate([0,0,45])
                    cube([5.5,5.5,1.5]);
              
        
  
  
                     rotate([0,0,45])
                translate([16.5,5.6,-0.01])                   
                    cube([11,3,1.5]); 
                }
                
            }
            
    
    



     translate([0,0, -0.01]) // bottomWallStrength            
                cylinder(d = 6.5, h = height + 0.02, $fn=64);                   

bearingDiameter = bearingWidth * (1 + bearingTolerance);

translate([-width/2,-width/2,0]) {
    // lockingscrew
translate([width-bearingWidth - 6,bearingWidth + 6,-0.01])                
 cylinder(d=3.2, h=height*3, $fn=32);
    
//translate([bearingWidth + 6,width-bearingWidth-6,-0.01])                
// cylinder(d=3.2, h=height*3, $fn=32);
}            
      }



}
    


module innerBarHeader_1
(
    // Slide
    height = 6,
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
    
    difference() {
    
    union() {
    
    difference() {
    
    union() {
    
    translate([-width/2,-width/2])        
                

        difference() {

            // Torso
            cube([width,width,height]);    

              
            
            
            
            
            
           

       

        }
        
      
        
        
        
       
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
translate([bearingWidth + 1,bearingWidth + 1,-0.01])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

translate([width-bearingWidth - 1,bearingWidth + 1,-0.01])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

translate([width-bearingWidth-1,width-bearingWidth -1,-0.01])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

translate([bearingWidth + 1,width-bearingWidth-1,-0.01])                
 cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);
    

    
    
}          

}

// side notches
//
if (true) {
    size = 18;
    for (i = [0:90:360]) {
        rotate([0,0,i])
        translate([-width/2,-size/1.4,-0.01]) {
            rotate([0,0,45])
            cube([size,size,height+0.02]);
            
        }
    }
}

}

// driveshaft socket

    cylinder(d=13, h=height, $fn=64);

    translate([-14,-7,0])
    difference() {
        cube([8,14,height]); 
        
        rotate([0,10,0])
        translate([1.5,4.25,-0.01]) 
        cube([1.5,5.5,height*2]);
        //cylinder(d=5, h=height, $fn=32);
        
        translate([0,-3,-0.01])
        rotate([0,0,45])
        cube([5,5,height+0.02]);
        
        translate([0,10,-0.01])
        rotate([0,0,45])
        cube([5,5,height+0.02]);
    }
}    


// cable management
            //    
             if (true) {
                translate([-width/2,-width/2,0]) {
                 
                rotate([0,0,45])
                translate([10,-1.5,-0.01])                   
                    cube([1.5,3,height+0.02]);                  
                
                rotate([0,0,45])
                translate([10,-1.5,-0.01])                   
                    cube([8,3,1.5]); 
                
                rotate([0,0,45])
                translate([14.4+1,-1.5,-0.01])                   
                    cube([3,10,1.5]); 
                 
                 
                rotate([0,0,45])
                translate([36.5,-1.5,-0.01])                   
                    cube([1.5,3,height+0.02]);                  
                
                 rotate([0,0,45])
                translate([36.5-7,-1.5,-0.01])                   
                    cube([8,3,1.5]); 
                 
                  rotate([0,0,45])
                translate([36.5-7,-1.5,-0.01])                   
                    cube([4,6,1.5]); 
                  
                
                
               rotate([0,0,45])
                translate([17.5,2.65,-0.01])   
                    rotate([0,0,45])
                    cube([5.5,5.5,1.5]);
              
        
  
  
                     rotate([0,0,45])
                translate([16.5,5.6,-0.01])                   
                    cube([11,3,1.5]); 
                }
                
            }
            
    
    



     translate([0,0, -0.01]) // bottomWallStrength            
                cylinder(d = 6.5, h = height + 0.02, $fn=64);                   

bearingDiameter = bearingWidth * (1 + bearingTolerance);

translate([-width/2,-width/2,0]) {
    // lockingscrew
translate([width-bearingWidth - 6,bearingWidth + 6,-0.01])                
 cylinder(d=3.2, h=height*3, $fn=32);
    
translate([bearingWidth + 6,width-bearingWidth-6,-0.01])                
 cylinder(d=3.2, h=height*3, $fn=32);
}            
      }



}
