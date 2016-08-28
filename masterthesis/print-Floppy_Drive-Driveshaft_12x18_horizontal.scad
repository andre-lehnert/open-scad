use<part-Floppy_Drive-Driveshaft_12x12.scad>

diameter = 12;
pitch = 18;
driveShaftTolerance = 0.1;
driveShaftInnerRadiusTolerance = 1.7;

threadHeight = 176;
couplingHeight = 9;
couplingDiameter = 24;
width = 20;
motorShaftHeight = 18;

constructionThickness = 0.6;

constructPlatformLength = threadHeight + couplingHeight;
constructPlatformWidth = width * 0.8;
constructPlatformHeight = 0.0;

union() {

    translate([0,2,couplingDiameter/2 + 2]) {
        rotate([-90,60,0]){
            color("blue")
            floppyDriveShaft(diameter = diameter, pitch = pitch, driveShaftTolerance = driveShaftTolerance, height = threadHeight, shaftCouplingHeight = couplingHeight, shaftCouplingDiameter = couplingDiameter, shaftHeight = motorShaftHeight, innerRadiusTolerance = driveShaftInnerRadiusTolerance);
        }
    }

    translate([-constructPlatformWidth/2,0,0]) {
        cube(size=[constructPlatformWidth, constructPlatformLength + 7, constructPlatformHeight]);
    }

    // Const. Driveshaft
    // 0.3 mm gap between elements (10mm - 9.7mm)
    for (a = [0 : 1 : (threadHeight-3.5 - 3)/10]) { // number of construction elements
        translate([-constructionThickness/2,couplingHeight + 3.5 + (10.3*a),constructPlatformHeight]) {
            cube(size=[constructionThickness, 9.55, couplingDiameter/2 - diameter/3]);
        }
        
        translate([-constructionThickness/2,couplingHeight + 3.5 + (10.3*a),constructPlatformHeight + couplingDiameter/2 - diameter/3 + 0.4 - 1]) {
            cube(size=[constructionThickness, 10.3, 1]);
        }
        
        translate([2.5 -constructionThickness/2,couplingHeight + 3.5 + (10.3*a),constructPlatformHeight]) {
            cube(size=[constructionThickness, 9.55, couplingDiameter/2 - diameter/3 + 0.4]);
        }
        
        translate([2.5 -constructionThickness/2,couplingHeight + 3.5 + (10.3*a),constructPlatformHeight + couplingDiameter/2 - diameter/3 + 0.4 - 1]) {
            cube(size=[constructionThickness, 10.3, 1]);
        }
        
        translate([-2.5 -constructionThickness/2,couplingHeight + 3.5 + (10.3*a),constructPlatformHeight]) {
            cube(size=[constructionThickness, 9.55, couplingDiameter/2 - diameter/3 + 0.4]);
        }
        
        translate([-2.5 -constructionThickness/2,couplingHeight + 3.5 + (10.3*a),constructPlatformHeight + couplingDiameter/2 - diameter/3 + 0.4 - 1]) {
            cube(size=[constructionThickness, 10.3, 1]);
        }
        
        constDriveshaftLength = 25;
        
        
        // last construction element with long baseplate arms
        if (a >= (threadHeight-3.5 - 3)/10 - 1) {
            for(b = [0 : 1 : 5]) {      
                if (b <= 3)
                translate([-2.5,couplingHeight + 3.5 + (10.3*a) + (2.84 * b),constructPlatformHeight]) {
                    cube(size=[5, 1, 2]);                
                }
                
                translate([-(60/2),couplingHeight + 3.5 + (10.3*a) + (2.84 * b),constructPlatformHeight]) {
                    cube(size=[60, 1, 0.5]);         
                }            
            }
            
            for(c = [0 : 1 : 6]) {  
                translate([-9 + 3*c - 0.5,couplingHeight + 3.5 + (10.3*a) + (2.83 * 1) - 14,constructPlatformHeight]) {
                    cube(size=[1, 45, 0.5]);         
                }            
            }
            
            for(c = [0 : 1 : 4]) {  
                translate([3*c - 0.5,couplingHeight + 3.5 + (10.3*a) + (2.83 * 1) - 5 + 3*c,constructPlatformHeight]) {
                    rotate([0,0,45])
                    cube(size=[1, 35, 0.5]);         
                }            
            }
            
            for(c = [0 : 1 : 4]) {  
                translate([-3*c -1, couplingHeight + 3.5 + (10.3*a) + (2.83 * 1) - 5 + 3*c,constructPlatformHeight]) {
                    rotate([0,0,-45])
                    cube(size=[1, 35, 0.5]);         
                }            
            }
            
        // default construction element
        } else {
            for(b = [0 : 1 : 3]) {        
                translate([-2.5,couplingHeight + 3.5 + (10.3*a) + (2.84 * b),constructPlatformHeight]) {
                    cube(size=[5, 1, 2]);                
                }
                if (b != 1 && b != 2)
                translate([-(constDriveshaftLength/2),couplingHeight + 3.5 + (10.3*a) + (2.84 * b),constructPlatformHeight]) {
                    cube(size=[constDriveshaftLength, 1, 0.5]);         
                }            
            }
        }
    }    

    
    // Const. Coupling
    constCouplingLength = couplingHeight + 2;
    
    // middle
    translate([-constructionThickness/2,0.55,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 2]);
    }
    translate([-constructionThickness/2,1 + constCouplingLength/2,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 2]);
    }

    translate([2-constructionThickness/2,0.55,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 2.15]);
    }
    translate([2-constructionThickness/2,1+constCouplingLength/2,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 2.15]);
    }

    translate([-2-constructionThickness/2,0.55,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 2.15]);
    }
    translate([-2-constructionThickness/2,1+constCouplingLength/2,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 2.15]);
    }

    translate([4-constructionThickness/2,0.55,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 2.6]);
    }
    translate([4-constructionThickness/2,1+constCouplingLength/2,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 2.6]);
    }
    
    translate([-4-constructionThickness/2,0.55,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 2.6]);
    }
    translate([-4-constructionThickness/2,1+constCouplingLength/2,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 2.6]);
    }
  
    translate([5.65,0.55,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 3.5]);
    }
    translate([5.65,1+constCouplingLength/2,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 3.5]);
    }

    translate([-6.2,0.55,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 3.5]);
    }
    translate([-6.2,1+constCouplingLength/2,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 3.5]);
    }
   
    // outer
    translate([9,0.55,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 6.2]);
    }
    translate([9,1+constCouplingLength/2,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 6.2]);
    }
  
    translate([-9.55,0.55,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 6.2]);
    }
    translate([-9.55,1+constCouplingLength/2,constructPlatformHeight]) {
        cube(size=[constructionThickness, constCouplingLength/2, 6.2]);
    }   
   
    // baseplate
    translate([-0.5,-couplingDiameter,constructPlatformHeight]) {
        cube(size=[1, couplingDiameter*2, 0.5]);
    }

    translate([2-0.5,-couplingDiameter,constructPlatformHeight]) {
        cube(size=[1, couplingDiameter*2, 0.5]);
    }

    translate([-2-0.5,-couplingDiameter,constructPlatformHeight]) {
        cube(size=[1, couplingDiameter*2, 0.5]);
    }
    
     translate([4-0.5,-couplingDiameter,constructPlatformHeight]) {
        cube(size=[1, couplingDiameter*2, 0.5]);
    }
    
    translate([-4-0.5,-couplingDiameter,constructPlatformHeight]) {
        cube(size=[1, couplingDiameter*2, 0.5]);
    }
  
    translate([5.65 - 0.2,-couplingDiameter,constructPlatformHeight]) {
        cube(size=[1, couplingDiameter*2, 0.5]);
    }

    translate([-6.2 - 0.2,-couplingDiameter,constructPlatformHeight]) {
        cube(size=[1, couplingDiameter*2, 0.5]);
    }
   
    translate([9 - 0.2,-couplingDiameter,constructPlatformHeight]) {
        cube(size=[1, couplingDiameter*2, 0.5]);
    }  
  
    translate([-9.55 - 0.2,-couplingDiameter,constructPlatformHeight]) {
        cube(size=[1, couplingDiameter*2, 0.5]);
    }

    for(i = [0 : 1 : 9]) {
        translate([-(couplingDiameter*2.5)/2,i*2 - 5.5,constructPlatformHeight]) {
                cube(size=[couplingDiameter*2.5, 1,  0.5]);
        }
    }
    
    for(i = [0 : 1 : 4]) {
        rotate([0,0,45])
        translate([-(couplingDiameter*1.2), 0 + i*3,constructPlatformHeight]) {
            
                cube(size=[couplingDiameter*1.2, 1,  0.5]);
        }
    }
    for(i = [0 : 1 : 4]) {
        rotate([0,0,135])
        translate([-(couplingDiameter*1.2), -1 - i*3,constructPlatformHeight]) {
            
                cube(size=[couplingDiameter*1.2, 1,  0.5]);
        }
    }
    
    
}