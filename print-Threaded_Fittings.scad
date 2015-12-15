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

padding = 22;
top = 20;

//translate([0,0,-1]) color([0,1,0,0.1]) cube(size=[203,254,1], center= false);

//printThreadedFittings();

metricThreadModule(thread="M6");

module printThreadedFittings() {

	translate([top,padding,0]) {
		rotate([0,0,90])
		metricThreadModule(thread="M6");
	}

	translate([top,padding*2,0]) {
		rotate([0,0,90])
		metricThreadModule(thread="M10");
	}

	translate([top,padding*3,0]) {
		rotate([0,0,90])
		metricThreadModule(thread="M12");
	}

	translate([top,padding*4,0]) {
		rotate([0,0,90])
		metricThreadModule(thread="14");
	}



	translate([top,padding*5,0]) {
		rotate([0,0,90])
		squareThreadModule(thread="Sq11x2.5");
	}

	translate([top,padding*6,0]) {
		rotate([0,0,90])
		squareThreadModule(thread="Sq12x3");
	}

	translate([top,padding*7,0]) {
		rotate([0,0,90])
		squareThreadModule(thread="Sq14");
	}

	translate([top,padding*8,0]) {
		rotate([0,0,90])
		squareThreadModule(thread="Sq16");
	}




	translate([top + padding + 5,padding*1,0]) {
		rotate([0,0,90])
		trapezoidalThreadModule(thread="TR12");
	}

	translate([top + padding + 5,padding*2,0]) {
		rotate([0,0,90])
		trapezoidalThreadModule(thread="TR14x3.5");
	}

	translate([top + padding + 5,padding*3,0]) {
		rotate([0,0,90])
		trapezoidalThreadModule(thread="TR16");
	}

}

