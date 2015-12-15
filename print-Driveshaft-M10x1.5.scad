/*
"M6","M10","M12","14"
metricThread(previewM[i],height, debug= fastPreview); 

"TR12","TR14x3.5","TR16"
trapezoidalThread(previewTr[i],height,  debug= fastPreview); 

"Sq11x2.5", "Sq12x3", "Sq14","Sq16"
squareThread(previewSq[i],height, debug= fastPreview); 

*/

use<param-driveshaft.scad>

use<lib-Threads.scad>

use<part-Shaft_Coupling_with_3_Nuts.scad>


driveShaftThread = "M10";

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
			translate([0,0,getShaftCouplingHeight()]) metricThread( driveShaftThread , getDriveShaftHeight() ); 
        }
    }
}

echo("Total Height: ");
echo(getTotalHeight());