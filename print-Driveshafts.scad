use<param-driveshaft.scad>

use<lib-Threads.scad>

use<part-Shaft_Coupling_with_3_Nuts.scad>

/*
"M6","M10","M12","14"
metricThread(previewM[i],height, debug= fastPreview); 

"TR12","TR14x3.5","TR16"
trapezoidalThread(previewTr[i],height,  debug= fastPreview); 

"Sq11x2.5", "Sq12x3", "Sq14","Sq16"
squareThread(previewSq[i],height, debug= fastPreview); 

*/


padding = 19;

printDriveshafts();

module printDriveshafts() {

	//translate([0,0,-1]) color([0,1,0,0.1]) cube(size=[203,254,1], center= false);

	translate([0,padding,0]) {
	printMetricDriveShaft("M6");
	}

	rotate([0,0,180]) 
	translate([-getTotalHeight(),-padding*2,0]) {
		printMetricDriveShaft("M10");
	}


	translate([0,padding*3,0]) {
		printMetricDriveShaft("M12");
	}

	rotate([0,0,180]) 
	translate([-getTotalHeight(),-padding*4,0]) {
		printMetricDriveShaft("14");
	}
	// "Sq11x2.5", "Sq12x3", "Sq14","Sq16"
	translate([0,padding*5,0]) {
		printSquareDriveShaft("Sq11x2.5");
	}

	rotate([0,0,180]) 
	translate([-getTotalHeight(),-padding*6,0]) {
		printSquareDriveShaft("Sq12x3");
	}

	translate([0,padding*7,0]) {
		printSquareDriveShaft("Sq14");
	}

	rotate([0,0,180]) 
	translate([-getTotalHeight(),-padding*8,0]) {
		printSquareDriveShaft("Sq16");
	}

	// "TR12","TR14x3.5","TR16"
	translate([0,padding*9,0]) {
		printTrapezoidalDriveShaft("TR12");
	}

	rotate([0,0,180]) 
	translate([-getTotalHeight(),-padding*10,0]) {
		printTrapezoidalDriveShaft("TR14x3.5");
	}

	translate([0,padding*11.2,0]) {
		printTrapezoidalDriveShaft("TR16");
	}

}

// -------------------------------------------------------------------

module printMetricDriveShaft(name="M6") {

	translate([0,0,getShaftCouplingDiameter()/2 + 0.5]) {
		
		rotate([0,90,0]) {
			union() {
				shaftCoupling
				(
					getShaftCouplingHeight(),
					getShaftCouplingDiameter(),
					getMotorShaftHeight(),
					getMotorShaftDiameter(),
					getLockingScrew()        
				);
				translate([0,0,getShaftCouplingHeight()]) metricThread( name , getDriveShaftHeight() ); 
			}
		}
	}

}

// -------------------------------------------------------------------

module printSquareDriveShaft(name="Sq14") {

	translate([0,0,getShaftCouplingDiameter()/2 + 0.5]) {
    
        rotate([0,90,0]) {
            union() {
                shaftCoupling
                (
                    getShaftCouplingHeight(),
                    getShaftCouplingDiameter(),
                    getMotorShaftHeight(),
                    getMotorShaftDiameter(),
                    getLockingScrew()        
                );
                translate([0,0,getShaftCouplingHeight()]) squareThread( name , getDriveShaftHeight() ); 
            }
        }
    }

}


// -------------------------------------------------------------------

module printTrapezoidalDriveShaft(name="TR12") {

	translate([0,0,getShaftCouplingDiameter()/2 + 0.5]) {
    
        rotate([0,90,0]) {
            union() {
                shaftCoupling
                (
                    getShaftCouplingHeight(),
                    getShaftCouplingDiameter(),
                    getMotorShaftHeight(),
                    getMotorShaftDiameter(),
                    getLockingScrew()        
                );
                translate([0,0,getShaftCouplingHeight()]) trapezoidalThread( name , getDriveShaftHeight() ); 
            }
        }
    }

}