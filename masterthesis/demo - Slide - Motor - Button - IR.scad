use<part-Floppy_Drive_Slide.scad>
use<part-Motor_PSM35BYG104.scad>
use<part-Microbutton.scad>
use<part-Shaft_Coupling_Alu.scad>

translate([0,0,0])
PSM35BYG104();

translate([0,0,23])
shaftCoupling5x8();

translate([10,getMotorWidth()/2 - 7,30])
rotate([0,0,90])
microButton();

translate([0,0,20 + 29])
floppyDriveSlide_3();

// linear guide

linearGuideHeight = 225;

for (i = [0:90:360]) {
    rotate([0,0,i])
        translate([12.95,12.95,0]) {
            color("lightgrey")
            cylinder(r=1.5, h=linearGuideHeight, $fn=24);
        }    
}
