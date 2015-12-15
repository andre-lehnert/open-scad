use <lib-Metric_Threads.scad>
use<part-Motor_PSM35BYG104.scad>




mountPSM35BYG104();






module mountPSM35BYG104()
{

difference()
{

    union()
    {

        difference() 
        {
            translate([ 0.00, 0.00, (getMotorDepth()/2) ])
            {
                cube(size = [getMotorWidth()+5,getMotorHeight()+5,getMotorDepth()], center = true);
            }   
            cube(size = [getMotorWidth(),getMotorHeight(),50], center = true);
        }




        translate([(getMotorWidth()/2-1.5), (getMotorHeight()/2-1.5), 1 ])
        {
            rotate([0,0,45]) {
                union() {
                    cube(size = [2,8.5,2], center = true);
                    translate([ 1, 0, 0.00 ]) { cube(size = [4,4,2], center = true); }
                }
            }
        }
        translate([-(getMotorWidth()/2-1.5), (getMotorHeight()/2-1.5), 1 ])
        {
            rotate([0,0,135]) {
                union() {
                    cube(size = [2,8.5,2], center = true);
                    translate([ 1, 0, 0.00 ]) { cube(size = [4,4,2], center = true); }
                }
            }
        }
        translate([(getMotorWidth()/2-1.5), -(getMotorHeight()/2-1.5), 1 ])
        {
            rotate([0,0,315]) {
                union() {
                    cube(size = [2,8.5,2], center = true);
                    translate([ 1, 0, 0.00 ]) { cube(size = [4,4,2], center = true); }
                }
            }
        }
        translate([-(getMotorWidth()/2-1.5), -(getMotorHeight()/2-1.5), 1 ])
        {
            rotate([0,0,225]) {
                union() {
                    cube(size = [2,8.5,2], center = true);
                    translate([ 1, 0, 0.00 ]) { cube(size = [4,4,2], center = true); }
                }
            }
        }
        
        translate([ 0.00, 0.00, -1.5 ])
        {
            cube(size = [getMotorWidth()+5,getMotorHeight()+5,3], center = true);
        }
    }



    translate([ getMotorWidth()/2, 0.00, (getMotorDepth()/2) ])
    {
        cube(size = [getMotorWidth()/3,getMotorHeight()/3,getMotorDepth()], center = true);
    }
    translate([ 0, getMotorHeight()/2, (getMotorDepth()/2) ])
    {
        cube(size = [getMotorWidth()/3,getMotorHeight()/3,getMotorDepth()], center = true);
    }
    translate([ -(getMotorWidth()/2), 0.00, (getMotorDepth()/2)])
    {
        cube(size = [getMotorWidth()/3,getMotorHeight()/3,getMotorDepth()], center = true);
    }
    translate([ 0, -(getMotorHeight()/2), (getMotorDepth()/2) ])
    {
        cube(size = [getMotorWidth()/3,getMotorHeight()/3,getMotorDepth()], center = true);
    }











    // connection screws
    translate([12.95,12.95,-5]) 
    {
       cylinder(10,1.6,1.6, $fn=100);
    }
    translate([-12.95,12.95,-5]) 
    {
        cylinder(10,1.6,1.6, $fn=100);
    }
    translate([12.95,-12.95,-5]) 
    {
        cylinder(10,1.6,1.6, $fn=100);
    }
    translate([-12.95,-12.95,-5]) 
    {
        cylinder(10,1.6,1.6, $fn=100);
    }
   
}

}


