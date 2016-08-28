use<part-Floppy_Drive-Driveshaft_12x12.scad>

threadHeight = 175;
couplingHeight = 10;
width = 20;

constructPlatformLength = threadHeight + couplingHeight;
constructPlatformWidth = width * 0.8;
constructPlatformHeight = 0.0;

union() {



    translate([0,2,10 + constructPlatformHeight + 1]) {
        rotate([-90,60,0]){
            floppyDriveShaft(height = threadHeight, shaftCouplingHeight = couplingHeight);
        }
    }

    translate([-constructPlatformWidth/2,0,0]) {
        cube(size=[constructPlatformWidth, constructPlatformLength + 7, constructPlatformHeight]);
    }


    // Const. Thread
    translate([-0.5,couplingHeight + 0.5 + 2,constructPlatformHeight]) {
        cube(size=[1, constructPlatformLength - couplingHeight, 4 + 1]);
    }

    constructThreadOuter = 4.9;

    translate([1.5,couplingHeight + 0.5 + 2,constructPlatformHeight]) {
        difference() {
            cube(size=[1, constructPlatformLength - couplingHeight, constructThreadOuter + 1]);
            translate([-0.3,0,constructThreadOuter +0.2 ]) rotate([0,-20,0]) cube(size=[2, constructPlatformLength - couplingHeight,2]);
            
        }
    }

    translate([-2.5,couplingHeight + 0.5 + 2,constructPlatformHeight]) {
        difference() {
            cube(size=[1, constructPlatformLength - couplingHeight, constructThreadOuter + 1]);
            translate([-0.3,0,constructThreadOuter +0.8 ]) rotate([0,20,0]) cube(size=[2, constructPlatformLength - couplingHeight,2]);
            
        }
    }
    
    for(i = [couplingHeight + 3 : 3 : constructPlatformLength + 2]) {
        translate([-2.5,i,constructPlatformHeight]) {
            cube(size=[5, 1, 4 + 1]);
        }
    }
    
 
    
    // Const. Coupling
    translate([-0.5,0 + 2,constructPlatformHeight]) {
        cube(size=[1, couplingHeight + 0.5, 1]);
    }

    translate([1.5,0 + 2,constructPlatformHeight]) {
        cube(size=[1, couplingHeight + 0.5, 1.5]);
    }

    translate([-2.5,0 + 2,constructPlatformHeight]) {
        cube(size=[1, couplingHeight + 0.5, 1.5]);
    }

    translate([3.5,0 + 2,constructPlatformHeight]) {
        cube(size=[1, couplingHeight + 0.5, 2]);
    }

    translate([-4.5,0 + 2,constructPlatformHeight]) {
        cube(size=[1, couplingHeight + 0.5, 2]);
    }
    
    translate([5.5,0 + 2,constructPlatformHeight]) {
        cube(size=[1, couplingHeight + 0.5, 3]);
    }

    translate([-6.5,0 + 2,constructPlatformHeight]) {
        cube(size=[1, couplingHeight + 0.5, 3]);
    }
    
    
    
    translate([-6,2,constructPlatformHeight]) {
            cube(size=[12, 1,  1]);
    }
    
    translate([-6,2 + ((couplingHeight -0.5) /2),constructPlatformHeight]) {
            cube(size=[12, 1,  1]);
    }
    
    translate([-6,2 + couplingHeight - 0.5,constructPlatformHeight]) {
            cube(size=[12, 1,  1]);
    }
}