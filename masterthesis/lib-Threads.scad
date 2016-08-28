/*
 * Thread library
 *
 * Andre Lehnert - lehnert.andre@googlemail.com
 *
 * Version 1.0  2015-11-30 Metric Thread, Bolt and Nut Modules added
 * Version 1.1  2015-12-06 Squared Threads added
 * Version 1.2  2015-12-11 Trapezoidal Threads added
 */

// ---------------------------------------------------------------------------------

use<lib-Metric_Threads.scad>
use<lib-Trapezoidal_Threads.scad>


/*  ++++++++++++++++++++++++++++++++++++

	Preview options

// ++++++++++++++++++++++++++++++++++++
*/
//preview(fastPreview=true); // <---
//preview(fastPreview=false);


// ---------------------------------------------------------------------------------


/*  ++++++++++++++++++++++++++++++++++++
ISO ISO 261 / DIN 13-1 Metric Threads
- Metric screw threads ("M" series threads) are defined in international standard ISO 68-1
- ISO 261 specifies a detailed list of preferred combinations of outer diameter D and pitch P for ISO metric screw threads
- Hex head widths for DIN 934/ ISO 4032 hex nuts and hex head bolts

// ++++++++++++++++++++++++++++++++++++

For thread dimensions see
- https://en.wikipedia.org/wiki/ISO_metric_screw_thread
- http://en.wikipedia.org/wiki/File:ISO_and_UTS_Thread_Dimensions.svg
- https://de.wikipedia.org/wiki/Liste_der_Abmessungen_metrischer_Sechskantmuttern (ISO 4032)
- https://en.wikipedia.org/wiki/Nut_(hardware)#Standard_metric_hex_nuts_sizes
- https://en.wikipedia.org/wiki/ISO_965 (ISO general purpose metric screw thread—tolerances)

// ++++++++++++++++++++++++++++++++++++

- Thread-diameter    D   
- Pitch              P
- Nut-Diameter       S
- Nut-Height         m  

*/
metricThreads = [
//   Name        D      P       S       m
    ["M1",       1,     0.25,   2.5,	0.8],
    ["M1.2",     1.2,   0.25,   3.0,	1.0],  // ISO 4032/ DIN standard
    ["M1.6",     1.6,   0.35,   3.2,    1.3], 
    ["M2",       2,     0.4,    4.0,	1.6],
    ["M2.5",     2.5,   0.45,   5.0,	2.0],
    ["M3",       3,     0.5,    5.5,	2.4],
    ["M3.5",     3.5,   0.6,    6.0,	2.8],
    ["M4",       4,     0.7,    7.0,	3.2],
    ["M5",       5,     0.8,    8.0,	4],
    ["M6",       6,     1,		10.0,	5],  
    ["M8",       8,     1.25,	13.0,	6.5],
    ["M10",      10,    1.5,	16.0,	8],
    ["M12",      12,    1.75,	18.0,	10],
    ["14",       14,    2,	    21.0,	11],
    ["M16",      16,    2,	    24.0,	13],
    ["18",       18,    2.5,	27.0,	15],
    ["M20",      20,    2.5,	30.0,	16],
    ["M24",      24,    3,	    36.0,	19],
    ["M30",      30,    3.5,	46.0,	24],   
    ["M36",      36,    4,	    55.0,	29],
    ["39",       39,    4,	    60.0,	33.4],  // ISO 4032/ DIN standard
    ["M42",      42,    4.5,	65.0,	34.0],  // ISO 4032/ DIN standard
    ["45",       45,    4.5,	70.0,	36.0],  // ISO 4032/ DIN standard
    ["M48",      48,    5,	    75.0,	38.0],  // ISO 4032/ DIN standard
    ["52",       52,    5,	    80.0,	42.0],  // ISO 4032/ DIN standard
    ["M56",      56,    5.5,	85.0,	45.0],  // ISO 4032/ DIN standard
    ["M64",      64,    6,	    95.0,	51.0]   // ISO 4032/ DIN standard
];

function getMetricThreadDiameter(name) = metricThreads[search([name],metricThreads)[0]][1];  
function getMetricHexNutDiameter(name) = metricThreads[search([name],metricThreads)[0]][3];  
function getMetricHexNutHeight(name) = metricThreads[search([name],metricThreads)[0]][4];  


/*  ++++++++++++++++++++++++++++++++++++
DIN 103
- Trapezoidal thread forms are screw thread profiles with trapezoidal outlines
- trapezoidal metric thread form is similar to the Acme thread form, except the thread angle is 30°

// ++++++++++++++++++++++++++++++++++++

For thread dimensions see
- http://www.gewinde-normen.de/en/trapezoidal-coarse-thread.html
- https://en.wikipedia.org/wiki/Trapezoidal_thread_forms


ISO standard/ Trapezoidal Coarse Thread DIN 103 / Trapezoidal Fine Thread DIN 103:

- angle is 30°

Tr60 x 9
- Tr designates a trapezoidal thread
- 60 is the nominal diameter in millimeters
- 9 is the pitch in millimeters
- no suffix: single start thread
- P4.5: 9/4.5 = 2 starts (Pitch 4.5)
- LH: left hand thread


// ++++++++++++++++++++++++++++++++++++

For more infomation see
- https://en.wikipedia.org/wiki/Trapezoidal_thread_forms

// ++++++++++++++++++++++++++++++++++++

- Nominal diameter   D   
- Pitch              P
- Nut-Diameter       S
- Nut-Height         m  

*/
trapezoidalThreads =
[
//  Name         D	     P      starts
    ["TR8x1.5",  8,	     1.5,   1],
    ["TR9x1.5",  9,	     1.5,   1],
    ["TR9",      9,	     2,     1],
    ["TR10x1.5", 10,	 1.5,   1],
    ["TR10",     10,	 2,     1],	
    ["TR11",     11,	 3,     1],
    ["TR12",	 12,     3,     1],
    ["TR14x3.5",   14,     3.5,     1],	
    ["TR14",     14,     4,     1],	
    ["TR16",	 16,     4,     1],		
    ["TR18",	 18,     4,     1],
    ["TR20",	 20,     4,     1], // up to TR300x24   
    ["TR12x6(P2)",12,    3,     2],
    ["TR12x5(P2)",12,    2.5,   2],
    ["TR12x4(P2)",12,    2,     2],
    ["TR12x4",    12,    4,     1],
    ["TR12x2.5",    12,    2.5,     1],
    ["TR14x5",    14,    5,     1],
    ["TR14x4",    14,    5,     1],
    ["TR16x5",    16,    5,     1]
];

function getTrapezoidalThreadDiameter(name) = trapezoidalThreads[search([name],trapezoidalThreads)[0]][1];  


/*  ++++++++++++++++++++++++++++++++++++
Square thread form
- The square thread form is a common screw thread form, used in high load applications such as leadscrews and jackscrews.
- It is the lowest friction and most efficient thread form, but it is difficult to fabricate.
- no radial pressure, or bursting pressure, on the nut
- Square threads also cannot carry as much load as a trapezoidal thread, because the root of the square thread is smaller

For thread dimensions see
- https://en.wikipedia.org/wiki/Square_thread_form
- https://en.wikipedia.org/wiki/Square_thread_form#/media/File:Square_thread_form.svg

ISO:

- thread angle 0°

Sq 22 x 5
- Sq: square thread
- 22: nominal diameter in millimeters
- 5:  pitch in millimeters
- 5/2= 2.5: thread height (P/2)
- no suffix: single start thread

Sq 60 x 18 (P9) LH
- Sq: square thread
- 60: nominal diameter in millimeters
- 18: pitch in millimeters
- 18/2 = 9: thread height (P/2)
- P9: 18/9 = 2 starts (Pitch 9)
- LH: left hand thread

*/
squareThreads =
[
    ["Sq10x2",      10,     2],
    ["Sq11x2.5",    11,     2.5],
    ["Sq12x3",      12,     3],
    ["Sq14",        14,     3.5],
    ["Sq16",        16,     4],
    ["Sq22",        22,     5],
    ["Sq24",        24,     5],
    ["Sq26",        26,     5],
    ["Sq28",        28,	    5],
    ["Sq30",        30,     6],
    ["Sq32",        32,     6],
    ["Sq36",        36,	    6], // up to Sq 100 x 12

];

function getSquareThreadDiameter(name) = squareThreads[search([name],squareThreads)[0]][1];  
  


// ----------------------------------------------------------------------------

module preview(fastPreview=false) {

    previewM =
    [
        "M6","M10","M12","14"
    ];
    
    previewTr =
    [
       "TR12","TR14x3.5","TR16"
    ];
    
    previewSq =
    [
       "Sq11x2.5", "Sq12x3", "Sq14","Sq16"
    ];
    
    height = 30;
    
    for(i = [0:3]) {
        
        // M
        translate([ 0+(30*i), 0.00, 0.00 ]) {
            metricThread(previewM[i],height, debug= fastPreview); 
            
        }
        /*
        translate([ 0+(30*i), 30, 0.00 ]) {
            metricHexBolt(previewM[i],height, debug= fastPreview);   
        }
        translate([ 0+(30*i), 60, 0.00 ]) {
             metricHexNut(previewM[i], debug= fastPreview);
        }  
        */
        
        translate([ 0+(30*i), -30.00, 0.00 ]) {
            squareThread(previewSq[i],height, debug= fastPreview); 
        }
        // Tr
        translate([ 0+(30*i), -60, 0.00 ]) {
            trapezoidalThread(previewTr[i],height,  debug= fastPreview); 
        }      
    }
}



// ----------------------------------------------------------------------------


/* ++++++++++++++++++++++++++++++++++++ 

   metricThread(name="M3",height=10, internalThread=false)
   metricThread("M3",10)
   metricThread(name="M3",height=10, internalThread=true)

// ++++++++++++++++++++++++++++++++++++

Metric screw threads ("M" series threads) are defined in ISO 68-1
- name: "M1", ... ,"M6", ... , "M64"
- height
- internalThread, e.g. nuts
- debug: No thread generated

*/
module metricThread
(
    name="M3", 
    height=10, 
    internalThread=false, 
    debug=false
) 
{
    mThread = metricThreads[search([name],metricThreads)[0]];    
    
	if (debug) {
		cylinder(height, r=mThread[1]/2, $fn=64);		
	} else {	    
		metric_thread (diameter=mThread[1], pitch=mThread[2], length=height, internal=internalThread); 		
	}
}

/* ++++++++++++++++++++++++++++++++++++ 

	squareThread(name="Sq22", height=20, internalThread=false, debug=false)
	squareThread("Sq22", 20)
	squareThread(name="Sq22", height=20, internalThread=true)

// ++++++++++++++++++++++++++++++++++++
*/
module squareThread
(
    name="Sq22", 
    height=20, 
    internalThread=false, 
    debug=false
) 
{
    sThread = squareThreads[search([name],squareThreads)[0]];    
    
	if (debug) {
		cylinder(height, r=sThread[1]/2, $fn=64);		
	} else {	    
		metric_thread (diameter=sThread[1], pitch=sThread[2], length=height, square=true, internal=internalThread); 		
	}
}


/* ++++++++++++++++++++++++++++++++++++ 

	trapezoidalThread(name="TR10", height=10, starts=1, internalThread=false, debug=false)
	trapezoidalThread("TR10", 10)
	trapezoidalThread(name="TR10", height=10, starts=1, internalThread=true)

// ++++++++++++++++++++++++++++++++++++
*/
module trapezoidalThread
(
    name="TR10",
    height=10, 
    starts=1,
    internalThread=false,
    debug=false
)
{    
    if (debug) {
        cylinder(height, r=tThread[1]/2, $fn=64);
    } else {	
       trapezoidThread(name, height, starts, internalThread);
    } 
}

// ----------------------------------------------------------------------------


/* ++++++++++++++++++++++++++++++++++++ 

   metricHexNut(name="M3",height=10, hasThread=true)
   metricHexNut("M3")

// ++++++++++++++++++++++++++++++++++++

ISO 4032 metric hexagonal nuts
- name: "M1", ... ,"M6", ... , "M64"
- (optional non standard) nut height
- (optional) hasThread: Inner Thread
- (optional) additionalWidth: Standard diameter + additionalWidth
- debug: No thread generated

*/
module metricHexNut
(
    name="M3",
    height=0,
    hasThread=true,
    additionalWidth=0,
    debug=false,
    tolerance=0
)
{
    mThread = metricThreads[search([name],metricThreads)[0]];
   
    diameter = mThread[1] * (1+tolerance);
            
    if (height == 0) {        
  
        difference()
        {
            // Hexagon nut
            hexNut( diameter = (mThread[3] + additionalWidth) * (1+tolerance), height = mThread[4] * (1+tolerance));
            
            // Innerthread
            if (hasThread) {
                translate([0,0,-0.1]) {
                    if (debug) {
                        cylinder(mThread[4]+0.2 * (1+tolerance), r=mThread[1]/2 * (1+tolerance), $fn=64);
                    } else {
                        metricThread(name, mThread[4]+0.2 * (1+tolerance), innerThread=true); 
                    }
                }
            }
        }  
        
    } else {
       
        difference()
        {
            // Hexagon nut
            hexNut( diameter = (mThread[3] + additionalWidth) * (1+tolerance),height = height * (1+tolerance));
            
            // Innerthread
            if (hasThread) {
                translate([0,0,-0.1])	metricThread(name, height+0.2 * (1+tolerance), innerThread=true, tolerance);            
            }
        }  
    }
}

// ----------------------------------------------------------------------------

/* ++++++++++++++++++++++++++++++++++++ 

   hexNut(diameter=5,height=10=
   hexNut(3,5)

// ++++++++++++++++++++++++++++++++++++

Default hexagon (polygon) with
- diameter
- height

*/
module hexNut
(
    diameter=5,
    height=10    
)
{
    // Hexagon nut
    cylinder(r = diameter/2,h = height, $fn=6);
}

// ----------------------------------------------------------------------------

/* ++++++++++++++++++++++++++++++++++++ 

   metricHexBolt(name="M3",height=10,nutHeightIncluded=false)
   metricHexBolt("M4",12,true)

// ++++++++++++++++++++++++++++++++++++

-> if (nutHeightIncluded == false)

   height + nut height = total height
     _      ___
    |/|      |
    |/|      |
    |/|      |
    |/|      | (thread) height
    |/|      |
    |/|      |
    |/|     _|_
  |=====|    | nut height
  |=====|   _|_ 

// ++++++++++++++++++++++++++++++++++++

-> if (nutHeightIncluded == true)

   height = total height
     _      ___
    |/|      |
    |/|      |
    |/|      |
    |/|      | height
    |/|      |
    |/|      |
    |/|      |
  |=====|    |
  |=====|   _|_ 

// ++++++++++++++++++++++++++++++++++++
*/
module metricHexBolt
(
    name="M3",
    height=10,
    nutHeightIncluded=false,
    debug=false
)
{
    mThread = metricThreads[search([name],metricThreads)[0]];
       
    union() {
        
        metricHexNut(name = name, hasThread = false);
        
        if (nutHeightIncluded) { 
            if (debug) {
                cylinder(height, r=mThread[1]/2, $fn=64);
            } else {
                metricThread(name, height); 
            }
        } else {
            if (debug) {
                translate([ 0,0, mThread[4] ]) {
                    cylinder(height, r=mThread[1]/2, $fn=64);
                }   
            } else {
               translate([ 0,0, mThread[4] ]) {
                    metricThread(name, height);
                }
            }            
        }
    }
}

/* ++++++++++++++++++++++++++++++++++++ 

	Modified module with presets

*/
module trapezoidThread
(
    name = "TR10",
    height = 10,
    starts = 1,
    internalThread=false
)
{
  
    tThread = trapezoidalThreads[search([name],trapezoidalThreads)[0]];    
    
    length = height - 1.4;
    
    m_starts = tThread[3];
    m_pitch = tThread[2]*m_starts;
    m_pitchRadius = tThread[2]*2;
    
    m_threadAngle = 30; // DIN
    m_threadHeightToPitch = 0.5/m_starts;
    m_profileRatio = 0.5/m_starts;
    
    if (internalThread) {
        
      translate([ 0, 0, -3 ]) 
        difference()
        {   
            
            union()
            {
                for ( i = [0 : m_starts] )
                {
                    rotate([0,0,i*(360/m_starts)])
                    trapezoid_thread
                    (
                        length=length+6,
                        pitch=m_pitch,
                        pitchRadius=m_pitchRadius,
                        threadHeightToPitch=m_threadHeightToPitch,
                        profileRatio=m_profileRatio,
                        threadAngle=m_threadAngle,
                        stepsPerTurn=512
                    );
                }
            }
            
            translate([ 0, 0, length+7 ]) cube(size = [m_pitchRadius*3,m_pitchRadius*3,6], center = true);
            
            cube(size = [m_pitchRadius*3,m_pitchRadius*3,6], center = true);
        } 
        
    } else {
      
        union()
        {
            for ( i = [0 : m_starts] )
            {
                rotate([0,0,i*(360/m_starts)])
                trapezoid_thread
                (
                    length=length,
                    pitch=m_pitch,
                    pitchRadius=m_pitchRadius,
                    threadHeightToPitch=m_threadHeightToPitch,
                    profileRatio=m_profileRatio,
                    threadAngle=m_threadAngle,
                    stepsPerTurn=256
                );
            }
        }  
    }
}