use<part-Threaded_Fitting.scad>

// ---------------------------------------------------------------------------------

module threadedFittingSocket
(
	width=35,
	height=15,
    
    connectionScrewRadius=1.05,
    connectionScrewDistance=13.5,
    
	linearGuideanceRadius=1.5,
    linearGuideanceDistance=13,
    
	threadedFittingRadius=12.5,
    
    debug=false
)
{

	difference()
	{
		// threaded fitting socket	
        color([1,0,0]) cylinder(height, width/2-0.5, width/2-0.5, $fn=20);  
	            
		translate([ 0.00, 0.00, -1 ]) {
			threadModule(height*2,radius=threadedFittingRadius);
		}
			 
		// connection screws
		translate([ connectionScrewDistance, 0, height/2+1 ]) {
			cylinder(height*2, connectionScrewRadius, connectionScrewRadius, center = true, $fn=500);
		} 
		translate([ -connectionScrewDistance, 0, height/2+1 ]) {
			cylinder(height*2, connectionScrewRadius, connectionScrewRadius, center = true, $fn=500);
		}        
	}
       
    if (debug) {    
        translate([ 0.00, 0.00, -1 ]) {
            linearGuidanceUnit
            (
                width=35,
                height=2,                
                connectionScrewRadius=1.05,
                connectionScrewDistance=13.5,                
                linearGuideanceRadius=1.5,
                linearGuideanceDistance=13,
                threadShaftHoleRadius=9
            );
        }
        
        translate([ 0.00, 0.00, height+1 ]) {
            linearGuidanceUnit
            (
                width=35,
                height=2,                
                connectionScrewRadius=1.05,
                connectionScrewDistance=13.5,                
                linearGuideanceRadius=1.5,
                linearGuideanceDistance=13,
                threadShaftHoleRadius=9
            );
        }      
 
    }
    
    
} 




// ---------------------------------------------------------------------------------

module linearGuidanceUnit
(
    width=35,
    height=2,
    
    connectionScrewRadius=1.05,
    connectionScrewDistance=13.5,
    
	linearGuideanceRadius=1.5,
    linearGuideanceDistance=13,

    threadShaftHoleRadius=9
)
{
    difference() {
        color(0.8,0.3,1,1) cube(size = [width,width,height], center = true);
        
        // threadShaftHole
        cylinder(height+1, 9, 9, center = true, $fn=500);
        
        // linearGuideance
        translate([ linearGuideanceDistance, linearGuideanceDistance, 0 ]) {
            cylinder(height+1, linearGuideanceRadius, linearGuideanceRadius, center = true, $fn=100);
        }
        translate([ -linearGuideanceDistance, linearGuideanceDistance, 0 ]) {
            cylinder(height+1, linearGuideanceRadius, linearGuideanceRadius, center = true, $fn=100);
        }
        translate([ linearGuideanceDistance, -linearGuideanceDistance, 0 ]) {
            cylinder(height+1, linearGuideanceRadius, linearGuideanceRadius, center = true, $fn=100);
        }
        translate([ -linearGuideanceDistance, -linearGuideanceDistance, 0 ]) {
            cylinder(height+1, linearGuideanceRadius, linearGuideanceRadius, center = true, $fn=100);
        }
        
        // connection screws
        translate([ connectionScrewDistance, 0, 0 ]) {
            cylinder(height+1, connectionScrewRadius, connectionScrewRadius, center = true, $fn=100);
        } 
        translate([ -connectionScrewDistance, 0, 0 ]) {
            cylinder(height+1, connectionScrewRadius, connectionScrewRadius, center = true, $fn=100);
        }
    }    
}


// ---------------------------------------------------------------------------------

threadedFittingSocket();