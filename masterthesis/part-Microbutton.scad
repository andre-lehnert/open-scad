microButton();

_buttonLength = 10;
_buttonWidth = 20;
_buttonDepth = 6.5;
_pinLength = 4;
_pinWidth = 0.8;
_pinDepth = 3.5;

// ---------------------------------------------------------------------------------

function getButtonLength() = _buttonLength;
function getButtonWidth() = _buttonWidth;
function getButtonDepth() = _buttonDepth;

function getPinLength() = _pinLength;

// ---------------------------------------------------------------------------------


module microButton(
    buttonLength = 10,
    buttonWidth = 20,
    buttonDepth = 6.5,
    pinLength = 4,
    pinWidth = 0.8,
    pinDepth = 3.5,
    polygons = 32
) {
    union() {    
        translate([0,0,pinLength])
        color("blue")
        difference() {
            cube([buttonDepth,buttonWidth,buttonLength]);
            
            translate([-1,5,3])
            rotate([0,90,0])
            cylinder(d=2.8 ,h=buttonDepth+5, $fn=polygons);
            
            translate([-1,buttonWidth-5,3])
            rotate([0,90,0])
            cylinder(d=2.8 ,h=buttonDepth+5, $fn=polygons);
        }
        // 3 pins
        translate([(buttonDepth-pinDepth)/2,1+pinWidth/2,0])
        color("darkgrey")
        difference() {
            cube([pinDepth,pinWidth,pinLength]);
            translate([pinDepth/2,-0.1,1])
            rotate([0,90,90])
            cylinder(d=1.5 ,h=pinWidth+0.2, $fn=polygons);
        }
        translate([(buttonDepth-pinDepth)/2,buttonWidth/2 - pinWidth/2,0])
        color("darkgrey")
        difference() {
            cube([pinDepth,pinWidth,pinLength]);
            translate([pinDepth/2,-0.1,1])
            rotate([0,90,90])
            cylinder(d=1.5 ,h=pinWidth+0.2, $fn=polygons);
        }
        
        translate([(buttonDepth-pinDepth)/2,buttonWidth-(2+pinWidth/2),0])
        color("darkgrey")
        difference() {
            cube([pinDepth,pinWidth,pinLength]);
            translate([pinDepth/2,-0.1,1])
            rotate([0,90,90])
            cylinder(d=1.5 ,h=pinWidth+0.2, $fn=polygons);
        }
        
        // aktuator
        translate([0,3,buttonLength+pinLength])
        color("grey")
        rotate([8,0,0])
        cube([buttonDepth,18,0.5]);
    }
}