use<lib-Floppy_Drive_Thread.scad>
use<lib-Threads.scad>

plexiglasSockets_3();
module plexiglasSockets_3
(
    maxWidth = 34,
    maxHeight = 20,
    socketHeight = 20,
    socketWidth = 5,
    grooveWidth = 18,
    grooveLength = 2.2,
    grooveHeight = 20
) {
    reduceThickness = 2.3 - 0.15;
    
    color("magenta")
    difference() {    
        
        for (i = [0 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([maxWidth/2 -5,maxWidth/2 -11,0]) {
                   //translate([34/2 - 5,34/2 - 11,20])
                    union() {
                        translate([0,reduceThickness,0])    
                        cube([socketWidth,socketWidth-reduceThickness,socketHeight]);
                        translate([-(socketWidth + 1) + reduceThickness,(socketWidth + 1),0])
                        cube([socketWidth-reduceThickness,socketWidth,socketHeight]);  
                        rotate([0,0,45])
                        translate([1.5,0.25,0])    
                        cube([2.25,8,socketHeight]);
                        translate([-1,5,0])
                        cube([socketWidth*1.2,socketWidth*1.2,socketHeight]);
                    } 
                }
            
        }
        
        thisWidth = (maxWidth - 1.9 - 1.9);
        
        translate([-thisWidth/2 ,-thisWidth/2,0]) 
        plexiGlassGrooves(maxWidth=thisWidth, maxHeight=maxHeight, grooveWidth=grooveWidth, grooveLength=grooveLength, grooveHeight=grooveHeight);
        
        
    }
    
   
}


//plexiglasSockets_2();
module plexiglasSockets_2
(
    maxWidth = 34,
    maxHeight = 10,
    socketHeight = 10,
    socketWidth = 5,
    grooveWidth = 16,
    grooveLength = 2.2,
    grooveHeight = 10
) {
    reduceThickness = 2.3;
    
    color("magenta")
    difference() {    
        
        for (i = [0 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([maxWidth/2 -5,maxWidth/2 -11,0]) {
                   //translate([34/2 - 5,34/2 - 11,20])
                    union() {
                        translate([0,reduceThickness,0])    
                        cube([socketWidth,socketWidth-reduceThickness,socketHeight]);
                        translate([-(socketWidth + 1) + reduceThickness,(socketWidth + 1),0])
                        cube([socketWidth-reduceThickness,socketWidth,socketHeight]);  
                        rotate([0,0,45])
                        translate([1.5,0.25,0])    
                        cube([2.25,8,socketHeight]);
                    } 
                }
            
        }
        
        thisWidth = (maxWidth - 1.9);
        
        translate([-thisWidth/2,-thisWidth/2,0]) 
        plexiGlassGrooves(maxWidth=thisWidth, maxHeight=maxHeight, grooveWidth=grooveWidth, grooveLength=grooveLength, grooveHeight=grooveHeight);
        
    }
   
}

module plexiglasSockets
(
    maxWidth = 34,
    maxHeight = 10,
    socketHeight = 10,
    socketWidth = 5,
    grooveWidth = 16,
    grooveLength = 2.2,
    grooveHeight = 10
) {
    reduceThickness = 2.3;
    
    color("green")
    difference() {    
        
        for (i = [0 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([maxWidth/2 -5,maxWidth/2 -11,0]) {
                   //translate([34/2 - 5,34/2 - 11,20])
                    union() {
                        translate([0,reduceThickness,0])    
                        cube([socketWidth,socketWidth-reduceThickness,socketHeight]);
                        translate([-(socketWidth + 1) + reduceThickness,(socketWidth + 1),0])
                        cube([socketWidth-reduceThickness,socketWidth,socketHeight]);  
                        rotate([0,0,45])
                        translate([0,0.25,0])    
                        cube([3.5,8,socketHeight]);
                    } 
                }
            
        }
        
        thisWidth = (maxWidth - 1.9);
        
        translate([-thisWidth/2,-thisWidth/2,0]) 
        plexiGlassGrooves(maxWidth=thisWidth, maxHeight=maxHeight, grooveWidth=grooveWidth, grooveLength=grooveLength, grooveHeight=grooveHeight);
        
    }
   
}

//plexiglasLayerSockets_2();

module plexiglasLayerSockets_2
(
    maxWidth = 34,
    maxHeight = 10,
    socketHeight = 10,
    socketWidth = 5,
    grooveWidth = 19.9,
    grooveLength = 2.1,
    grooveHeight = 10,
    threadDiameter = 14,
    innerGrooveWidth = 11,
    innerGrooveLength = 2.2,
    innerGrooveHeight = 10
) {
    
     
    difference() {
    
       
        union() {
            
            // BEGIN additional threading on top
            // see 1)
            reduceThickness = 2.3; //3.95;
            reduceWidth = 0;
            
            translate([0,0,maxHeight])            
            for (i = [0 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([maxWidth/2 -5,maxWidth/2 -11,0]) {
                   //translate([34/2 - 5,34/2 - 11,20])
                    difference() {
                    union() {
                        translate([reduceWidth,reduceThickness,0])    
                        cube([socketWidth - reduceWidth,socketWidth-reduceThickness,socketHeight]);
                        translate([-(socketWidth + 1) + reduceThickness,(socketWidth + 1) + reduceWidth,0])
                        cube([socketWidth-reduceThickness,socketWidth-reduceWidth,socketHeight]);  
                        rotate([0,0,45])
                        translate([2.5,1.25,0])    
                        cube([1,6,socketHeight]);                                               
                    }                    

                    translate([10,0,0])
                    rotate([0,-30,45])
                    cube([10,20,20]);        
                    
                    translate([-1,0,11])
                    rotate([0,60,45])
                    cube([4,10,10]); 
                    
                    w = 3.295;
                     translate([0,-w/3.4,0])
                    rotate([0,0,45])
                    cube([w,10,10]);
            
                    } 
                }
            
            }
            // END additional threading on top
            
            // BEGIN floppy drive threading
            translate([0,0,maxHeight])            
            difference() {
                        cylinder(r=(threadDiameter/2)*1.13, h=maxHeight/3, $fn=48);
                        cylinder(threadDiameter/2, threadDiameter/2 + 0.02, maxHeight, $fn=48);
            }
            
            // END floppy drive threading
            
            // BEGIN plexiglas sockets
            plexiglasSockets
            (
                maxWidth = maxWidth,
                maxHeight = maxHeight,
                socketHeight = socketHeight,
                socketWidth = socketWidth,
                grooveWidth = grooveWidth,
                grooveLength = grooveLength,
                grooveHeight = grooveHeight            
            );         
            // END plexiglas sockets
            
            difference() { 
                
                
                thickness = 8;
                
                union() {
                    // BEGIN X connection
                    for (i = [45 : 90 : 360]) {
                        rotate([0,0,i]) 
                            translate([-(maxWidth - 8)/1.855,-thickness/2,0]) {         
                                cube([maxWidth/1.8 - threadDiameter , thickness, maxHeight]);
                            }                
                    }
                    // END X connection
                    
                    // BEGIN thread hole
                    difference() {
                        cylinder(r=(threadDiameter/2)*1.5, h=maxHeight, $fn=48);
                        cylinder(r=(threadDiameter/2), h=maxHeight, $fn=48);
                    }
                    // END thread hole
                }
                
                innerMaxWidth = ((threadDiameter/2));
                
                // BEGIN LED grooves
                translate([-innerMaxWidth/2,-innerMaxWidth/2,0]) 
                    translate([innerMaxWidth/2,innerMaxWidth/2,maxHeight -innerGrooveHeight]) {
                    for (i = [0 : 90 : 360]) {
                        rotate([0,0,i]) 
                            translate([innerGrooveWidth - 2 + 1.2,-innerGrooveWidth/2,0])
                            rotate([0,0,90])
                            cube([innerGrooveWidth, innerGrooveLength, innerGrooveHeight]);
                        rotate([0,0,i])     
                            translate([innerGrooveWidth  ,-(innerGrooveWidth*0.75)/2,0])
                            rotate([0,0,90])
                            cube([innerGrooveWidth*0.75, innerGrooveLength, innerGrooveHeight]);
                    }
                }
                // END LED grooves    
            }
    }
    
   // BEGIN cable holes
   for (i = [45 : 90 : 45]) {
            rotate([0,0,i]) 
                translate([-(maxWidth)/2.7,0,0]) {                   
                    cylinder(r=2.6, h=maxHeight , $fn=32);                    
                }                
        } 
        
        
//   // horizontal cable holes
//   for (j = [45 : 90 : 360]) {
//            rotate([0,0,j]) 
//                translate([-(maxWidth)/2.6,10,maxHeight/2]) {
//                    rotate([90,0,0])        
//                    cylinder(r=1, h=20 , $fn=16);                    
//                }                
//        } 
   // END cable holes   
        
   // BEGIN additional plexiglas grooves on top
   // see 1)
   thisWidth = (maxWidth - 1.9);
   translate([-thisWidth/2,-thisWidth/2,maxHeight])
   plexiGlassGrooves(maxWidth=thisWidth, maxHeight=maxHeight, grooveWidth=grooveWidth, grooveLength=grooveLength, grooveHeight=grooveHeight);
        
    }
   // END additional plexiglas grooves on top 
    
        
   
}


//plexiglasLayerSockets();

module plexiglasLayerSockets
(
    maxWidth = 34,
    maxHeight = 10,
    socketHeight = 10,
    socketWidth = 5,
    grooveWidth = 19.9,
    grooveLength = 2.1,
    grooveHeight = 10,
    threadDiameter = 14,
    innerGrooveWidth = 12,
    innerGrooveLength = 2.1,
    innerGrooveHeight = 10
) {
    
     
    difference() {
    
       
        union() {
            
            // BEGIN additional threading on top
            // see 1)
            reduceThickness = 2.3; //3.95;
            reduceWidth = 0;
            
            translate([0,0,maxHeight])            
            for (i = [0 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([maxWidth/2 -5,maxWidth/2 -11,0]) {
                   //translate([34/2 - 5,34/2 - 11,20])
                    difference() {
                    union() {
                        translate([reduceWidth,reduceThickness,0])    
                        cube([socketWidth - reduceWidth,socketWidth-reduceThickness,socketHeight]);
                        translate([-(socketWidth + 1) + reduceThickness,(socketWidth + 1) + reduceWidth,0])
                        cube([socketWidth-reduceThickness,socketWidth-reduceWidth,socketHeight]);  
                        rotate([0,0,45])
                        translate([2,1.25,0])    
                        cube([1.5,6,socketHeight]);                                               
                    }                    

                    translate([10,0,0])
                    rotate([0,-30,45])
                    cube([10,20,20]);        
                    
                    translate([-1,0,11])
                    rotate([0,60,45])
                    cube([4,10,10]); 
                 
                     translate([-1,0,0])
                    rotate([0,0,45])
                    cube([2.8,10,10]);
            
                    } 
                }
            
            }
            // END additional threading on top
            
            // BEGIN floppy drive threading
            translate([0,0,maxHeight])            
            difference() {
                        cylinder(r=(threadDiameter/2)*1.13, h=maxHeight/3, $fn=48);
                        cylinder(threadDiameter/2, threadDiameter/2 + 0.02, maxHeight, $fn=48);
            }
            
            // END floppy drive threading
            
            // BEGIN plexiglas sockets
            plexiglasSockets
            (
                maxWidth = maxWidth,
                maxHeight = maxHeight,
                socketHeight = socketHeight,
                socketWidth = socketWidth,
                grooveWidth = grooveWidth,
                grooveLength = grooveLength,
                grooveHeight = grooveHeight            
            );         
            // END plexiglas sockets
            
            difference() { 
                
                
                thickness = 8;
                
                union() {
                    // BEGIN X connection
                    for (i = [45 : 90 : 360]) {
                        rotate([0,0,i]) 
                            translate([-(maxWidth - 8)/1.855,-thickness/2,0]) {         
                                cube([maxWidth/1.8 - threadDiameter , thickness, maxHeight]);
                            }                
                    }
                    // END X connection
                    
                    // BEGIN thread hole
                    difference() {
                        cylinder(r=(threadDiameter/2)*1.5, h=maxHeight, $fn=48);
                        cylinder(r=(threadDiameter/2), h=maxHeight, $fn=48);
                    }
                    // END thread hole
                }
                
                innerMaxWidth = ((threadDiameter/2));
                
                // BEGIN LED grooves
                translate([-innerMaxWidth/2,-innerMaxWidth/2,0]) 
                    translate([innerMaxWidth/2,innerMaxWidth/2,maxHeight -innerGrooveHeight]) {
                    for (i = [0 : 90 : 360]) {
                        rotate([0,0,i]) 
                            translate([innerGrooveWidth - 2,-innerGrooveWidth/2,0])
                            rotate([0,0,90])
                            cube([innerGrooveWidth, innerGrooveLength, innerGrooveHeight]);
                        rotate([0,0,i])     
                            translate([innerGrooveWidth  ,-(innerGrooveWidth*0.75)/2,0])
                            rotate([0,0,90])
                            cube([innerGrooveWidth*0.75, innerGrooveLength, innerGrooveHeight]);
                    }
                }
                // END LED grooves    
            }
    }
    
   // BEGIN cable holes
   for (i = [45 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([-(maxWidth)/2.6,0,0]) {                   
                    cylinder(r=1.6, h=maxHeight , $fn=16);                    
                }                
        } 
        
        
   // horizontal cable holes
   for (j = [45 : 90 : 360]) {
            rotate([0,0,j]) 
                translate([-(maxWidth)/2.6,10,maxHeight/2]) {
                    rotate([90,0,0])        
                    cylinder(r=1, h=20 , $fn=16);                    
                }                
        } 
   // END cable holes   
        
   // BEGIN additional plexiglas grooves on top
   // see 1)
   thisWidth = (maxWidth - 1.9);
   translate([-thisWidth/2,-thisWidth/2,maxHeight])
   plexiGlassGrooves(maxWidth=thisWidth, maxHeight=maxHeight, grooveWidth=grooveWidth, grooveLength=grooveLength, grooveHeight=grooveHeight);
        
    }
   // END additional plexiglas grooves on top 
    
        
   
}


//plexiglasHeaderSocket();

module plexiglasHeaderSocket
(
    maxWidth = 34,
    maxHeight = 10,
    socketHeight = 10,
    socketWidth = 5,
    grooveWidth = 19.9,
    grooveLength = 2.1,
    grooveHeight = 10,
    threadDiameter = 14,
    innerGrooveWidth = 12,
    innerGrooveLength = 2.1,
    innerGrooveHeight = 10
) {
    
     
    difference() {
    
       
        union() {
            
            // BEGIN additional threading on top
            // see 1)
            reduceThickness = 2.3; //3.95;
            reduceWidth = 0;
            
            translate([0,0,maxHeight])            
            for (i = [0 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([maxWidth/2 -5,maxWidth/2 -11,0]) {
                   //translate([34/2 - 5,34/2 - 11,20])
                    difference() {
                    union() {
                        translate([reduceWidth,reduceThickness,0])    
                        cube([socketWidth - reduceWidth,socketWidth-reduceThickness,socketHeight]);
                        translate([-(socketWidth + 1) + reduceThickness,(socketWidth + 1) + reduceWidth,0])
                        cube([socketWidth-reduceThickness,socketWidth-reduceWidth,socketHeight]);  
                        rotate([0,0,45])
                        translate([2,1.25,0])    
                        cube([1.5,6,socketHeight]);                                               
                    }                    

                    translate([10,0,0])
                    rotate([0,-30,45])
                    cube([10,20,20]);        
                    
                    translate([-1,0,11])
                    rotate([0,60,45])
                    cube([4,10,10]); 
                 
                     translate([-1,0,0])
                    rotate([0,0,45])
                    cube([2.8,10,10]);
            
                    } 
                }
            
            }
            // END additional threading on top
            
   
            
            // BEGIN plexiglas sockets
            plexiglasSockets
            (
                maxWidth = maxWidth,
                maxHeight = maxHeight,
                socketHeight = socketHeight,
                socketWidth = socketWidth,
                grooveWidth = grooveWidth,
                grooveLength = grooveLength,
                grooveHeight = grooveHeight            
            );         
            // END plexiglas sockets
            
            
    }
    
  
        
   // BEGIN additional plexiglas grooves on top
   // see 1)
   thisWidth = (maxWidth - 1.9);
   translate([-thisWidth/2,-thisWidth/2,maxHeight])
   plexiGlassGrooves(maxWidth=thisWidth, maxHeight=maxHeight, grooveWidth=grooveWidth, grooveLength=grooveLength, grooveHeight=grooveHeight);
        
    }
   // END additional plexiglas grooves on top 
    
        
   
}







//plexiGlassGrooves();

module plexiGlassGrooves
(
    maxWidth = 34,
    maxHeight = 8,
    grooveWidth = 16,
    grooveLength = 2.2,
    grooveHeight = 10,
    additionalDistance = 0
) {
    translate([maxWidth/2,maxWidth/2,maxHeight -grooveHeight]) {
        for (i = [0 : 90 : 360]) {
            rotate([0,0,i]) 
                translate([-maxWidth/2 + grooveLength - additionalDistance,-grooveWidth/2,0])
                rotate([0,0,90])
                cube([grooveWidth, grooveLength, grooveHeight]);
            
            
        }
    }
}

//plexiGlassHolder();

module plexiGlassHolder
(
    maxWidth = 34,
    maxHeight = 10,
    grooveWidth = 16,
    grooveLength = 2.2,
    grooveHeight = 8
) {
    color("green")
    union() {
    
    
        difference() {
        
            translate([-maxWidth/2,-maxWidth/2,0]) 
                cube([maxWidth,maxWidth,maxHeight]);
            
            translate([-maxWidth/2,-maxWidth/2,0]) 
                plexiGlassGrooves(maxWidth=maxWidth, maxHeight=maxHeight, grooveWidth=grooveWidth, grooveLength=grooveLength, grooveHeight=grooveHeight);
            
            for (i = [0 : 45 : 360]) {
                rotate([0,0,i])
                translate([maxWidth/2 - 7,0,0]) 
                cylinder(r=1.7, h=maxHeight, $fn=32);
            }
            
            translate([0,0,0]) 
                cylinder(r=1.7, h=maxHeight, $fn=32);
            
            for (i = [0 : 90 : 360]) {
                rotate([0,0,i])
                translate([maxWidth/2 -3,maxWidth/2 - 3,maxHeight/2]) 
                cylinder(r=2, h=maxHeight/2, $fn=32);
            }
        
        }
        
        translate([0,0,maxHeight]) 
        plexiglasSockets();
        
    }
}