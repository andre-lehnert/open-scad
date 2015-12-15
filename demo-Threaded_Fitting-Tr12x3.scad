use <lib-Threads.scad> 

use <part-Threaded_Fitting.scad>

/*
"M6","M10","M12","14"
metricThreadModule(height=15, radius=12, thread="M12");

"TR12","TR14x3.5","TR16"
trapezoidalThreadModule(height=15, radius=12, thread="TR16");

"Sq11x2.5", "Sq12x3", "Sq14","Sq16"
squareThreadModule(height=15, radius=12, thread="Sq16");
*/
difference()
{
    scale([1.10,1.10,1.00]) trapezoidalThreadModule(thread="TR12");
    
    translate([-25,0,70])  cube(size=[50,50,150], center=true);
}

difference()
{
    translate([0,0,0]) trapezoidalThread("TR12",20);
    
    translate([-25,0,70]) rotate([0,0,10]) cube(size=[50,50,150], center=true);
}

