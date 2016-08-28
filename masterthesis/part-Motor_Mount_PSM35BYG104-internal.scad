use <lib-Metric_Threads.scad>
use<part-Motor_PSM35BYG104.scad>
use<part-Microbutton.scad>
use<part-Shaft_Coupling_Alu.scad>



buttonHeight = getMotorDepth() + 3;

if (false) {
    translate([getMotorWidth()/2 - 7,getMotorWidth()/2 - 6.5,34]) {
        rotate([0,0,90])
        microButton();
       } 
       
    translate([-11,-getMotorWidth()/2 + 7,39])
    rotate([0,0,-90])
    color("green")
    GP2Y0D805Z0F();
     


    translate([0,0,2])
    PSM35BYG104();


translate([0,0,25])
shaftCoupling5x8();

linearGuideHeight = 225;

for (i = [0:90:360]) {
    rotate([0,0,i])
        translate([12.95,12.95,0]) {
            color("lightgrey")
            cylinder(r=1.5, h=linearGuideHeight, $fn=24);
        }    
}

       





}

internalPSM35BYG104_Mount_2();


module internalPSM35BYG104_Mount_2() {
    
    
// bearings
//
// 4 cylinder
//  _________
// |O       O| <-
// |         |
// |         |
// |O_______O| <-
//    
height = 21;
width = 38;
bearingWidth=3;
bearingTolerance=0.30;    
bearingDiameter = bearingWidth * (1 + bearingTolerance);
    
translate([0,0,0])  // 26
difference() {
    
    translate([-width/2,-width/2,0]) {
    // Torso
        union() {
            cube([width,width,height]);
            translate([0,width +0,0]) 
            cube([width,2,height]);
        }
    }         

    widthLinear = 34;

     translate([-widthLinear/2,-widthLinear/2,0]) {
        translate([bearingWidth + 1,bearingWidth + 1,0])                
         cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

        translate([bearingWidth + 1,bearingWidth - 0.95,0])      
         cube([((bearingWidth/2) * (1 + bearingTolerance)),((bearingWidth/2) * (1 + bearingTolerance))*2,height*3]);
        
         
        translate([widthLinear-bearingWidth - 1,bearingWidth + 1,0])                
         cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);
        translate([widthLinear-bearingWidth - 3,bearingWidth - 0.95,0])                
         cube([((bearingWidth/2) * (1 + bearingTolerance)),((bearingWidth/2) * (1 + bearingTolerance))*2,height*3]);
         

        translate([widthLinear-bearingWidth-1,widthLinear-bearingWidth -1,0])                
         cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

        translate([bearingWidth + 1,widthLinear-bearingWidth-1,0])                
         cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);
         
        
         
         
        translate([widthLinear-bearingWidth - 2.5,widthLinear-bearingWidth - 4.7,-0.01])                
         cube([3,3,height*3]);

          translate([bearingWidth - 0.5,bearingWidth + 1.7,-0.01])              
        cube([3.44,3,height*3]);
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
    translate([0,0,0])
        for (i = [45 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([-width/2 - 5,-7.5,0])
                rotate([0,0,90])
                cube([15, 15, height*3]);
        }
        
    // coupling hole
    //
    //  _________
    // /         \  
    // |         |
    // |   ***   |
    // |   ***   |
    // |         |
    // \_________/  
    //    
    translate([0,0,-0.01])
        cylinder(d=24, h=height+0.02, $fn=64);
        
        
    // bridge to reach the coupling screws
    translate([-width,0,-4])    
    rotate([0,90,0])
    cylinder(d=18, h=width *2, $fn=64);
        
    translate([-width,0,height + 4])    
    rotate([0,90,0])
    cylinder(d=18, h=width *2, $fn=64);
        
        
    // microbutton hole    
    translate([-10.2,(getMotorHeight()/2) - 17, 8]) 
    difference() {
        
        cube([getButtonWidth()*1.03,getButtonDepth()*1.05 +10,getButtonLength()+getPinLength() + 20]);
                                
        // pin foots
        translate([5,7,0])
        cube([3,getButtonDepth()*1.05+ 5,getPinLength()*0.70]);
        
        translate([13,7,0])
        cube([3,getButtonDepth()*1.05+ 5,getPinLength()*0.70]);
    }
    
     translate([getButtonWidth() - 24.5,(getMotorHeight()/2) + getButtonDepth(),15 ]) 
        rotate([90,0,0])
        cylinder(d=2.3,h=wallStrength*10, center= true, $fn=32);
        
        translate([getButtonWidth() - 14.5,(getMotorHeight()/2) + getButtonDepth(),15]) 
        rotate([90,0,0])
        cylinder(d=2.3,h=wallStrength*10, center= true, $fn=32);
    
    // microbutton cable holes
    translate([getButtonWidth() - 27.5,(getMotorHeight()/2) - 3,5 ]) 
        cylinder(d=3,h=height/2, center= true, $fn=32);
    translate([getButtonWidth() - 19.7,(getMotorHeight()/2) - 3,5 ]) 
        cylinder(d=3,h=height/2, center= true, $fn=32);
    translate([getButtonWidth() - 12,(getMotorHeight()/2) - 3,5 ]) 
        cylinder(d=3,h=height/2, center= true, $fn=32);
    
    
    // IR Sensor 
     translate([-11.25,-widthLinear/2 -2.3,11]) 
        difference() {
            cube([22.5,10,getButtonLength()+getPinLength() + 0]);
            
            // pin foots
            translate([0,0,0])
            cube([5,11,1.5]);
            
        }
     // screw   
     translate([-8.5,-widthLinear/2 +2,height/2]) 
         cylinder(d=2.5,h=12, center= true, $fn=32);
        
      translate([-11.5,-widthLinear/2 -0.01 - 2,4])   
        cube([6,6.5,2]);
        
      // IR 3 Pin
      translate([8,-widthLinear/2 -2,0])   
        cube([4,8,height]);
}
    
}



module internalPSM35BYG104_Mount() {
    
    
// bearings
//
// 4 cylinder
//  _________
// |O       O| <-
// |         |
// |         |
// |O_______O| <-
//    
height = 21;
width = 34;
bearingWidth=3;
bearingTolerance=0.30;    
bearingDiameter = bearingWidth * (1 + bearingTolerance);
    
translate([0,0,26])  
difference() {
    
    translate([-width/2,-width/2,0]) {
    // Torso
        union() {
            cube([width,width,height]);
            translate([0,width +0,0]) 
            cube([width,2,height]);
        }
    }         

     translate([-width/2,-width/2,0]) {
        translate([bearingWidth + 1,bearingWidth + 1,0])                
         cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

        translate([bearingWidth + 1,bearingWidth - 0.95,0])      
         cube([((bearingWidth/2) * (1 + bearingTolerance)),((bearingWidth/2) * (1 + bearingTolerance))*2,height*3]);
        
         
        translate([width-bearingWidth - 1,bearingWidth + 1,0])                
         cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);
        translate([width-bearingWidth - 3,bearingWidth - 0.95,0])                
         cube([((bearingWidth/2) * (1 + bearingTolerance)),((bearingWidth/2) * (1 + bearingTolerance))*2,height*3]);
         

        translate([width-bearingWidth-1,width-bearingWidth -1,0])                
         cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);

        translate([bearingWidth + 1,width-bearingWidth-1,0])                
         cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=height*3, $fn=32);
         
        
         
         
        translate([width-bearingWidth - 2.5,width-bearingWidth - 4.7,-0.01])                
         cube([3,3,height*3]);

          translate([bearingWidth - 0.5,bearingWidth + 1.7,-0.01])              
        cube([3.44,3,height*3]);
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
    translate([0,0,0])
        for (i = [45 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([-width/2 - 5,-7.5,0])
                rotate([0,0,90])
                cube([15, 15, height*3]);
        }
        
    // coupling hole
    //
    //  _________
    // /         \  
    // |         |
    // |   ***   |
    // |   ***   |
    // |         |
    // \_________/  
    //    
    translate([0,0,-0.01])
        cylinder(d=24, h=height+0.02, $fn=64);
        
        
    // bridge to reach the coupling screws
    translate([-width,0,-4])    
    rotate([0,90,0])
    cylinder(d=18, h=width *2, $fn=64);
        
    translate([-width,0,height + 4])    
    rotate([0,90,0])
    cylinder(d=18, h=width *2, $fn=64);
        
        
    // microbutton hole    
    translate([-10.2,(getMotorHeight()/2) - 17, 8]) 
    difference() {
        
        cube([getButtonWidth()*1.03,getButtonDepth()*1.05 +10,getButtonLength()+getPinLength() + 20]);
                                
        // pin foots
        translate([5,7,0])
        cube([3,getButtonDepth()*1.05+ 5,getPinLength()*0.70]);
        
        translate([13,7,0])
        cube([3,getButtonDepth()*1.05+ 5,getPinLength()*0.70]);
    }
    
     translate([getButtonWidth() - 24.5,(getMotorHeight()/2) + getButtonDepth(),15 ]) 
        rotate([90,0,0])
        cylinder(d=2.3,h=wallStrength*10, center= true, $fn=32);
        
        translate([getButtonWidth() - 14.5,(getMotorHeight()/2) + getButtonDepth(),15]) 
        rotate([90,0,0])
        cylinder(d=2.3,h=wallStrength*10, center= true, $fn=32);
    
    // microbutton cable holes
    translate([getButtonWidth() - 27.5,(getMotorHeight()/2) - 3,5 ]) 
        cylinder(d=3,h=height/2, center= true, $fn=32);
    translate([getButtonWidth() - 19.7,(getMotorHeight()/2) - 3,5 ]) 
        cylinder(d=3,h=height/2, center= true, $fn=32);
    translate([getButtonWidth() - 12,(getMotorHeight()/2) - 3,5 ]) 
        cylinder(d=3,h=height/2, center= true, $fn=32);
    
    
    // IR Sensor 
     translate([-11.25,-width/2 -0.01,11]) 
        difference() {
            cube([22.5,7,getButtonLength()+getPinLength() + 0]);
            
            // pin foots
            translate([0,0,0])
            cube([5,11,1.5]);
            
        }
     // screw   
     translate([-8.5,-width/2 +2,height/2]) 
         cylinder(d=2.5,h=10, center= true, $fn=32);
        
      translate([-11.5,-width/2 -0.01,7])   
        cube([6,5,2]);
        
      // IR 3 Pin
      translate([8,-width/2 ,0])   
        cube([4,6,height]);
}
    
}


//
//color([0.9,0.9,0.9,0.9])
//mountPSM35BYG104_5();



wallStrength = 2;
basePlateHeigth = 1.5;
edgeHeight = 2;

module mountPSM35BYG104_5_basePlate_2() {
    
    mountHeight = getMotorDepth()+10;
    
    translate([0,0,4])
    difference() {
    
 
        
            union() {
            
                   
                   
                   
          
            
            cube(size = [getMotorWidth()+(wallStrength*2) + (20.6) + wallStrength*2,getMotorHeight()+(wallStrength*2)+ (20.6) + wallStrength*2,wallStrength], center= true);
            translate([0,0,wallStrength])
                difference() {
             // torso
                    
                    cube(size = [getMotorWidth()+(wallStrength*2) + (20.6) + wallStrength*2,getMotorHeight()+(wallStrength*2)+ (20.6) + wallStrength*2,wallStrength*2], center= true);
                
                    
                      cube(size = [getMotorWidth()+(wallStrength*2) + (20.9),getMotorHeight()+(wallStrength*2)+ (20.9) ,wallStrength*2], center= true);
                }
    
            }
        
        
//        // base plate      
        
        // screw holes
        translate([-getMotorWidth()/2-6,(getMotorHeight()/2+6),-5 ])
               cylinder(d=3.4,mountHeight*3, $fn=16);
        
        translate([getMotorWidth()/2+6,(getMotorHeight()/2+6),-5 ])
               cylinder(d=3.4,mountHeight*3, $fn=16);
        
        translate([-getMotorWidth()/2-6,-(getMotorHeight()/2+6),-5])
               cylinder(d=3.4,mountHeight*3, $fn=16);
 
        translate([getMotorWidth()/2+6,-(getMotorHeight()/2+6),-5])
               cylinder(d=3.4,mountHeight*3, $fn=16);

       // torso
                    translate([0,0,-1])
                    cube(size = [getMotorWidth(),getMotorHeight(),mountHeight], center= true);
     
}
}

module mountPSM35BYG104_5_basePlate() {
    
    mountHeight = getMotorDepth()+10;
    
    difference() {
    
        union() {
        
            
            difference() {
                    
                    // motor hole
                    translate([0,0,wallStrength/2])
                    cube(size = [getMotorWidth()+(wallStrength*2) + (20 - wallStrength),getMotorHeight()+(wallStrength*2)+ (20 - wallStrength),wallStrength], center= true);
                
                    // torso
                    translate([0,0,wallStrength/2])
                    cube(size = [getMotorWidth()+(wallStrength*2) + 0.6,getMotorHeight()+(wallStrength*2)+ 0.6,wallStrength], center= true);
                   
            }
            
            
    
        }
        
//        // base plate      
        
        
        translate([-getMotorWidth()/2-6,(getMotorHeight()/2+6),0 ])
               cylinder(d=3.4,mountHeight*2, $fn=16);
        
         
        
        translate([-getMotorWidth()/2-6,-(getMotorHeight()/2+6),0])
               cylinder(d=3.4,mountHeight*2, $fn=16);
 
        translate([getMotorWidth()/2+6,-(getMotorHeight()/2+6),0])
               cylinder(d=3.4,mountHeight*2, $fn=16);
      
        
  

    
     
}
}

module mountPSM35BYG104_5() {
    
    mountHeight = getMotorDepth()+10;
    
    difference() {
    
        union() {
        
            difference() {
                    // torso
                    translate([0,0,mountHeight/2])
                    cube(size = [getMotorWidth()+(wallStrength*2),getMotorHeight()+(wallStrength*2),mountHeight], center= true);
                    // motor hole
                    translate([0,0,mountHeight+wallStrength/2])
                    cube(size = [getMotorWidth()*1.05,getMotorHeight()*1.05,mountHeight*2], center= true);
            }
            
            difference() {
                    // torso
                    translate([0,0,mountHeight/2])
                    cube(size = [getMotorWidth()+(wallStrength*2) + 20 + 0.6,getMotorHeight()+(wallStrength*2) + 20 + 0.6,mountHeight], center= true);
                    // motor hole
                    translate([0,0,mountHeight])
                    cube(size = [getMotorWidth()+(wallStrength*2) + (20 - wallStrength) + 0.6,getMotorHeight()+(wallStrength*2)+ (20 - wallStrength) + 0.6,mountHeight*2], center= true);
                
                    
                    translate([0,0,mountHeight])
                    cube(size = [getMotorWidth()*1.05,getMotorHeight()*1.05,mountHeight*2], center= true);
            }
            
            
            
            
//                
//                
//            }
            
            // construction structure
            constructionPosition = (getMotorWidth()+(wallStrength*2) + (20 - wallStrength) + 0.6)/2;
            
            constructionSteps = constructionPosition/5;
            constructionFeetLength = 20;
            
            for (i = [0:1:10]) {
                if (i == 3 || i == 7) {                
                    translate([constructionPosition-14,-constructionPosition - 0.5 + constructionSteps*i,0])
                    cube(size=[14, 3,  1]);
                } else {
                    translate([constructionPosition,-constructionPosition - 0.5 + constructionSteps*i,0])
                    cube(size=[constructionFeetLength, 1,  0.5]);
                }
                rotate([0,0,180])
                if (i == 3  || i == 7) {                
                    translate([constructionPosition-14,-constructionPosition - 0.5 + constructionSteps*i,0])
                    cube(size=[14, 3,  1]);
                } else {
                    translate([constructionPosition,-constructionPosition - 0.5 + constructionSteps*i,0])
                    cube(size=[constructionFeetLength, 1,  0.5]);
                }
                
                 rotate([0,0,90])
                if (i == 3  || i == 7) {                
                    translate([constructionPosition-14,-constructionPosition - 0.5 + constructionSteps*i,0])
                    cube(size=[14, 3,  1]);
                } else {
                    translate([constructionPosition,-constructionPosition - 0.5 + constructionSteps*i,0])
                    cube(size=[constructionFeetLength, 1,  0.5]);
                }
                
                 rotate([0,0,270])
                if (i == 3 || i == 7) {                
                    translate([constructionPosition-14,-constructionPosition - 0.5 + constructionSteps*i,0])
                    cube(size=[14, 3,  1]);
                } else {
                    translate([constructionPosition,-constructionPosition - 0.5 + constructionSteps*i,0])
                    cube(size=[constructionFeetLength, 1,  0.5]);
                }
            }
            
                // edges
//                translate([-getMotorWidth()/2-10,(getMotorHeight()/2+10),(mountHeight- wallStrength)/2 + wallStrength])
//                cube(size = [3,3,mountHeight - wallStrength], center= true);
//                
//                translate([-getMotorWidth()/2-10,-(getMotorHeight()/2+10),(mountHeight- wallStrength)/2 + wallStrength])
//                cube(size = [3,3,mountHeight - wallStrength], center= true);
//                
//                 translate([getMotorWidth()/2+10,-(getMotorHeight()/2+10),(mountHeight- wallStrength)/2 + wallStrength])
//                cube(size = [3,3,mountHeight - wallStrength], center= true);
//            
            
            
                
               
                // sites
                
                // no function               
                difference() {
                translate([-getMotorWidth()/2-7,0,mountHeight - 10])
                    cube(size = [10,getMotorWidth()+(wallStrength*2)+ 20 + 0.6,20], center= true);
            
                translate([-getMotorWidth()/2-6,0,mountHeight - 10 - 9])
                    rotate([0,45,0])
                    cube(size = [10,getMotorWidth()+(wallStrength*2)+ 20 + 0.6,10], center= true);
                }        
                
                // IR sensor
                rotate([0,0,90])
                difference() {
                translate([-getMotorWidth()/2-7,-5.15,mountHeight - 10])
                    cube(size = [10,getMotorWidth()+(wallStrength*2)+ 10.3,20], center= true);
            
                translate([-getMotorWidth()/2-6,-5.15,mountHeight - 10 - 9])
                    rotate([0,45,0])
                    cube(size = [10,getMotorWidth()+(wallStrength*2)+ 10.3,10], center= true);
                }                
               
                
                // motor cable
                difference() {
                translate([+getMotorWidth()/2+7,-7,mountHeight - 10])
                    cube(size = [10,25,20], center= true);
            
                translate([+getMotorWidth()/2+6,-7,mountHeight - 10 - 9])
                    rotate([0,45,0])
                    cube(size = [10,25,10], center= true);
                }
//                difference() {
//                translate([+getMotorWidth()/2+7,3,mountHeight - 5])
//                    cube(size = [10,25,10], center= true);
//            
//                translate([+getMotorWidth()/2+7,3,mountHeight - 3 - 9])
//                    rotate([0,45,0])
//                    cube(size = [10,25,10], center= true);
//                }
             
                difference() {
                translate([+getMotorWidth()/2+7,17,mountHeight - 3])
                    cube(size = [10,25,6], center= true);
            
                translate([+getMotorWidth()/2+8,17,mountHeight - 2.5 - 5])
                    rotate([0,45,0])
                    cube(size = [10,25,6], center= true);
                }
                
                // microbutton
                rotate([0,0,90])
                difference() {
                translate([+getMotorWidth()/2+7,0,mountHeight - 10])
                    cube(size = [10,getMotorWidth()+(wallStrength*2),20], center= true);
            
                translate([+getMotorWidth()/2+6,0,mountHeight - 10 - 9])
                    rotate([0,45,0])
                    cube(size = [10,getMotorWidth()+(wallStrength*2),10], center= true);
                }
                
                translate([getMotorWidth()/2 + wallStrength - 1,getMotorWidth()/2 - wallStrength - 1,wallStrength])
                cube([1,15,20*1.03]);
                
                
                
                // 10 pin side wall feet
                translate([getMotorWidth()/2 + wallStrength -2,getMotorWidth()/2 + 1 ,0])
                cube([2,11,wallStrength]);
                
             
                translate([getMotorWidth()/2 + wallStrength -1,getMotorWidth()/2  ,0])
                cube([11,2,wallStrength]);
            
        }
        
           
        
        
        
        translate([-getMotorWidth()/2-6,(getMotorHeight()/2+6),(mountHeight- wallStrength)/2 + wallStrength])
               cylinder(d=3.3,mountHeight - wallStrength, $fn=16);
        
         translate([-getMotorWidth()/2-6,(getMotorHeight()/2+6),(mountHeight) - wallStrength - 1])
               cylinder(d=6,h=wallStrength + 1, $fn=16);
        
        
        translate([-getMotorWidth()/2-6,-(getMotorHeight()/2+6),(mountHeight- wallStrength)/2 + wallStrength])
               cylinder(d=3.3,mountHeight - wallStrength, $fn=16);
        
         translate([-getMotorWidth()/2-6,-(getMotorHeight()/2+6),(mountHeight) - wallStrength - 1])
               cylinder(d=6,h=wallStrength + 1, $fn=16);
        
        translate([getMotorWidth()/2+6,-(getMotorHeight()/2+6),(mountHeight- wallStrength)/2 + wallStrength])
               cylinder(d=3.3,mountHeight - wallStrength, $fn=16);
        
         translate([getMotorWidth()/2+6,-(getMotorHeight()/2+6),(mountHeight) - wallStrength - 1])
               cylinder(d=6,h=wallStrength + 1, $fn=16);
        
        
        // connection screws
        for (i = [0:90:360]) {
            rotate([0,0,i])
                translate([12.95, 12.95, -5 ])
                {
                    cylinder(d=3, h=10, $fn=32);
                }
        }
        
        // motor cable hole
        translate([getMotorWidth()/2 + wallStrength - 0.2,0,1])
            difference() {
            rotate([45,0,0])
            cube(size = [2,15,15], center = true);
            translate([0,0,-10])
            cube(size = [2,21,21], center = true);
            }
        
        
        
         // 10 Pin Connector hole
            translate([getMotorWidth()/2 + wallStrength - 0.2,getMotorWidth()/2 - wallStrength - 0,wallStrength + 2])
                cube([9*1.05,20,20*1.03]);
            
        // microbutton hole
       
        translate([-2.65,(getMotorHeight()/2)  ,buttonHeight - 7]) 
            difference() {
                
                cube([getButtonWidth()*1.05,getButtonDepth()*1.05 + 3,getButtonLength()+getPinLength() + 20]);
                                        
                // pin foots
                translate([5,0,0])
                cube([3,getButtonDepth()*1.05+ 3,getPinLength()*0.80]);
                
                translate([13,0,0])
                cube([3,getButtonDepth()*1.05+ 3,getPinLength()*0.80]);
            }
            
       translate([-7,(getMotorHeight()/2) , buttonHeight +5])       
         cube([getButtonWidth()*1.05 ,getButtonDepth()*1.05 + 3,10]);
                
        // microbutton holes
        translate([getButtonWidth() - 7.1,(getMotorHeight()/2) + getButtonDepth(),buttonHeight ]) 
        rotate([90,0,0])
        cylinder(d=3.2,h=wallStrength*10, center= true, $fn=32);
        
        translate([getButtonWidth() - 17.1,(getMotorHeight()/2) + getButtonDepth(),buttonHeight]) 
        rotate([90,0,0])
        cylinder(d=3.2,h=wallStrength*10, center= true, $fn=32);
            
            
            
        // IR sensor
        translate([-(22*1.05)/2,-(getMotorHeight()/2) - 11,buttonHeight - 4]) 
        difference() {
            cube([22*1.05,11,getButtonLength()+getPinLength() + 0]);
            
            // pin foots
            translate([0,0,0])
            cube([7,11,1.5]);
            
        }
        
        translate([8.55,-(getMotorHeight()/2) - 11,buttonHeight - 11]) 
        cube([3,9,9]);
            
        translate([-8,-(getMotorHeight()/2) - 6,buttonHeight - 11]) 
        cylinder(d=3, h=20, $fn=16);
        
        translate([-12,-(getMotorHeight()/2) - 9,buttonHeight - 15]) 
        cube([6,6,8]);
        
        // driveshaft cable
        translate([-getMotorWidth()/2 - 2,0,mountHeight-1])
            rotate([0,-45,0])
            cube(size = [6,20,10], center = true);
        
       translate([-getMotorWidth()/2 - 9,0,mountHeight-8])
            rotate([0,45,0])
            cylinder(d=5, h=9, $fn=16);
        
         translate([-getMotorWidth()/2 - 7,0,mountHeight-12])
            cube(size = [3.5,7,8], center = true);
        
        rotate([0,0,180])
        translate([-getMotorWidth()/2 - 2,0,mountHeight-1])
            rotate([0,-45,0])
            cube(size = [6,20,10], center = true);
        rotate([0,0,180])
       translate([-getMotorWidth()/2 - 9,0,mountHeight-8])
            rotate([0,45,0])
            cylinder(d=5, h=9, $fn=16);
        rotate([0,0,180])
         translate([-getMotorWidth()/2 - 7,0,mountHeight-12])
            cube(size = [3.5,7,8], center = true);
    }
    
     
}




module mountPSM35BYG104_4()
{

mountHeight = getMotorDepth()+10;


difference()
{

    union()
    {

        difference() 
        {
            // torso
            translate([0,0,mountHeight/2])
            cube(size = [getMotorWidth()+(wallStrength*2),getMotorHeight()+(wallStrength*2),mountHeight], center= true);
            // motor hole
            translate([0,0,mountHeight+basePlateHeigth])
            cube(size = [getMotorWidth()*1.05,getMotorHeight()*1.05,mountHeight*2], center= true);
            
            // connection screws
            for (i = [0:90:360]) {
                rotate([0,0,i])
                    translate([12.95, 12.95, -5 ])
                    {
                        cylinder(d=3, h=10, $fn=32);
                    }
            }
            
//            // 6 Pin Connector hole
//            translate([getMotorWidth()/2 - 1,getMotorWidth()/2 - 6,1.5])
//                cube([9*1.05,20,15*1.05]);
//            
//            translate([getMotorWidth()/2 +2.5,-getMotorWidth()/2,1.5])
//                cube([6,getMotorWidth(),15*1.05]);
            
            // 10 Pin Connector hole
            translate([getMotorWidth()/2 - 1,getMotorWidth()/2 - 6,1.5])
                cube([9*1.05,20,20*1.05]);
            
            translate([getMotorWidth()/2 +2.5,-getMotorWidth()/2,1.5])
                cube([6,getMotorWidth(),15*1.05]);
            
            
            
            
            
            rotate([0,0,90])
            translate([getMotorWidth()/2 - 1,-getMotorWidth()/2 -6,1.5])
                cube([9*1.05,10,15*1.05]);
            
            rotate([0,0,90])
            translate([getMotorWidth()/2 +2.5,-getMotorWidth()/2,5.5])
                cube([6,getMotorWidth(),10*1.05]);
            
            
            
            
            
            // motor cable hole
            translate([getMotorWidth()/2,0,4])
                cube(size = [9,10,5], center = true);
            
            
            // microbutton hole
            translate([-(getButtonWidth()*1.02)/2,(getMotorHeight()/2),buttonHeight - 7]) 
                difference() {
                    cube([getButtonWidth()*1.02,getButtonDepth(),getButtonLength()+getPinLength() + 20]);
                    
                    // pin foots
                    translate([5,0,0])
                    cube([3,getButtonDepth(),getPinLength()*0.80]);
                    
                    translate([13,0,0])
                    cube([3,getButtonDepth(),getPinLength()*0.80]);
                }
                
                
            // ir sensor hole
            translate([-(22*1.05)/2,-(getMotorHeight()/2) -wallStrength + 0,buttonHeight - 5]) 
                difference() {
                    cube([22*1.05,10,getButtonLength()+getPinLength() + 20]);
                    
                    // pin foots
                    translate([0,0,0])
                    cube([5,getButtonDepth(),getPinLength()*0.80]);
                    
                }
            
        }

        translate([getMotorWidth()/2 +0.88 ,getMotorWidth()/2 - 7.5,1.5])
            cube([8,8,2]);
        
        translate([getMotorWidth()/2 +0.88 ,getMotorWidth()/2 - 7.5,21])
            cube([8.5,8,2]);

    }
        
}

}




module GP2Y0D805Z0F() {
    
    union() {
    
    difference() {
        cube([9,22,2]);
        translate([4.5,2,0])
            cylinder(d=3, h=2, $fn=32);
    }
        translate([1.5,5,0])
        cube([6,14,8]);
    
        translate([0,20,-2])
        cube([9,2,2]);
    
        translate([1.5,21,-10])
        cylinder(d=1, h=10);
    
         translate([4.5,21,-10])
        cylinder(d=1, h=10);
    
         translate([7.5,21,-10])
        cylinder(d=1, h=10);
    }
}


module connector10PinMale() {
    
    union() {
    
    difference() {
        cube([9,9,20.5]);
        
        translate([1,2,1])
        cube([7,7,18.5]);
    }
    
        translate([3,9,5])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
        translate([6,9,5])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
        translate([3,9,7.5])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
        translate([6,9,7.5])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
        translate([3,9,10])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
        translate([6,9,10])
        rotate([90,0,0])
        cylinder(d=1, h=12);
        
         translate([3,9,12.5])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
        translate([6,9,12.5])
        rotate([90,0,0])
        cylinder(d=1, h=12);
        
         translate([3,9,15])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
        translate([6,9,15])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
    }
}

module connector6PinMale() {
    
    union() {
    
    difference() {
        cube([9,9,15.5]);
        
        translate([1,2,1])
        cube([7,7,13.5]);
    }
    
        translate([3,9,5])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
        translate([6,9,5])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
        translate([3,9,7.5])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
        translate([6,9,7.5])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
        translate([3,9,10])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
        translate([6,9,10])
        rotate([90,0,0])
        cylinder(d=1, h=12);
    
    }
}


module mountPSM35BYG104_3()
{

difference()
{

    union()
    {

        difference() 
        {
            translate([ 0.00, 0.00, (getMotorDepth()/2) + basePlateHeigth])
            {
                // torso
                cube(size = [getMotorWidth()+wallStrength,getMotorHeight()+wallStrength,getMotorDepth()], center = true);
            }   
            // motor hole
            cube(size = [getMotorWidth()*1.05,getMotorHeight()*1.05,50], center = true);
        }



        // internal edge spaces
        for (i = [0:90:360]) {
            rotate([0,0,i])
            translate([(getMotorWidth()/2) - wallStrength/2,(getMotorWidth()/2) - wallStrength/2,basePlateHeigth])
            {
                rotate([0,0,0]) 
                cube(size = [wallStrength/1.1,wallStrength/1.1,edgeHeight]);
                   
                
            }
        }        
        
        // base plate
        translate([ 0.00, 0.00, basePlateHeigth/2 ])
        {
            cube(size = [getMotorWidth()+wallStrength,getMotorHeight()+wallStrength,basePlateHeigth], center = true);
        }
        
        
        // microbutton         
        translate([-(getMotorWidth()+wallStrength)/2, (getMotorHeight()/2) + 0.85, 0 ])
        {
            cube([getMotorWidth()+wallStrength,getButtonDepth() + wallStrength/2 - 1,getMotorDepth()+basePlateHeigth+getButtonLength() + 1]);
             
        }
        
        // spiral cable         
        translate([-(getMotorWidth()+wallStrength)/2, -(getMotorWidth()/2) - (getButtonDepth() + wallStrength/2 - 1) - 0.85, 0 ])
        {
            cube([getMotorWidth()+wallStrength,getButtonDepth() + wallStrength/2 - 1,getMotorDepth()+basePlateHeigth+getButtonLength() + 1]);
             
        }
        
    }


    // motor cable hole
    translate([ getMotorWidth()/2, 0.00, (getMotorDepth()/2) + basePlateHeigth + edgeHeight])
    {
        cube(size = [getMotorWidth()/3,getMotorHeight()/4,getMotorDepth()], center = true);
    }



    // connection screws
    for (i = [0:90:360]) {
        rotate([0,0,i])
            translate([12.95, 12.95, -5 ])
            {
                cylinder(d=3, h=10, $fn=32);
            }
    }
   
    // microbutton hole
    translate([-(getMotorWidth()+wallStrength)/2+getButtonWidth()/2.15 ,(getMotorHeight()/2),buttonHeight - 5]) 
        difference() {
            cube([getButtonWidth()*1.02,getButtonDepth(),getButtonLength()+getPinLength() + 20]);
            
            // pin foots
            translate([5,0,0])
            cube([3,getButtonDepth(),getPinLength()*0.80]);
            
            translate([13,0,0])
            cube([3,getButtonDepth(),getPinLength()*0.80]);
        }
        
        // microbutton cable holes
        translate([8,(getMotorHeight()/2) + wallStrength,buttonHeight - 4]) 
        rotate([90,0,0])
        cylinder(d=4,h=wallStrength*3, center= true, $fn=32);
        
        translate([0.3,(getMotorHeight()/2) + wallStrength,buttonHeight - 4]) 
        rotate([90,0,0])
        cylinder(d=4,h=wallStrength*3, center= true, $fn=32);
        
        translate([-7.7,(getMotorHeight()/2) + wallStrength,buttonHeight - 4]) 
        rotate([90,0,0])
        cylinder(d=4,h=wallStrength*3, center= true, $fn=32);
        
        
      
        // microbutton holes
        translate([5,(getMotorHeight()/2) + wallStrength,buttonHeight + 2]) 
        rotate([90,0,0])
        cylinder(d=3,h=wallStrength*3, center= true, $fn=32);
        
        translate([-5,(getMotorHeight()/2) + wallStrength,buttonHeight + 2]) 
        rotate([90,0,0])
        cylinder(d=3,h=wallStrength*3, center= true, $fn=32);
        
        // cable holes
        translate([4,-((getMotorHeight()/2) + wallStrength),buttonHeight + 2]) 
        rotate([90,0,0])
        cylinder(d=5,h=wallStrength*3, center= true, $fn=32);
        
        translate([-4,-((getMotorHeight()/2) + wallStrength),buttonHeight + 2]) 
        rotate([90,0,0])
        cylinder(d=5,h=wallStrength*3, center= true, $fn=32);
        
        translate([-12,-((getMotorHeight()/2) + wallStrength),buttonHeight + 2]) 
        rotate([90,0,0])
        cylinder(d=5,h=wallStrength*3, center= true, $fn=32);
        
        translate([12,-((getMotorHeight()/2) + wallStrength),buttonHeight + 2]) 
        rotate([90,0,0])
        cylinder(d=5,h=wallStrength*3, center= true, $fn=32);
        
}

}




module mountPSM35BYG104_2()
{

difference()
{

    union()
    {

        difference() 
        {
            translate([ 0.00, 0.00, (getMotorDepth()/2) + basePlateHeigth])
            {
                // torso
                cube(size = [getMotorWidth()+wallStrength,getMotorHeight()+wallStrength,getMotorDepth()], center = true);
            }   
            // motor hole
            cube(size = [getMotorWidth()*1.05,getMotorHeight()*1.05,50], center = true);
        }



        // internal edge spaces
        for (i = [0:90:360]) {
            rotate([0,0,i])
            translate([(getMotorWidth()/2) - wallStrength/2,(getMotorWidth()/2) - wallStrength/2,basePlateHeigth])
            {
                rotate([0,0,0]) 
                cube(size = [wallStrength/1.1,wallStrength/1.1,edgeHeight]);
                   
                
            }
        }        
        
        // base plate
        translate([ 0.00, 0.00, basePlateHeigth/2 ])
        {
            cube(size = [getMotorWidth()+wallStrength,getMotorHeight()+wallStrength,basePlateHeigth], center = true);
        }
        
        
        // microbutton         
        translate([-(getMotorWidth()+wallStrength)/2, (getMotorHeight()/2) + 0.8, 0 ])
        {
            cube([getMotorWidth()+wallStrength,getButtonDepth() + wallStrength/2 - 1,getMotorDepth()+basePlateHeigth+getButtonLength() + 1]);
             
        }
        
    }


    // motor cable hole
    translate([ getMotorWidth()/2, 0.00, (getMotorDepth()/2) + basePlateHeigth + edgeHeight])
    {
        cube(size = [getMotorWidth()/3,getMotorHeight()/4,getMotorDepth()], center = true);
    }



    // connection screws
    for (i = [0:90:360]) {
        rotate([0,0,i])
            translate([12.95, 12.95, -5 ])
            {
                cylinder(d=3, h=10, $fn=32);
            }
    }
   
    // microbutton hole
    translate([-(getMotorWidth()+wallStrength)/2+getButtonWidth()/2.1 ,(getMotorHeight()/2),buttonHeight - 5]) 
        difference() {
            cube([getButtonWidth()*1.05,getButtonDepth(),getButtonLength()+getPinLength()]);
            
            // pin foots
            translate([getButtonWidth()/5,0,0])
            cube([5,getButtonDepth(),getPinLength()*0.90]);
            
            translate([getButtonWidth()-(getButtonWidth()/5 ) - 4,0,0])
            cube([5,getButtonDepth(),getPinLength()*0.90]);
        }
        
        // microbutton cable holes
        translate([-getButtonWidth()/2.45,(getMotorHeight()/2) + wallStrength,buttonHeight - 4]) 
        rotate([90,0,0])
        cylinder(d=2,h=wallStrength*3, center= true, $fn=32);
        
        translate([0.5,(getMotorHeight()/2) + wallStrength,buttonHeight - 4]) 
        rotate([90,0,0])
        cylinder(d=2,h=wallStrength*3, center= true, $fn=32);
        
        translate([getButtonWidth()/2.45,(getMotorHeight()/2) + wallStrength,buttonHeight - 4]) 
        rotate([90,0,0])
        cylinder(d=2,h=wallStrength*3, center= true, $fn=32);
        
        
      
        
        translate([5,(getMotorHeight()/2) + wallStrength,buttonHeight + 2]) 
        rotate([90,0,0])
        cylinder(d=3,h=wallStrength*3, center= true, $fn=32);
        
        translate([-5,(getMotorHeight()/2) + wallStrength,buttonHeight + 2]) 
        rotate([90,0,0])
        cylinder(d=3,h=wallStrength*3, center= true, $fn=32);
        
}

}


module mountPSM35BYG104()
{

difference()
{

    union()
    {

        difference() 
        {
            translate([ 0.00, 0.00, (getMotorDepth()/2) + basePlateHeigth])
            {
                // torso
                cube(size = [getMotorWidth()+wallStrength,getMotorHeight()+wallStrength,getMotorDepth()], center = true);
            }   
            // motor hole
            cube(size = [getMotorWidth(),getMotorHeight(),50], center = true);
        }



        // internal edge spaces
        for (i = [45:90:360]) {
            rotate([0,0,i])
            translate([(getMotorWidth()/2 + wallStrength), 0, edgeHeight/2 +basePlateHeigth])
            {
                //rotate([0,0,i]) 
                    union() {
                        cube(size = [2,8.5,edgeHeight], center = true);
                        translate([ 1, 0, 0.00 ]) { cube(size = [4,4,edgeHeight], center = true); }
                    }
                
            }
        }        
        
        // base plate
        translate([ 0.00, 0.00, basePlateHeigth/2 ])
        {
            cube(size = [getMotorWidth()+wallStrength,getMotorHeight()+wallStrength,basePlateHeigth], center = true);
        }
    }


    // motor cable hole
    translate([ getMotorWidth()/2, 0.00, (getMotorDepth()/2) + basePlateHeigth + edgeHeight])
    {
        cube(size = [getMotorWidth()/3,getMotorHeight()/4,getMotorDepth()], center = true);
    }



    // connection screws
    for (i = [0:90:360]) {
        rotate([0,0,i])
            translate([12.95, 12.95, -5 ])
            {
                cylinder(d=3, h=10, $fn=32);
            }
    }
  
}

}


