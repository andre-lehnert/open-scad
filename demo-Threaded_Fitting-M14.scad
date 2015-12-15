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
    scale([1.05,1.05,1.00]) metricThreadModule(thread="14");
    
    translate([-25,0,70])  cube(size=[50,50,150], center=true);
}

difference()
{
    translate([0,0,1.0]) metricThread("14",20);
    
    //translate([-25,0,70]) rotate([0,0,10]) cube(size=[50,50,150], center=true);
}
