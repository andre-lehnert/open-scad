
// Knobs are the circles on top of blocks
knob_diameter=4.8 + 0.13;
knob_height=2;
knob_spacing=8.0;

module lego (lenght=2, width=3, transX=0, transY=0, transZ=0) {
for (countY=[0:lenght-1])
    for (countX=[0:width-1]) {
        translate([countX*knob_spacing + (transX + knob_diameter/2),countY*knob_spacing + (transY+knob_diameter/2),transZ])
            cylinder(r=knob_diameter/2,h=knob_height,$fn=256);
    }
    
}




//union() {
//
//lego(3,3,-10.455555555,-10.455555555, 17);
//    
//cylinder(d=33, h=17, $fn=512);
//    
//}


union() {

lego(2,4,-14.5,-6.5, 17);
lego(4,2,-6.5,-14.5, 17);
    
cylinder(d=33, h=17, $fn=512);
    
}