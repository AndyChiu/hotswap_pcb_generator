include <parameters.scad>
include <utils.scad>


module ec11_socket(borders=[1,1,1,1], rotate_column=false) {
    difference() {
        ec11_socket_base(borders);
        ec11_socket_cutout(borders, rotate_column);
    }
}

module ec11_socket_base(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0]) union() {
        cube([socket_size, socket_size, 0], center=true);
        translate([0,0,border_z_offset * 1])
            border(
                [socket_size,socket_size], 
                borders, 
                pcb_thickness-2, 
                h_border_width, 
                v_border_width
            );
    }
}

module ec11_socket_cutout(borders=[1,1,1,1], rotate_column=false) {
    ec11dsocket_cutout(borders, rotate_column);
//    if (switch_type == "mx") {
//        if (use_folded_contact) {
//            mx_improved_socket_cutout(borders, rotate_column);
//        } else {
//            mx_socket_cutout(borders, rotate_column);
//        }
//    } else if (switch_type == "choc") {
//        choc_socket_cutout(borders, rotate_column);
//    } else {
//        assert(false, "switch_type is invalid");
//    }
}

module ec11dsocket_cutout(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // 固定座腳 1.9 X1
                //寬度1.6改成1,不然太寬
                for (x = [-6,6]) {
                    translate([x,0,pcb_thickness/2-socket_depth])
                        cube([1,2.6,pcb_thickness+1+socket_depth],true);
                        
                }
                
                //基座長寬 11.8
                //針腳距離14.8 x 12.5   
                //針腳 0.7
                //兩針之間距離5
                
                //三針一樣,只是多一針在中央
                // Bottom switch pin
                for (x = [-2.5,2.5]) {
                        
                    translate([x,7.5,(pcb_thickness+1)/2])
                        rotate([180,0,0])
                            cylinder(h=pcb_thickness+1,r=1);
                }
                for (x = [-2.5,0,2.5]) {
                        
                    translate([x,-7.5,(pcb_thickness+1)/2])
                        rotate([180,0,0])
                            cylinder(h=pcb_thickness+1,r=1);
                        
                }


            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    15+h_border_width*(borders[2]+borders[3])+0.02,
                    15+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}

module ec11_plate_footprint(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0])
        border_footprint(
            [ec11_plate_cutout_size,ec11_plate_cutout_size], 
            borders, 
            h_border_width, 
            v_border_width
        );
}

module ec11_plate_cutout_footprint() {
    translate([h_unit/2,-v_unit/2,0]) {
        square([ec11_plate_cutout_size, ec11_plate_cutout_size],center=true);
    }
}

module ec11_plate_base(borders=[1,1,1,1], thickness=plate_thickness) {
    linear_extrude(thickness, center=true)
        ec11_plate_footprint(borders);
}

module ec11_plate_cutout(thickness=plate_thickness) {
    linear_extrude(thickness+1, center=true)
        ec11_plate_cutout_footprint();
}

module ec11_case_footprint(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0])
        border_footprint(
            [ec11_plate_cutout_size, ec11_plate_cutout_size], 
            borders, 
            h_border_width, 
            v_border_width
        );
}

module ec11_case_cutout_footprint() {
    translate([h_unit/2,-v_unit/2,0]) {
        square([ec11_plate_cutout_size, ec11_plate_cutout_size],center=true);
    }
}

module ec11_case_base(borders=[1,1,1,1], thickness=plate_thickness) {
    linear_extrude(thickness, center=true)
        ec11_case_footprint(borders);
}

module ec11_case_cutout(thickness=plate_thickness) {
    linear_extrude(thickness+1, center=true)
        ec11_case_cutout_footprint();
}

ec11_socket();
