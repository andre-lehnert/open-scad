
union() {
    
    translate([-33/2,-33/2,0])
    cube([33,33,17]);
    
    rotate([0,0,45])
    translate([0,0,17])
    cylinder(d1=46.6, d2=0, h=18, $fn=4);

}

translate([40,0,0])
union() {
    
    
    cylinder(d=33, h=17, $fn=512);
    
    intersection() {
    rotate([0,0,45])
    translate([0,0,17])
    cylinder(d1=46.6, d2=0, h=18, $fn=4);
        
     cylinder(d=33, h=40, $fn=512);   
    }
}



