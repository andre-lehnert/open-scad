use <lib-Threads.scad>

//use <part-Shaft_Coupling.scad>


// ++++++++++++++++++++++++++++++++++++
// Motor parameter
// ++++++++++++++++++++++++++++++++++++
motorWidth=35;
motorHeight=35;
motorDepth=20;

motorShaftHeight=20;
motorShaftDiameter=5;
motorShaftTolerance=0.001; // +0,1%


// ---------------------------------------------------------------------------------


module PSM35BYG104 (
	shaftCouplingHeight=20,
	shaftCouplingDiameter=8,
	numberOfLockingScrews=1,
	lockingScrew="None",
	lockingScrewHeight=15,
    debug=true
) 

difference () 
{
    union() 
    {  
        translate([0,0,motorDepth]) 
        {
        difference () 
        {     
            color([0.3,0.3,0.3]) cylinder(motorShaftHeight, motorShaftDiameter/2, motorShaftDiameter/2, $fn=100);

//            shaftCoupling(
//                shaftCouplingHeight, 
//                shaftCouplingDiameter, 
//                motorShaftHeight+(motorShaftHeight*motorShaftTolerance), 
//                motorShaftDiameter+(motorShaftDiameter*motorShaftTolerance), 
//                numberOfLockingScrews,
//                lockingScrew, 
//                lockingScrewHeight
//            );
        }
        }
        
        union() 
        {
            translate([0,0,(motorDepth)]) 
            {
            color([0.5,0.5,0.5]) cylinder(2, 22/2, 22/2 -0.1, $fn=100);
            }
            translate([0,0,(motorDepth/2)]) 
            { 
                color([0.6,0.6,0.6]) cube(size = [motorWidth,motorHeight,motorDepth], center = true);
            }            
        }
    }
     
    translate([12.95,12.95,0]) 
    {
        metricThread(name="M3", height=motorDepth, internalThread=true, debug=debug);
    }
    translate([-12.95,12.95,0]) 
    {
        metricThread(name="M3", height=motorDepth, internalThread=true, debug=debug);
    }
    translate([12.95,-12.95,0]) 
    {
        metricThread(name="M3", height=motorDepth, internalThread=true, debug=debug);
    }
    translate([-12.95,-12.95,0]) 
    {
        metricThread(name="M3", height=motorDepth, internalThread=true, debug=debug);
    }
    translate([motorWidth/2,0,3.5]) 
    {
        cube(size = [2,8,5], center = true);
    }
}



// ---------------------------------------------------------------------------------

function getMotorWidth() = motorWidth;
function getMotorHeight() = motorHeight;
function getMotorDepth() = motorDepth;

function getMotorShaftHeight() = motorShaftHeight;
function getMotorShaftDiameter() = motorShaftDiameter;
function getMotorShaftTolerance() = motorShaftTolerance;

// ---------------------------------------------------------------------------------

PSM35BYG104();

   
