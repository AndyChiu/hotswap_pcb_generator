include <parameters.scad>
include <utils.scad>

//EVQWGD001
//evqwgd001
module evqwgd001_socket(borders=[2,2,2,2], rotate_column=false) {
    difference() {
        evqwgd001_socket_base(borders);
        evqwgd001_socket_cutout(borders, rotate_column);
    }
}

module evqwgd001_socket_base(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0]) union() {
//        cube([socket_size, socket_size, 0], center=true);
        cube([16.7+3, 13.8, 0], center=true);
        translate([0,0,border_z_offset * 1])
            border(
                [16.7+3,13.8], 
                borders, 
                pcb_thickness-2, 
                h_border_width, 
                v_border_width
            );
    }
}

module evqwgd001_socket_cutout(borders=[1,1,1,1], rotate_column=false) {

    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // 4 switch pin
                for (y = [-3.75,-1.25,1.25,3.75]) {
                    translate([-6.05,y,-pcb_thickness])
                        cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                }

                translate([-6.05,-13.8/2,-pcb_thickness])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1.2);

                // 2 switch pin
                for (x = [-16.7/2+0.7,-16.7/2+2+0.7]) {
                        
                    translate([x,13.8/2,(pcb_thickness+1)/2])
                        rotate([180,0,0])
                            cylinder(h=pcb_thickness+1,r=0.8);
                }
                 
                //fix base
                translate([16.7/2+2.3/2-1.4 ,0,-pcb_thickness]) 
                    cube([ 2.5*1.1 , 13.8*1.1, pcb_thickness*2], center=true);  
                
                // 2 Tenon
                for (y = [-3.5,3.5]) {
                    //16.7/2-2.3/2-1.4=5.8
                    translate([5.8,y,-pcb_thickness+1.2 ])
                        cube([2.3*1.2,1.9*1.2 , pcb_thickness], center=true);
                }

            }

//            translate([
//                h_border_width/2 * (borders[3] - borders[2]),
//                v_border_width/2 * (borders[0] - borders[1]),
//                -1
//            ]) {
//                cube([
//                    15+h_border_width*(borders[2]+borders[3])+0.02,
//                    15+v_border_width*(borders[0]+borders[1])+0.02,
//                    2*pcb_thickness
//                ], center=true);
//            }
        }
}

module evqwgd001_plate_footprint(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0])
        border_footprint(
            [evqwgd001_plate_cutout_size_X,evqwgd001_plate_cutout_size_Y], 
            borders, 
            h_border_width, 
            v_border_width
        );
}

module evqwgd001_plate_cutout_footprint() {
    translate([h_unit/2,-v_unit/2,0]) {
        square([evqwgd001_plate_cutout_size_X, evqwgd001_plate_cutout_size_Y],center=true);
    }
}

module evqwgd001_plate_base(borders=[1,1,1,1], thickness=plate_thickness) {
    linear_extrude(thickness, center=true)
        evqwgd001_plate_footprint(borders);
}

module evqwgd001_plate_cutout(thickness=plate_thickness) {
    linear_extrude(thickness+1, center=true)
        evqwgd001_plate_cutout_footprint();
}

module evqwgd001_case_footprint(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0])
        border_footprint(
            [evqwgd001_plate_cutout_size_X, evqwgd001_plate_cutout_size_Y], 
            borders, 
            h_border_width, 
            v_border_width
        );
}

module evqwgd001_case_cutout_footprint() {
    translate([h_unit/2,-v_unit/2,0]) {
        square([evqwgd001_plate_cutout_size_X, evqwgd001_plate_cutout_size_Y],center=true);
    }
}

module evqwgd001_case_base(borders=[1,1,1,1], thickness=plate_thickness) {
    linear_extrude(thickness, center=true)
        evqwgd001_case_footprint(borders);
}

module evqwgd001_case_cutout(thickness=plate_thickness) {
    linear_extrude(thickness+1, center=true)
        evqwgd001_case_cutout_footprint();
}

evqwgd001_socket();
