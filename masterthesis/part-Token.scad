use<lib-Floppy_Drive_Thread.scad>
use<lib-Threads.scad>
use<part-Plexiglass-Sockets.scad>

cylinderResolution = 128;


//tokenCategory();

barHeader_1();

translate([-34/2,-34/2, -20])
cube([34,34,10]); 

module barHeader_1
(
    // Slide
    height = 11,
    width = 34,
   
    bearingWidth=3,
    bearingTolerance=0.20
)
{
    length = height;
    
    union() {
    
    difference() {
    
        union() {    
            difference() {
                
            widthPlexi = width + 6;
                
            translate([-widthPlexi/2,-widthPlexi/2])        
                // Torso
                cube([widthPlexi,widthPlexi,height]);  
                
                cylinder(d=34, h=20, $fn=128);
            }
                tokenReader_2();
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
        union() {
        if (false) {
            translate([0,0,0])
                for (i = [45 : 90 : 360]) {
                    rotate([0,0,i]) 
                        translate([-(width+15)/2 ,-5,-0.01])
                        rotate([0,0,90])
                        cube([10, 10, height*10]);
                }
        }
        
        // Plexiglas border
        if (true) {
            translate([0,0,0])
                for (i = [0 : 90 : 360]) {
                    rotate([0,0,i]) 
                        translate([-(width+6.2)/2 ,-(40/2),-3])                      
                        cube([2.8, 40, height]);
                }
            
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

            translate([-width/2,-width/2,-0.01]) {
            translate([bearingWidth + 1,bearingWidth + 1,0]) {               
             cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=10, $fn=32);
//             translate([0,0,height - 4])   
//             cylinder(r=3.5, h=height, $fn=32);
//                rotate([0,0,45]) 
//             translate([-3,-3,height+0.01])
//               
//             cube([6,6,3]);
            }
            translate([width-bearingWidth - 1,bearingWidth + 1,0]) {               
             cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=10, $fn=32);
//                translate([0,0,height - 4])   
//             cylinder(r=3.5, h=height, $fn=32);
//                rotate([0,0,45]) 
//             translate([-3,-3,height+0.01])
//               
//             cube([6,6,3]);
            }
            translate([width-bearingWidth-1,width-bearingWidth -1,0]) {               
             cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=10, $fn=32);
//                translate([0,0,height - 4])   
//             cylinder(r=3.5, h=height, $fn=32);
//                rotate([0,0,45]) 
//             translate([-3,-3,height+0.01])
//               
//             cube([6,6,3]);
            }
            translate([bearingWidth + 1,width-bearingWidth-1,0])   {             
             cylinder(r=(bearingWidth/2) * (1 + bearingTolerance), h=10, $fn=32);
//                translate([0,0,height - 4])   
//             cylinder(r=3.5, h=height, $fn=32);
//                rotate([0,0,45]) 
//             translate([-3,-3,height+0.01])
//               
//             cube([6,6,3]);
            }
            }          

        }

    }


     // structure
    if (true) {
        
        // magnet
        rotate([0,0,90])
        intersection() {
            
            cylinder(d=15.3, h=3.1, $fn=128);
            
            union() {
                translate([0,0,50]) {
                    for (i = [0 : 2 : 30]) {
                        translate([i,0,0])
                        cube([0.7,100,100], center=true);
                        
                        translate([-i,0,0])
                        cube([0.7,100,100], center=true);
                    }
                }
                
                translate([0,0,0.5]) {
                    for (i = [0 : 4 : 30]) {
                        translate([0,i,0])
                        cube([100,1,1], center=true);
                        
                        translate([0,-i,0])
                        cube([100,1,1], center=true);
                    }
                }
            }
        }
        
        // plexiglas border
        intersection() {
            
             translate([0,0,0])
                for (i = [90 : 180 : 360]) {
                    rotate([0,0,i]) 
                        translate([-(width+6.4)/2 ,-(40/2),-3])                      
                        cube([2.3, 40, height]);
                }
            
            union() {
                translate([0,0,50]) {
                    for (i = [0 : 3 : 30]) {
                        translate([i,0,0])
                        cube([0.7,100,100], center=true);
                        
                        translate([-i,0,0])
                        cube([0.7,100,100], center=true);
                    }
                }
                
                translate([0,0,2]) {
                    for (i = [0 : 2 : 30]) {
                        translate([0,i,0])
                        cube([100,0.7,4], center=true);
                        
                        translate([0,-i,0])
                        cube([100,0.7,4], center=true);
                    }
                }
            }
        }
        rotate([0,0,90])
        intersection() {
            
             translate([0,0,0])
                for (i = [90 : 180 : 360]) {
                    rotate([0,0,i]) 
                        translate([-(width+6.4)/2 ,-(40/2),-3])                      
                        cube([2.3, 40, height]);
                }
            
            union() {
                translate([0,0,50]) {
                    for (i = [0 : 3 : 30]) {
                        translate([i,0,0])
                        cube([0.7,100,100], center=true);
                        
                        translate([-i,0,0])
                        cube([0.7,100,100], center=true);
                    }
                }
                
                translate([0,0,2]) {
                    for (i = [0 : 2 : 30]) {
                        translate([0,i,0])
                        cube([100,0.7,4], center=true);
                        
                        translate([0,-i,0])
                        cube([100,0.7,4], center=true);
                    }
                }
            }
        }
    }

} 
        

}

module tokenReader_2(
    
) {
   he = 4;
    additionalHeight = 5;
   difference() {
    
   union() {       
     
       cylinder(d=34, h=he, $fn=128);
       
       translate([0,0,he]) {           
       
       // center
       cylinder(d=13.7, h=2+additionalHeight, $fn=128);
       
       // between Ring 1 and 2
       difference() {
        cylinder(d=24.7,h=2+additionalHeight, $fn=128); 
        cylinder(d=21,h=2+additionalHeight, $fn=128); 
       } 

        // between Ring 2 and 3
       difference() {
        cylinder(d=37,h=2+additionalHeight, $fn=128); 
        cylinder(d=33.3,h=2+additionalHeight, $fn=128); 
       }        
       
        }
        
        difference() {
        cylinder(d=20.5,h=he+0.5, $fn=128); 
        cylinder(d=14,h=he+0.5, $fn=128); 
       } 
   }

   translate([0,0,1])
   intersection() {
       difference() {
        cylinder(d=33.3,h=he+1+additionalHeight, $fn=128); 
        cylinder(d=26,h=he+1+additionalHeight, $fn=128);         
       }    
       cube([33.3,33.3,he+1+additionalHeight]);
   }  
  
   intersection() {
       difference() {
        cylinder(d=33.3,h=he+1+additionalHeight, $fn=128); 
        cylinder(d=26,h=he+1+additionalHeight, $fn=128);        
       }      
       cube([100,5,he+1+additionalHeight]);
   }
   
   
   translate([0,0,1])
   intersection() {
       difference() {
        cylinder(d=20.5,h=he+1+additionalHeight, $fn=128); 
        cylinder(d=16.7,h=he+1+additionalHeight, $fn=128); 
       } 
       cube([20.5,20.5,he+1+additionalHeight]);
   }
   
   intersection() {
       difference() {
        cylinder(d=20.5,h=he+1+additionalHeight, $fn=128); 
        cylinder(d=16.7,h=he+1+additionalHeight, $fn=128); 
       } 
       cube([100,5,he+1+additionalHeight]);
   }
   
   
   
   
   cylinder(d=16.7, h=3, $fn=128);
   
   }
}



module tokenReader(
    
) {
   he = 4;
    additionalHeight = 5;
   difference() {
    
   union() {       
     
       cylinder(d=34.5, h=he, $fn=128);
       
       translate([0,0,he]) {           
       
       // center
       cylinder(d=14, h=2+additionalHeight, $fn=128);
       
       // between Ring 1 and 2
       difference() {
        cylinder(d=26,h=2+additionalHeight, $fn=128); 
        cylinder(d=20.5,h=2+additionalHeight, $fn=128); 
       } 

        // between Ring 2 and 3
       difference() {
        cylinder(d=34.5,h=2+additionalHeight, $fn=128); 
        cylinder(d=32.3,h=2+additionalHeight, $fn=128); 
       }        
       
        }
        
        difference() {
        cylinder(d=20.5,h=he+0.5, $fn=128); 
        cylinder(d=14,h=he+0.5, $fn=128); 
       } 
   }

   translate([0,0,1])
   intersection() {
       difference() {
        cylinder(d=32.3,h=he+1+additionalHeight, $fn=128); 
        cylinder(d=26,h=he+1+additionalHeight, $fn=128);         
       }    
       cube([32.3,32.3,he+1+additionalHeight]);
   }  
  
   intersection() {
       difference() {
        cylinder(d=32.3,h=he+1+additionalHeight, $fn=128); 
        cylinder(d=26,h=he+1+additionalHeight, $fn=128);        
       }      
       cube([100,5,he+1+additionalHeight]);
   }
   
   
   translate([0,0,1])
   intersection() {
       difference() {
        cylinder(d=20.5,h=he+1+additionalHeight, $fn=128); 
        cylinder(d=16.7,h=he+1+additionalHeight, $fn=128); 
       } 
       cube([20.5,20.5,he+1+additionalHeight]);
   }
   
   intersection() {
       difference() {
        cylinder(d=20.5,h=he+1+additionalHeight, $fn=128); 
        cylinder(d=16.7,h=he+1+additionalHeight, $fn=128); 
       } 
       cube([100,5,he+1+additionalHeight]);
   }
   
   
   
   
   cylinder(d=15.3, h=3, $fn=128);
   
   }
}


module tokenFemale(
    width = 34,
    height = 12
) {
   he = 4;
    additionalHeight = 5;
   difference() {
    
   union() {       
     
       cylinder(d=34, h=he, $fn=128);
       
       translate([0,0,he]) {           
       
       // center
       cylinder(d=14, h=2+additionalHeight, $fn=128);
       
       // between Ring 1 and 2
       difference() {
        cylinder(d=26,h=2+additionalHeight, $fn=128); 
        cylinder(d=20.5,h=2+additionalHeight, $fn=128); 
       } 

        // between Ring 2 and 3
       difference() {
        cylinder(d=34,h=2+additionalHeight, $fn=128); 
        cylinder(d=32.3,h=2+additionalHeight, $fn=128); 
       }        
       
        }
        
        difference() {
        cylinder(d=20.5,h=he+0.5, $fn=128); 
        cylinder(d=14,h=he+0.5, $fn=128); 
       } 
   }

   translate([0,0,1])
   intersection() {
       difference() {
        cylinder(d=32.3,h=he+1+additionalHeight, $fn=128); 
        cylinder(d=26,h=he+1+additionalHeight, $fn=128);         
       }    
       cube([32.3,32.3,he+1+additionalHeight]);
   }  
  
   intersection() {
       difference() {
        cylinder(d=32.3,h=he+1+additionalHeight, $fn=128); 
        cylinder(d=26,h=he+1+additionalHeight, $fn=128);        
       }      
       cube([100,5,he+1+additionalHeight]);
   }
   
   
   translate([0,0,1])
   intersection() {
       difference() {
        cylinder(d=20.5,h=he+1+additionalHeight, $fn=128); 
        cylinder(d=16.7,h=he+1+additionalHeight, $fn=128); 
       } 
       cube([20.5,20.5,he+1+additionalHeight]);
   }
   
   intersection() {
       difference() {
        cylinder(d=20.5,h=he+1+additionalHeight, $fn=128); 
        cylinder(d=16.7,h=he+1+additionalHeight, $fn=128); 
       } 
       cube([100,5,he+1+additionalHeight]);
   }
   
   
   
   
   cylinder(d=15.3, h=3, $fn=128);
   
   }
}


module tokenCategory
(
    width = 34,
    height = 12,
    ringWidth = 30.5
) {
    
    
    difference() {
        
        union() {
            translate([0,0,height*0.2])
                cylinder(r=width/2, h=height*0.8, $fn=cylinderResolution);
        
            cylinder(r1=width/2.2, r2=width/2, h=height*0.2, $fn=cylinderResolution);
        }
        // ring
        cylinder(r=ringWidth/2, h=height, $fn=cylinderResolution);
        
        // 
        translate([0,0, height - height*0.2])
            cylinder(r1=width/2.25, r2=width/2, h=height*0.2, $fn=cylinderResolution);
    }
    
    
    
     
}

//tokenCategory_2();

module tokenCategory_2
(
    width = 34,
    height = 8,
    ringWidth = 30.7
) {
    
    union() {
    
        difference() {
            
            union() {
                // full ring
                cylinder(r=width/2, h=height*1.0, $fn=cylinderResolution);
                
                // male
                //translate([0,0,height*0.1])
                //    cylinder(r=width/2, h=height*0.9, $fn=cylinderResolution);                
                //cylinder(r1=width/2.1, r2=width/2, h=height*0.1, $fn=cylinderResolution);
            }
            // hole
            cylinder(r=ringWidth/2, h=height, $fn=cylinderResolution);
            
            // female
            translate([0,0, height - height*0.1])
                cylinder(r1=width/2.25, r2=width/2.1, h=height*0.1, $fn=cylinderResolution);
        }
        
        maleHeight = 1;
        
        structureHeight = 2;
        
        innerRing = 7.7;
        
        gndRingMinWidth = 9.2;
        gndRingMaxWidth = 11;
        
        dsRingMinWidth = 12.5;
        dsRingMaxWidth = 13.8;
        
        // X connection
        for (i = [0:90:90]) {
            rotate([0,0,i])
            translate([-ringWidth/2,-1,0])
                cube([ringWidth, 2, maleHeight]);
        }
        
       // 1)
       // 16 mm
       magnetSpacer(
            maxWidth = innerRing,
            thickness = 0.0,
            height = 1
        );
        
        //2)
        // GND
        // 16 - 18 mm       
        
        //
        ringSpacer(
            minWidth = gndRingMinWidth,
            maxWidth = gndRingMaxWidth,
            thickness = 0.0,
            height = 1
        );   
        
        // DS2401 ring
        // 22 - 24 mm
        
        //
        ringSpacer(
            minWidth = dsRingMinWidth,
            maxWidth = dsRingMaxWidth,
            thickness = 0.0,
            height = 1
        );
        
        
        // structure A
//        translate([0,0,maleHeight+structureHeight]) {            
//            for(i = [0:90:360]) {
//                rotate([0,0,i]) {
//                    
//                    translate([dsRingMinWidth,-1,0])
//                        cube([dsRingMaxWidth-dsRingMinWidth, 2, structureHeight]);
//                    
//                    translate([gndRingMinWidth,-1,0])
//                        cube([gndRingMaxWidth-gndRingMinWidth, 2, structureHeight]);
//                }
//            }
//        }
        
        // structure B
        translate([0,0,maleHeight]) { 
            
            cylinder(r=innerRing,h=structureHeight/2, $fn=cylinderResolution);
            
            difference() {
                cylinder(r=dsRingMaxWidth,h=structureHeight, $fn=cylinderResolution);
                
                cylinder(r=dsRingMinWidth,h=structureHeight, $fn=cylinderResolution);
            }
            difference() {
                cylinder(r=gndRingMaxWidth,h=structureHeight, $fn=cylinderResolution);
                
                cylinder(r=gndRingMinWidth,h=structureHeight, $fn=cylinderResolution);
            }
            
        }
        
    }
    
     
}

module magnetSpacer
(
    maxWidth = 7.7,
    thickness = 0.7,
    height = 1
) {
    cylinder(r2=maxWidth, r1=maxWidth - thickness,h=height, $fn=cylinderResolution);
}


module ringSpacer
(
    minWidth = 9.2,
    maxWidth = 10.5,
    thickness = 0.7,
    height = 1
) {
     union() {
        
            difference() {
                cylinder(r2=(minWidth+maxWidth)/2, r1=(minWidth+maxWidth)/2,h=height, $fn=cylinderResolution);
                
                cylinder(r2=minWidth, r1=minWidth + thickness,h=height, $fn=cylinderResolution);
            }
           
            difference() {
                cylinder(r2=maxWidth, r1=maxWidth - thickness,h=height, $fn=cylinderResolution);
                
                cylinder(r2=(minWidth+maxWidth)/2, r1=(minWidth+maxWidth)/2,h=height, $fn=cylinderResolution);
            }
        }      
}