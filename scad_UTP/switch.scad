include <parameters.scad>
include <utils.scad>


module switch_socket(borders=[1,1,1,1], rotate_column=false) {
    //    difference() { 
    union() {
    translate([0,0,0])    
//    rotate(a=-5, v=[0,0,0])
    difference() {
        switch_socket_base(borders);
        switch_socket_cutout(borders, rotate_column);
    }
    
//    difference() {
//        switch_socket_base2(borders);
//        switch_socket_cutout(borders, rotate_column);
//    }
}
}

module switch_socket_base(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0]) 
    //    difference() {
   union() {
        cube([socket_size, socket_size, pcb_thickness], center=true);
        translate([0,0,border_z_offset ])
            border(
                [socket_size,socket_size], 
                borders, 
                pcb_thickness-2, 
                h_border_width, 
                v_border_width
            );
    }
}

module switch_socket_base2(borders=[1 ,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0]) 
        translate([0,0,border_z_offset ])
            border(
                [socket_size,socket_size], 
                borders, 
                pcb_thickness-2, 
                h_border_width, 
                v_border_width
            );
}

module switch_socket_cutout(borders=[1,1,1,1], rotate_column=false) {
    
    if (switch_type == "mx") {
        if (use_folded_contact) {
            mx_improved_socket_cutout(borders, rotate_column);
        } else if (utp_wire==true && diode_less==false && wire_diameter<=1) {
            mx_socket_cutout_led(borders, rotate_column);     
        } else if (utp_wire==true && diode_less==true && wire_diameter<=1) {
            mx_socket_cutout_led_dl(borders, rotate_column);
        } else {
            mx_socket_cutout(borders, rotate_column);
        }
    } else if (switch_type == "choc" && choc_v2==true && utp_wire==true) {
        if (diode_less==false && wire_diameter<=1) {
            choc_v2_socket_cutout_led(borders, rotate_column);
        } else if (diode_less==true && wire_diameter<=1) {
            choc_v2_socket_cutout_led_dl(borders, rotate_column);      
        } else {
        assert(false, "switch_type is invalid");
        }
    } else if (switch_type == "choc") {
        if (utp_wire==true && diode_less==false && wire_diameter<=1) {
            choc_socket_cutout_led(borders, rotate_column);
        } else if (utp_wire==true && diode_less==true && wire_diameter<=1) {
            choc_socket_cutout_led_dl(borders, rotate_column);
        } else {
            choc_socket_cutout(borders, rotate_column);
        }    
    } else if (switch_type == "ks27") {
        if (utp_wire==true && diode_less==false && wire_diameter<=1) {
            ks27_socket_cutout_led(borders, rotate_column);
        } else if (utp_wire==true && diode_less==true && wire_diameter<=1) {
            ks27_socket_cutout_led_dl(borders, rotate_column);
        } else {
            ks27_socket_cutout(borders, rotate_column);
        }    
    } else if (switch_type == "mx_low") {
        if (utp_wire==true && diode_less==false && wire_diameter<=1) {
            mxlow_socket_cutout_led(borders, rotate_column);
        } else if (utp_wire==true && diode_less==true && wire_diameter<=1) {
            mxlow_socket_cutout_led_dl(borders, rotate_column);
        } else {
            mxlow_socket_cutout(borders, rotate_column);
        }  
    } else if (switch_type == "romer_g") {
        if (utp_wire==true && diode_less==false && wire_diameter<=1) {
            romerg_socket_cutout_led(borders, rotate_column);
        } else if (utp_wire==true && diode_less==true && wire_diameter<=1) {
            romerg_socket_cutout_led_dl(borders, rotate_column);
        } else {
            romerg_socket_cutout(borders, rotate_column);
        }  
        } else {
        assert(false, "switch_type is invalid");
    }
}

module mx_socket_cutout(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth])
                    cylinder(h=pcb_thickness+1,r=2.1);
                // Side pins
                for (x = [-4,4]) {
                    translate([x*grid,0,pcb_thickness/2-socket_depth])
                        cylinder(h=pcb_thickness+1,r=1.05);
                }
                // Top switch pin
                translate([2*grid,4*grid,pcb_thickness/2-socket_depth])
                    cylinder(h=pcb_thickness+1,r=1);
                // Bottom switch pin
                translate([-3*grid,2*grid,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=.7);
                // Diode cathode cutout
                translate([3*grid,-4*grid,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,4*grid,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=row_cutout_length,d=wire_diameter,center=true);
                // Column wire
                translate([3*grid,-4*grid,-(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                        translate([0,0,-4*grid])
                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);

                // Diode Channel
                translate([-3*grid,-1*grid-.25,pcb_thickness/2])
                    cube([1,6*grid+.5,2],center=true);
                translate([0,-4*grid,pcb_thickness/2])
                    cube([6*grid,1,2],center=true);
                translate([-1*grid-.5,-4*grid,pcb_thickness/2])
                    cube([4*grid,2,3],center=true);
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}
module mx_improved_socket_cutout(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth])
                    cylinder(h=pcb_thickness+1,r=2.1);
                // Side pins
                for (x = [-4,4]) {
                    translate([x*grid,0,pcb_thickness/2-socket_depth])
                        cylinder(h=pcb_thickness+1,r=1.05);
                }
                // Top switch pin
                translate([2*grid,4*grid,pcb_thickness/2-socket_depth])
                    cylinder(h=pcb_thickness+1,r=1);
                // Bottom switch pin
                translate([-3*grid,2*grid,-(pcb_thickness+1)/2]) {
                    translate([-.625,-0.75,0]) cube([1.25,1.5,pcb_thickness+1]);
                }
                // Diode cathode cutout
                translate([3*grid,-4*grid,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,4*grid,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=row_cutout_length,d=wire_diameter,center=true);
                // Column wire
                translate([3*grid,-4*grid,-(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                        translate([0,0,-4*grid])
                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);

                // Diode Channel
                translate([-3*grid,-1*grid-.25,pcb_thickness/2])
                    cube([1,6*grid+.5,2],center=true);
                translate([0,-4*grid,pcb_thickness/2])
                    cube([6*grid,1,2],center=true);
                translate([-1*grid-.5,-4*grid,pcb_thickness/2])
                    cube([4*grid,2,3],center=true);
                translate([-0.5*grid,2*grid+0.25,pcb_thickness/2])
                    cube([5*grid,1,2],center=true);
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module mx_socket_cutout_led(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=2.1);
                // Side pins
                for (x = [-4,4]) {
                    translate([x*grid,0,pcb_thickness/2-socket_depth-socket_depth])
                        cylinder(h=pcb_thickness+1+socket_depth,r=1.05);
                }
                // Top switch pin
                translate([2*grid,4*grid,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([-3*grid,2*grid,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=.7);
                // Diode cathode cutout
                translate([3*grid,2.4*grid,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                // Diode cathode cutout - TO RETURN
                translate([6*grid,2.4*grid,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,4*grid,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=row_cutout_length,d=wire_diameter,center=true);
                // Column wire
                
                //Lower channel
//                translate([3*grid,-4*grid,-(pcb_thickness/2-wire_diameter/2)]) 
//                    rotate([90,0,rotate_column?90:0])
//                        translate([0,0,-4*grid])
//                        cylinder(h=col_cutout_length,d=wire_diameter*1.5,center=true);

                //Upper channel
                translate([3.5*grid,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                translate([2.5*grid,-3.8-0.3,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
                    

                // Diode Channel
                translate([1.5,2.4*grid,pcb_thickness/2])
                    cube([9*grid,1,2],center=true);
                translate([.3*grid-.5,2.4*grid,pcb_thickness/2])
                    cube([4*grid,2,3],center=true);

                // LED cutout
                if (led_hole==true) {
                    translate([0,-4*grid,0])
                        cube([5,4,10],center=true);
                }
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}

module mx_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=2.1);
                // Side pins
                for (x = [-4,4]) {
                    translate([x*grid,0,pcb_thickness/2-socket_depth-socket_depth])
                        cylinder(h=pcb_thickness+1+socket_depth,r=1.05);
                }
                // Top switch pin
                translate([2*grid,4*grid,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([-3*grid,2*grid,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=.7);
                // Diode cathode cutout
//                translate([3*grid,2.4*grid,0])
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                // Diode cathode cutout - TO RETURN
//                translate([6*grid,2.4*grid,0])
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,4*grid,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=row_cutout_length,d=wire_diameter,center=true);
                // Column wire
                //Lower channel
//                translate([3*grid,-4*grid,-(pcb_thickness/2-wire_diameter/2)]) 
//                    rotate([90,0,rotate_column?90:0])
//                        translate([0,0,-4*grid])
//                        cylinder(h=col_cutout_length,d=wire_diameter*1.5,center=true);

                //Upper channel
                translate([-3.3*grid,3.8+1,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                translate([-3*grid,-2.7,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=10,d=wire_diameter,center=true);
                    


                // Diode Channel
//                translate([1.5,2.4*grid,pcb_thickness/2])
//                    cube([9*grid,1,2],center=true);
//                translate([.3*grid-.5,2.4*grid,pcb_thickness/2])
//                    cube([4*grid,2,3],center=true);

                // LED cutout
                if (led_hole==true) {
                    translate([0,-4*grid,0])
                        cube([5,4,10],center=true);
                }
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module choc_socket_cutout(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth])
                    cylinder(h=pcb_thickness+1,d=3.5);
                // Side pins
                for (x = [-5.5,5.5]) {
                    translate([x,0,pcb_thickness/2-socket_depth])
                        cylinder(h=pcb_thickness+1,r=1.05);
                }
                // Top switch pin
                translate([0,5.9,pcb_thickness/2-socket_depth])
                    cylinder(h=pcb_thickness+1,r=1);
                // Bottom switch pin
                translate([5,3.8,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=.7);
                // Diode cathode cutout
                translate([-3.125,-3.8,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=row_cutout_length,d=wire_diameter,center=true);
                // Column wire
                translate([-3.125,-3.8,-(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);

                // Diode Channel
                translate([-3.125,0,pcb_thickness/2])
                    cube([1,7.6,2],center=true);
                translate([.75,3.8,pcb_thickness/2])
                    cube([8.5,1,2],center=true);
                translate([-3.125,1.8,pcb_thickness/2])
                    cube([2,5,3.5],center=true);
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module choc_socket_cutout_led(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=3.5);
                // Side pins
                for (x = [-5.5,5.5]) {
                    translate([x,0,pcb_thickness/2-socket_depth-socket_depth])
                        cylinder(h=pcb_thickness+1+socket_depth,r=1.05);
                }
                // Top switch pin
                translate([0,5.9,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([5,3.8,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=0.7);
                // Diode cathode cutout
                translate([-3.125,3.8,0]) 
                    cylinder(h=pcb_thickness+1,r=.8,center=true);

                // Wire Channels
                // Row wire
                translate([0,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true);
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire
                translate([-3.125,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                translate([-3.125,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode cathode cutout - TO RETURN
                translate([-6*grid,3.8,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                    
                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
                translate([.75-2,3.8,pcb_thickness/2])
                    cube([8.5+4,1,2],center=true);
                translate([1,3.75,pcb_thickness/2])
                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                    translate([0,-5,0])
                        cube([5,3,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module choc_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=3.5);
                // Side pins
                for (x = [-5.5,5.5]) {
                    translate([x,0,pcb_thickness/2-socket_depth-socket_depth])
                        cylinder(h=pcb_thickness+1+socket_depth,r=1.05);
                }
                // Top switch pin
                translate([0,5.9,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([5,3.8,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=0.8);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    #cylinder(h=unit,d=wire_diameter,center=true); 
                //h=unit or row_cutout_length
                
                // Add deep chnnels
                translate([5-wire_diameter/1.2+1.5,5.9,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([0,90,0])
                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                translate([-(5-wire_diameter/1.2+1.5),5.9,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([0,90,0])
                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                        
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Add deep Channels
                translate([5,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([5-wire_diameter/1.2,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                       
                       
                translate([5-wire_diameter/1.2,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0,-5,0])
                            cube([5,3,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}

module choc_v2_socket_cutout_led(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=4.8*1.05);
                // Side pins (V1)       
                if (choc_v2_compatible_v1==true){
                    for (x = [-5.5,5.5]) {
                        translate([x,0,pcb_thickness/2-socket_depth-socket_depth])
                            cylinder(h=pcb_thickness+1+socket_depth,r=0.95);
                    }
                }
                
                // Bottom Side pin (V2)
                translate([-5,-5.15,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                       cylinder(h=pcb_thickness+1+socket_depth,r=0.7);
                
                // Top switch pin
                translate([0,5.9,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([5,3.8,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=0.7);
                // Diode cathode cutout
                translate([-3.125,3.8,0]) 
                    cylinder(h=pcb_thickness+1,r=.8,center=true);

                        
                // Wire Channels
                // Row wire
                translate([0,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true);
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                
                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
                translate([5-wire_diameter/1.2+1.5,5.9,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([0,90,0])
                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                translate([-(5-wire_diameter/1.2+1.5),5.9,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([0,90,0])
                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                                    
                }
                
                // Column wire

                // Deep Channel
                translate([-3.125,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([-3.125,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                translate([-3.125,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode cathode cutout - TO RETURN
                translate([-6*grid,3.8,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                    
                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
                translate([.75-2,3.8,pcb_thickness/2])
                    cube([8.5+4,1,2],center=true);
                translate([1,3.75,pcb_thickness/2])
                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {                
                        translate([0,-5,0])
                            cube([5,3,10],center=true);
                }
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module choc_v2_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=4.8*1.05);
                // Side pins (V1)       
                if (choc_v2_compatible_v1==true){
                    for (x = [-5.5,5.5]) {
                        translate([x,0,pcb_thickness/2-socket_depth-socket_depth])
                            cylinder(h=pcb_thickness+1+socket_depth,r=0.95);
                    }
                }
                
                // Bottom Side pin (V2)
                translate([-5,-5.15,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                       cylinder(h=pcb_thickness+1+socket_depth,r=0.7);
                
                // Top switch pin
                translate([0,5.9,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([5,3.8,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true); 
                //h=unit or row_cutout_length
                
                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
                    translate([5-wire_diameter/1.2+1.5,5.9,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                    translate([-(5-wire_diameter/1.2+1.5),5.9,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([5,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([5-wire_diameter/1.2,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                       
                       
                translate([5-wire_diameter/1.2,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0,-5,0])
                            cube([5,3,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}

module ks27_socket_cutout_led(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=4.8*1.02);

                // Top switch pin
                translate([-2.9,5.7,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([4.4,4.2,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=0.7);
                // Diode cathode cutout
                translate([-5,3.8,0]) 
                    cylinder(h=pcb_thickness+1,r=.8,center=true);

                        
                // Wire Channels
                // Row wire
                translate([0,5.7,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true);
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                translate([(5-wire_diameter/1.2+1.5),5.7,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])

                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                        
                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
                translate([-(5-wire_diameter/1.2+1.5),5.7,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([0,90,0])
                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                                    
                }
                
                // Column wire

                // Deep Channel
                translate([-5,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([-5,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                translate([-5,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode cathode cutout - TO RETURN
                translate([-6*grid,3.8,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                    
                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
                translate([.75-2,3.8,pcb_thickness/2])
                    cube([8.5+4,1,2],center=true);
                translate([1,3.75,pcb_thickness/2])
                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0.5,-5,0])
                            cube([5.5,3,10],center=true);
                }

            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module ks27_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=4.8*1.02);
                           
                // Top switch pin
                translate([-2.9,5.7,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([4.4,4.2,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,5.7,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true); 
                //h=unit or row_cutout_length
                
                //ROW left deep channel
                translate([-(5-wire_diameter/1.2+1.5),5.7,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
                    translate([6-wire_diameter/1.2+1.5,5.7,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,5],center=true);


                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([4.4,4.2+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([5.3-wire_diameter/1.2,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                       
                       
                translate([5.3-wire_diameter/1.2,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0.5,-5,0])
                            cube([5.5,3,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}



module mxlow_socket_cutout_led(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,0])
                    cube([6,6,pcb_thickness+1+socket_depth],center=true);
                translate([0,4,0])
                    cube([2.2,2,pcb_thickness+1+socket_depth],center=true);
                          
                // Top switch pin
                translate([0,6.6,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([-3.9,3.3,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
//                translate([0,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
//                    #cylinder(h=unit,d=wire_diameter,center=true); 


                translate([unit/3,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/2,d=wire_diameter,center=true); 

                translate([-unit/3,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/2,d=wire_diameter,center=true);

                translate([0,6.6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/5,d=wire_diameter,center=true);
                    
    //h=unit or row_cutout_length
                
                //ROW left deep channel
                   translate([6-wire_diameter/1.2+1.5,5.6,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
 
                    translate([-(5-wire_diameter/1.2+1.5),5.6,(pcb_thickness/2-wire_diameter/3)]) 
                            rotate([0,90,0])
                                cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([-3.9,4.2+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([-3.9-wire_diameter/1.2,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                       
                       
                translate([-3.9-wire_diameter/1.2,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0.5,-5,0])
                            cube([9,1.7,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module mxlow_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,0])
                    cube([6,6,pcb_thickness+1+socket_depth],center=true);
                translate([0,4,0])
                    cube([2.2,2,pcb_thickness+1+socket_depth],center=true);
                          
                // Top switch pin
                translate([0,6.6,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([-3.9,3.3,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
//                translate([0,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
//                    #cylinder(h=unit,d=wire_diameter,center=true); 


                translate([unit/3,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/2,d=wire_diameter,center=true); 

                translate([-unit/3,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/2,d=wire_diameter,center=true);

                translate([0,6.6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/5,d=wire_diameter,center=true);
                    
    //h=unit or row_cutout_length
                
                //ROW left deep channel
                   translate([6-wire_diameter/1.2+1.5,5.6,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
 
                    translate([-(5-wire_diameter/1.2+1.5),5.6,(pcb_thickness/2-wire_diameter/3)]) 
                            rotate([0,90,0])
                                cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([-3.9,4.2+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([-3.9-wire_diameter/1.2,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                       
                       
                translate([-3.9-wire_diameter/1.2,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0.5,-5,0])
                            cube([9,1.7,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}

module romerg_socket_cutout_led(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([(11.6/2)-(1.5/2),0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                translate([-((11.6/2)-(1.5/2)),0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
 
                // Top switch pin
                translate([-((5/2)-0.5),-(9.6/2-(0.3/2)),pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([((5/2)-0.5),9.6/2-(0.3/2),(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Diode cathode cutout
                translate([4*grid,-(9.6/2-(0.3/2)),0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                // Diode cathode cutout - TO RETURN
                translate([6*grid,-(9.6/2-(0.3/2)),0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                translate([-4*grid,-(9.6/2-(0.3/2)),0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);                
                // Wire Channels
                // Row wire
//                translate([0,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
//                    #cylinder(h=unit,d=wire_diameter,center=true); 


                translate([0,9.6/2-(0.3/2),pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true); 
     
                //ROW left deep channel
                   translate([5-wire_diameter/1.2+1.5,9.6/2-(0.3/2),(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,7],center=true);

                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
 
                    translate([(5.5-wire_diameter/1.2),9.6/2-(0.3/2),(pcb_thickness/2-wire_diameter/3)]) 
                            rotate([0,90,0])
                                cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([4,4.2+1,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([5.5,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,4],center=true);
                       
                       
//                translate([3.5,-3.8+0.5+3,(pcb_thickness/2-wire_diameter/3)]) 
//                    rotate([90,0,rotate_column?90:0])
//                    cylinder(h=10,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
                translate([3.125,0,pcb_thickness/2])
                    cube([1,9,2],center=true);
                translate([4.5,-3.5,pcb_thickness/2])
                    cube([2,2,2],center=true);
                translate([1,-(9.6/2-(0.3/2)),pcb_thickness/2])
                    #cube([13,1,2],center=true);
                translate([2,-(9.6/2-(0.3/2)),pcb_thickness/2])
                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                    translate([0,0,0])
                        cube([4,4,pcb_thickness+1+socket_depth],center=true);

                }
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module romerg_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([(11.6/2)-(1.5/2),0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                translate([-((11.6/2)-(1.5/2)),0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
 
                // Top switch pin
                translate([-((5/2)-0.5),-(9.6/2-(0.3/2)),pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([((5/2)-0.5),9.6/2-(0.3/2),(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
//                translate([0,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
//                    #cylinder(h=unit,d=wire_diameter,center=true); 


                translate([0,9.6/2-(0.3/2),pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true); 
     
                //ROW left deep channel
                   translate([5-wire_diameter/1.2+1.5,9.6/2-(0.3/2),(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,7],center=true);

                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
 
                    translate([-(4.5-wire_diameter/1.2),9.6/2-(0.3/2),(pcb_thickness/2-wire_diameter/3)]) 
                            rotate([0,90,0])
                                cube([pcb_thickness/1.5,wire_diameter,7],center=true);

                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([-(5/2)-0.5,4.2+1,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([-((5/2)-0.5),-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,4],center=true);
                       
                       
                translate([-(5/2)-0.5,-3.8+0.5+3,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=10,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                    translate([0,0,0])
                        cube([4,4,pcb_thickness+1+socket_depth],center=true);

                }
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}

module switch_plate_footprint(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0])
        border_footprint(
            [socket_size,socket_size], 
            borders, 
            h_border_width, 
            v_border_width
        );
}

module switch_plate_cutout_footprint() {
    translate([h_unit/2,-v_unit/2,0]) {
        square([plate_cutout_size, plate_cutout_size],center=true);
    }
}

module switch_plate_base(borders=[1,1,1,1], thickness=plate_thickness) {
    linear_extrude(thickness, center=true)
        switch_plate_footprint(borders);
}

module switch_plate_cutout(thickness=plate_thickness) {
    linear_extrude(thickness+1, center=true)
        switch_plate_cutout_footprint();
}

switch_socket(borders=[1,1,1,1]);


