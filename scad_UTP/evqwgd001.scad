include <parameters.scad>
include <utils.scad>

//EVQWGD001
//evqwgd001

evqwgd001_plate_cutout_size_X=16.7;
evqwgd001_plate_cutout_size_Y=13.8;
evqwgd001_pin_lenght=3.6;
//evqwgd001_base_add_thickness= evqwgd001_pin_lenght-(pcb_thickness-2);
evqwgd001_base_add_thickness= 2;

module evqwgd001_socket(borders=[2,2,2,2], rotate_column=false) {
    difference() {
        evqwgd001_socket_base(borders);
        evqwgd001_socket_cutout(borders, rotate_column);
    }
}

module evqwgd001_socket_base(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,evqwgd001_base_add_thickness/2]) union() {
//        cube([socket_size, socket_size, 0], center=true);
        cube([evqwgd001_plate_cutout_size_X+1, evqwgd001_plate_cutout_size_Y, evqwgd001_base_add_thickness*1], center=true);
          }  
        
    translate([h_unit/2,-v_unit/2,border_z_offset * 1])
        border(
            [evqwgd001_plate_cutout_size_X+3,evqwgd001_plate_cutout_size_Y+3], 
            borders, 
            pcb_thickness-2, 
            h_border_width, 
            v_border_width
        );

}

module evqwgd001_socket_cutout(borders=[1,1,1,1], rotate_column=false) {

    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // 4 switch pin
                for (y = [-3.75,-1.25,1.25,3.75]) {
                    translate([-6.05,y,-pcb_thickness])
                        cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                    translate([-6.05,y,evqwgd001_base_add_thickness-wire_diameter/2])
                        cube([evqwgd001_plate_cutout_size_X,wire_diameter,wire_diameter],true);
                    }
                // 2 Wire Channels
                for (x = [-3.75,2]) {
                    translate([x,0,evqwgd001_base_add_thickness-wire_diameter/2])
                       cube([wire_diameter,evqwgd001_plate_cutout_size_X,wire_diameter],true);
                        
                    }
                // 1 plastic pin  
                translate([-6.05,-evqwgd001_plate_cutout_size_Y/2+0.5,-pcb_thickness])
                    cylinder(h=pcb_thickness+1+socket_depth,r=0.8);

                // 2 switch pin
                for (x = [-evqwgd001_plate_cutout_size_X/2+0.7,-evqwgd001_plate_cutout_size_X/2+2+0.7]) {
                        
                    translate([x,evqwgd001_plate_cutout_size_Y/2-0.5,(pcb_thickness+1)/2])
                        rotate([180,0,0])
                            cylinder(h=pcb_thickness+1,r=0.8);
                }
                 
                //fix base
                translate([evqwgd001_plate_cutout_size_X/2+2.3/2-1.4 ,0,evqwgd001_base_add_thickness/2]) 
                    cube([ 2.5*1.1 , evqwgd001_plate_cutout_size_Y*1.1, evqwgd001_base_add_thickness], center=true);  
                
                // 2 Tenon
                for (y = [-3.5,3.5]) {
                    //16.7/2-2.3/2-1.4=5.8
                    translate([5.8,y,evqwgd001_base_add_thickness/2-wire_diameter/2])
                        #cube([2.3*1.2,1.9*1.2 , wire_diameter], center=true);
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
