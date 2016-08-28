
use<lib-Floppy_Drive_Thread.scad>
use<lib-Threads.scad>
use<part-Floppy_Drive_Slide.scad>
use<part-Plexiglass-Sockets.scad>
use<part-Motor_PSM35BYG104.scad>
use<part-Motor_Mount_PSM35BYG104.scad>
use<part-Floppy_Drive-Driveshaft_12x12.scad>
use<part-Plexiglass-Sockets.scad>
use<part-Microbutton.scad>


polygons = 24;

// 1)
// Motor
motorHeight = 3;

translate([0,0,motorHeight])
PSM35BYG104();

// 2)
// linear guide

linearGuideHeight = 225;

for (i = [0:90:360]) {
    rotate([0,0,i])
        translate([12.95,12.95,motorHeight]) {
            color("lightgrey")
            cylinder(r=1.5, h=linearGuideHeight, $fn=polygons);
        }    
}

// 3)

diameter = 12;
pitch = 24;
driveShaftTolerance = 0.1;
driveShaftInnerRadiusTolerance = 1.3;

threadHeight = 170;
couplingHeight = 10;
couplingDiameter = 24;
width = 20;
motorShaftHeight = 20;

floppyDriveHeight = getMotorDepth() + 2 + motorHeight;

translate([0,0,floppyDriveHeight]) {
    color("white")
floppyDriveShaft(diameter = diameter, pitch = pitch, driveShaftTolerance = driveShaftTolerance, height = threadHeight, shaftCouplingHeight = couplingHeight, shaftCouplingDiameter = couplingDiameter, shaftHeight = motorShaftHeight, innerRadiusTolerance = driveShaftInnerRadiusTolerance);
}


// 4)
// Slide
slideHeight = floppyDriveHeight + couplingHeight + 2;

translate([0,0,slideHeight]) {
    color("green")
    floppyDriveSlide_2();
}


// 5)
// PlexiglasSockets
socketDistance = 53;
socket1Height = slideHeight + socketDistance;
socket2Height = socket1Height + socketDistance;
socket3Height = socket2Height + socketDistance;

translate([0,0,socket1Height]) {
    rotate([180,0,90])
        color("green")
        plexiglasLayerSockets_2();
} 
    
translate([0,0,socket2Height]) {
    rotate([180,0,90])
        color("green")
        plexiglasLayerSockets_2();
} 

translate([0,0,socket3Height]) {
    rotate([180,0,90])
        color("green")
        plexiglasLayerSockets_2();
} 
    
// 6)
// LED Strips
stripLength = 168;
stripHeigth = slideHeight + 8;

for (i = [0:90:360]) {
    rotate([0,0,i])
        translate([10,-11/2,stripHeigth]) {
            color([0.8,0.0,0.8,0.5])
            rotate([0,0,90])
            cube([11,2,170]);
        }    
}


// 7) 
// plexiglas
glasLength = 180;
glasHeigth = slideHeight + 6;

for (i = [0:90:360]) {
    rotate([0,0,i])
        translate([16,-20/2,glasHeigth]) {
            color([0.9,0.9,0.9,0.5])
            rotate([0,0,90])
            cube([20,2,170]);
        }    
} 

// 8)
// stop button

buttonHeight = getMotorDepth() + motorHeight;




translate([10 ,getMotorWidth()/2,buttonHeight - 5]) {
    rotate([0,0,90])
    microButton();
} 



// 9)
// motor mount
color([0.0,0.0,0.8,0.5])
mountPSM35BYG104_3();
    