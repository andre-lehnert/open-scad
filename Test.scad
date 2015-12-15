use<part-Motor_Mount_PSM35BYG104.scad>

use<part-Motor_PSM35BYG104.scad>

use<part-Shaft_Coupling.scad>
use<part-Metric_Driveshaft.scad>

use<part-Threaded_Fitting_Socket.scad>
use<part-Threaded_Fitting.scad>  

lockingScrewThread="M2";


driveShaftThread="14";
driveShaftLength=120;

threadModuleHeight=15;

cylinderHeight=150;
cubeHeight=cylinderHeight+20;

position=100;

//render() { print(); }

print();

module print() {

rotate([-90,0,0]) 
{
    
   
     if (false) {
     translate([ 40.00, 00, 0.00 ]) {    cylinder(100,5,5,$fn=4); }
     
      translate([ 50.00, 00, 0.00 ]) {    cylinder(150,5,5,$fn=4); }
    
       translate([ 60.00, 00, 0.00 ]) {    cylinder(200,5,5,$fn=4); }
       translate([ 70.00, 00, 0.00 ]) {    cylinder(250,5,5,$fn=4); }
      
       translate([ -40.00, 00, 0.00 ]) {    cylinder(275,5,5,$fn=4); }
       translate([ -30.00, 00, 0.00 ]) {    cylinder(175,5,5,$fn=4); }
       
      translate([ -100, 0, 275.00 ]) {    cube(size = [200,50,1], center = false);  } 
       translate([ -100, 0, 175 ]) {    cube(size = [200,50,1], center = false);  } 
       
         translate([ -100, 0, 40]) {    cube(size = [200,50,1], center = false);  } 
     }  
    if (false) {
    translate([ 0.00, 0, 0.00 ]) {   
       difference() { 
          translate([ 0.00, 0, cubeHeight/2 ]) { 
             color( [1, 0, 0], 0.1 )   cube(size = [300,300,cubeHeight], center = true); 
          }
          cylinder(cubeHeight*3,26,26, center = true);
       }
    }
}

    PSM35BYG104(
        motorShaftHeight=18,
        motorShaftDiameter=5,
        lockingScrew=lockingScrewThread,
        lockingScrewHeight=14
    );
    
    translate([ 13, 13, 20.00 ]) { 
        cylinder(driveShaftLength+22,1.5,1.5,$fn=100);
    }
    translate([ -13, 13, 20.00 ]) { 
        cylinder(driveShaftLength+22,1.5,1.5,$fn=100);
    }
    translate([ 13, -13, 20.00 ]) { 
        cylinder(driveShaftLength+22,1.5,1.5,$fn=100);
    }
    translate([ -13, -13, 20.00 ]) { 
        cylinder(driveShaftLength+22,1.5,1.5,$fn=100);
    }
    
    translate([ 0.00, 0.00, 22.00 ]) { 
        metricDriveShaft(
            driveShaftThread=driveShaftThread,
            driveShaftLength=driveShaftLength,
            
            shaftCouplingHeight=18,
            shaftCouplingDiameter=11,
            numberOfLockingScrews=1,
            lockingScrew=lockingScrewThread,
            lockingScrewHeight=14,
            
            additionalMounting=false
        
        );
    }
    
    translate([ 0.00, 0.00, 42.00+position ]) { 
        threadedFittingSocket
        (
            width=35,
            height=15,
            
            connectionScrewRadius=1.05,
            connectionScrewDistance=13.5,
            
            linearGuideanceRadius=1.5,
            linearGuideanceDistance=13,
            
            threadedFittingRadius=11.5,
            
            debug=true
        );
        
        metricThreadModule(height=15, radius=11, thread=driveShaftThread);
        
        if (false) {
            translate([ 0.00, 0.00, 58 ]) { 
               
                    difference () {
                        color( [0, 0, 1], 0.9 ) cylinder(cylinderHeight,25,25, center = true);
                         color( [0, 1, 1], 0.2 ) cylinder(cylinderHeight-3,22,22, center = true);
                    }
               
            }
        }
        
        
        if (false)  {
        translate([ 0.00, 0.00, 23 ]) { 
            threadedFittingSocket
            (
                width=35,
                height=80,
                
                connectionScrewRadius=1.05,
                connectionScrewDistance=13.5,
                
                linearGuideanceRadius=1.5,
                linearGuideanceDistance=13,
                
                threadedFittingRadius=11.5,
                
                debug=false
            );
        }
    }
    }
    
        
}


}