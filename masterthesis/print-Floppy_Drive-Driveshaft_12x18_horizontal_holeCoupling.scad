use<part-Floppy_Drive-Driveshaft_12xX-holeCoupling.scad>

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

    translate([0,10.3,driveshaftConstHeight+diameter/2]) {
        rotate([-90,90,0]){
            color("blue")
            floppyDriveShaft(diameter = diameter, pitch = pitch, driveShaftTolerance = driveShaftTolerance, height = threadHeight, shaftCouplingHeight = couplingHeight, shaftCouplingDiameter = couplingDiameter, shaftHeight = motorShaftHeight, innerRadiusTolerance = driveShaftInnerRadiusTolerance);
        }
    }

    translate([-constructPlatformWidth/2,0,0]) {
        cube(size=[constructPlatformWidth, constructPlatformLength + 7, constructPlatformHeight]);
    }

    // Const. Driveshaft
    // 0.3 mm gap between elements (10mm - 9.7mm)
    driveshaftConstHeight = 3;
    driveshaftConstLength = threadHeight+20;
    
    for (a = [0 : 1 : driveshaftConstLength/10]) { // number of construction elements (each 10mm)
        translate([-constructionThickness/2,(10.3*a),constructPlatformHeight]) {
            cube(size=[constructionThickness, 9.65, driveshaftConstHeight - 0.4]);
        }
        
        translate([-constructionThickness/2,(10.3*a),constructPlatformHeight + driveshaftConstHeight -0.4]) {
            cube(size=[constructionThickness, 10.3, 0.5]);
        }
        
        translate([2.5 -constructionThickness/2,(10.3*a),constructPlatformHeight]) {
            cube(size=[constructionThickness, 9.65, driveshaftConstHeight + 0.4]);
        }
        
        translate([2.5 -constructionThickness/2,(10.3*a),constructPlatformHeight + driveshaftConstHeight]) {
            cube(size=[constructionThickness, 10.3, 0.5]);
        }
        
        translate([-2.5 -constructionThickness/2,(10.3*a),constructPlatformHeight]) {
            cube(size=[constructionThickness, 9.65, driveshaftConstHeight + 0.4]);
        }
        
        translate([-2.5 -constructionThickness/2,(10.3*a),constructPlatformHeight + driveshaftConstHeight]) {
            cube(size=[constructionThickness, 10.3, 0.5]);
        }
        
        constDriveshaftLength = 25;
        
        
        
        // first construction element with long baseplate arms
        if (a == 0) {
            
            translate([0,10.3,0])
            rotate([0,0,180]) {
            
            for(b = [0 : 1 : 5]) {      
                if (b <= 3)
                translate([-2.5,(10.3*a) + (2.84 * b),constructPlatformHeight]) {
                    cube(size=[5, 1, 1.5]);                
                }
                
                translate([-(60/2),(10.3*a) + (2.84 * b),constructPlatformHeight]) {
                    cube(size=[60, 1, 0.5]);         
                }            
            }
            
            for(c = [0 : 1 : 6]) {  
                translate([-9 + 3*c - 0.5,(10.3*a) + (2.83 * 1) - 14,constructPlatformHeight]) {
                    cube(size=[1, 45, 0.5]);         
                }            
            }
            
            for(c = [0 : 1 : 2]) {  
                translate([3*c - 0.5,(10.3*a) + (2.83 * 1) - 5 + 3*c,constructPlatformHeight]) {
                    rotate([0,0,45])
                    cube(size=[1, 35, 0.5]);         
                }            
            }
            
            for(c = [0 : 1 : 2]) {  
                translate([-3*c -1,(10.3*a) + (2.83 * 1) - 5 + 3*c,constructPlatformHeight]) {
                    rotate([0,0,-45])
                    cube(size=[1, 35, 0.5]);         
                }            
            }
        
        
            }
        
        
        // last construction element with long baseplate arms
        } else if (a >= driveshaftConstLength/10 - 1) {
            for(b = [0 : 1 : 5]) {      
                if (b <= 3)
                translate([-2.5,(10.3*a) + (2.84 * b),constructPlatformHeight]) {
                    cube(size=[5, 1, 1.5]);                
                }
                
                translate([-(60/2),(10.3*a) + (2.84 * b),constructPlatformHeight]) {
                    cube(size=[60, 1, 0.5]);         
                }            
            }
            
            for(c = [0 : 1 : 6]) {  
                translate([-9 + 3*c - 0.5,(10.3*a) + (2.83 * 1) - 14,constructPlatformHeight]) {
                    cube(size=[1, 45, 0.5]);         
                }            
            }
            
            for(c = [0 : 1 : 2]) {  
                translate([3*c - 0.5,(10.3*a) + (2.83 * 1) - 5 + 3*c,constructPlatformHeight]) {
                    rotate([0,0,45])
                    cube(size=[1, 35, 0.5]);         
                }            
            }
            
            for(c = [0 : 1 : 2]) {  
                translate([-3*c -1,(10.3*a) + (2.83 * 1) - 5 + 3*c,constructPlatformHeight]) {
                    rotate([0,0,-45])
                    cube(size=[1, 35, 0.5]);         
                }            
            }
            
        // default construction element
        } else {
            for(b = [0 : 1 : 3]) {        
                translate([-2.5,(10.3*a) + (2.71 * b),constructPlatformHeight]) {
                    cube(size=[5, 1.5, 1]);                
                }
                if (b != 1 && b != 2)
                translate([-(constDriveshaftLength/2),(10.3*a) + (2.72 * b),constructPlatformHeight]) {
                    cube(size=[constDriveshaftLength, 1.5, 0.5]);         
                }            
            }
        }
    }        
}