
// Knobs are the circles on top of blocks
knob_diameter=4.8 + 0.13;
knob_height=2;
knob_spacing=8.0;

// Pins are small cylinders inside blocks with width or length of 1 (visible from the bottom)
pin_diameter=3;


module lego (lenght=2, width=3, transX=0, transY=0, transZ=0) {
for (countY=[0:lenght-1])
    for (countX=[0:width-1]) {
        translate([countX*knob_spacing + (transX + knob_diameter/2),countY*knob_spacing + (transY+knob_diameter/2),transZ])
            cylinder(r=knob_diameter/2,h=knob_height,$fn=256);
    }
    
}




union() {

lego(2,2,1.5,1.5,1.5);
    
cube([16,16,1.5]);
    
}