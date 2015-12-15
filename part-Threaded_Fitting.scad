use <lib-Threads.scad> 


module threadModule(height=15, radius=12)
{
    translate([ 0.00, 0.00, height/2 ])
    {
        difference() 
        {
            // Gewinde
            color([0,0.5,1]) cylinder(height, radius, radius, center = true, $fn=500);
                    
            // Rotationsschutz
            translate([(radius+1), 0, 1]) {
               cube(size = [(radius-1)/2,(radius+3),height+3], center = true);
            }

            translate([-(radius+1), 0, 1]) {
               cube(size = [(radius-1)/2,(radius+3),height+3], center = true);
            }        
        }
    }
}

module metricThreadModule(height=15, radius=12, thread="M12")
{
    difference() 
    {
        threadModule(height, radius);
        
        translate([0, 0, -1]) {
            metricThread(thread,height*2, innerThread=true); 
        }
    }
}

module squareThreadModule(height=15, radius=12, thread="Sq16")
{
    difference() 
    {
        threadModule(height, radius);
        
        translate([0, 0, -1]) {
            squareThread(thread, height*2, internalThread=true); 
        }
    }
}

module trapezoidalThreadModule(height=15, radius=12, thread="TR16")
{
    difference() 
    {
        threadModule(height, radius);
        
        translate([0, 0, -3]) {
            trapezoidalThread(thread,height*2, internalThread=true);
        }
    }
}

metricThreadModule();
//squareThreadModule();
//trapezoidalThreadModule();