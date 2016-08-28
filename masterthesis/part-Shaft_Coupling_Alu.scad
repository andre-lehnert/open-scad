
shaftCoupling5x10();

module shaftCoupling5x8 () {
    
    difference() {
        // coupling
        //  ______________
        // |              |
        // |              |
        // |              |
        // |              |
        // |              |
        // |______________|
        cylinder (d = 19, h = 25, $fn= 128);
        
        // shaft holes
        //  ___        ___
        // |   |      |   |
        // |   |      |   |
        // |   |_    _|   |
        // |     |  |     |
        // |     |  |     |
        // |_____|  |_____|
        translate([0,0, 25 - 17])
            cylinder (d = 8, h = 17, $fn= 128);
        
        cylinder (d = 5, h = 25 - 17, $fn= 128);
        
        
        // locking screws
        //  ___        ___
        // |   |      |   |
        // |   |     /|///| <--
        // |   |_    _|   |
        // |     |  |     |
        // |     | /|/////| <--
        // |_____|  |_____|
        translate([0,0,4])
        rotate([90,0,0])
        cylinder (d = 4, h = 19 - 8, $fn= 128);
        
        rotate([0,0,90])
        translate([0,0,4])
        rotate([90,0,0])
        cylinder (d = 4, h = 19 - 8, $fn= 128);
        
        translate([0,0,25-4])
        rotate([90,0,0])
        cylinder (d = 4, h = 19 - 8, $fn= 128);
        
        rotate([0,0,90])
        translate([0,0,25-4])
        rotate([90,0,0])
        cylinder (d = 4, h = 19 - 8, $fn= 128);
        
    }
}

module shaftCoupling5x10 () {
    
    difference() {
        // coupling
        //  ______________
        // |              |
        // |              |
        // |              |
        // |              |
        // |              |
        // |______________|
        cylinder (d = 19, h = 25, $fn= 128);
        
        // shaft holes
        //  ___        ___
        // |   |      |   |
        // |   |      |   |
        // |   |_    _|   |
        // |     |  |     |
        // |     |  |     |
        // |_____|  |_____|
        translate([0,0, 25 - 17])
            cylinder (d = 10, h = 17, $fn= 128);
        
        cylinder (d = 5, h = 25 - 17, $fn= 128);
        
        
        // locking screws
        //  ___        ___
        // |   |      |   |
        // |   |     /|///| <--
        // |   |_    _|   |
        // |     |  |     |
        // |     | /|/////| <--
        // |_____|  |_____|
        translate([0,0,4])
        rotate([90,0,0])
        cylinder (d = 4, h = 19 - 8, $fn= 128);
        
        rotate([0,0,90])
        translate([0,0,4])
        rotate([90,0,0])
        cylinder (d = 4, h = 19 - 8, $fn= 128);
        
        translate([0,0,25-4])
        rotate([90,0,0])
        cylinder (d = 4, h = 19 - 8, $fn= 128);
        
        rotate([0,0,90])
        translate([0,0,25-4])
        rotate([90,0,0])
        cylinder (d = 4, h = 19 - 8, $fn= 128);
        
    }
}