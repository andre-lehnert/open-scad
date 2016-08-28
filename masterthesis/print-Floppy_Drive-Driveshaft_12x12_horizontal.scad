use<part-Floppy_Drive-Driveshaft_12x12.scad>

threadHeight = 177;
couplingHeight = 8;
width = 20;
motorShaftHeight = 21;

constructionThickness = 0.6;

constructPlatformLength = threadHeight + couplingHeight;
constructPlatformWidth = width * 0.8;
constructPlatformHeight = 0.0;

union() {

    translate([0,2,10 + constructPlatformHeight + 1 + 1]) {
        rotate([-90,60,0]){
            color("blue")
            floppyDriveShaft(height = threadHeight, shaftCouplingHeight = couplingHeight, shaftHeight = motorShaftHeight);
        }
    }

    translate([-constructPlatformWidth/2,0,0]) {
        cube(size=[constructPlatformWidth, constructPlatformLength + 7, constructPlatformHeight]);
    }

    for (a = [0 : 1 : (threadHeight-3.5)/10]) {
        translate([-constructionThickness/2,couplingHeight + 3.5 + (10.3*a),constructPlatformHeight]) {
            cube(size=[constructionThickness, 11, 6]);
        }
        
        translate([2.5 -constructionThickness/2,couplingHeight + 3.5 + (10.3*a),constructPlatformHeight]) {
            cube(size=[constructionThickness, 10, 6 + 0.4]);
        }
        
        translate([-2.5 -constructionThickness/2,couplingHeight + 3.5 + (10.3*a),constructPlatformHeight]) {
            cube(size=[constructionThickness, 10, 6 + 0.4]);
        }
        
        for(b = [0 : 1 : 3]) {        
            translate([-2.5,couplingHeight + 3.5 + (10.3*a) + (3 * b),constructPlatformHeight]) {
                cube(size=[5, 1, 2]);                
            }
            if (b != 1 && b != 2)
            translate([-9,couplingHeight + 3.5 + (10.3*a) + (3 * b),constructPlatformHeight]) {
                cube(size=[18, 1, 0.5]);         
            }            
        }
    }    

    
    // Const. Coupling
    translate([-constructionThickness/2,0 + 0,constructPlatformHeight]) {
        cube(size=[constructionThickness, couplingHeight + 3 + 1, 2]);
    }

    translate([2-constructionThickness/2,0 + 0,constructPlatformHeight]) {
        cube(size=[constructionThickness, couplingHeight + 3, 2.15]);
    }

    translate([-2-constructionThickness/2,0 + 0,constructPlatformHeight]) {
        cube(size=[constructionThickness, couplingHeight + 3, 2.15]);
    }
  
    translate([5.65,0 + 0,constructPlatformHeight]) {
        cube(size=[constructionThickness, couplingHeight + 3, 3.72]);
    }

    translate([-6.2,0 + 0,constructPlatformHeight]) {
        cube(size=[constructionThickness, couplingHeight + 3, 3.72]);
    } 

    for(i = [0 : 1 : 5]) {
        translate([-11,i*2,constructPlatformHeight]) {
                cube(size=[22, 1,  0.7]);
        }
    }
    
}