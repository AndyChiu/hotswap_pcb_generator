include <parameters.scad>
include <utils.scad>

//LxWxH 6x6x4.3(2.7+1.6)
//pin W/T 0.6/0.2

microswitch_pin_width=0.6+wire_diameter;
microswitch_pin_thinness=0.2+wire_diameter;
microswitch_pin_length=4.5;
microswitch_Base_add_thickness = microswitch_pin_length-(pcb_thickness-2);

microswitch_length=6;
microswitch_width=6;
microswitch_high=2.7;
microswitch_pin_long_spacing=4.5;
microswitch_Pin_width_spacing=6.5;
microswitch_holder_thinness=2;
microswitch_holder_width=microswitch_width/3*2;

module microswitch_socket(borders=[1,1,1,1]) {
    difference() {
        microswitch_socket_base(borders);
        microswitch_socket_cutout(borders);
    }
    microswitch_socket_hold();
}

module microswitch_socket_base(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0]) union() {
        cube([microswitch_length+4, microswitch_width+4, microswitch_Base_add_thickness], center=true);
        translate([0,0,border_z_offset * 1])
            border(
                [microswitch_length+3, microswitch_width+3], 
                borders, 
                pcb_thickness-2, 
                h_border_width, 
                v_border_width
            );
    }
}

module microswitch_socket_cutout(borders=[1,1,1,1]) {
    microswitchdsocket_cutout(borders);
}

module microswitchdsocket_cutout(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                for (x = [-microswitch_pin_long_spacing/2,microswitch_pin_long_spacing/2]) {
                    for (y = [-microswitch_Pin_width_spacing/2,microswitch_Pin_width_spacing/2]) {
                    translate([x,y,pcb_thickness/2-socket_depth])
                        cube([microswitch_pin_width,microswitch_pin_thinness,pcb_thickness+1+socket_depth],true);
                        
                }
            }            
            }

        }
}

module microswitch_socket_hold(){
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
     // Retention Tabs
    for (x = [-(microswitch_length/2)-microswitch_holder_thinness/2,(microswitch_length/2)+microswitch_holder_thinness/2]) {
        translate([x,0,(microswitch_Base_add_thickness+pcb_thickness-2)/2]) {
            rotate([0,0,90])
                cube([microswitch_holder_width,microswitch_holder_thinness,(pcb_thickness/2)+microswitch_high+0.5+microswitch_Base_add_thickness/2],center=true);
            }
        }
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])        
    // hold the micro-switch 
    if (microswitch_hold_bar == true) {
        for (x = [-(microswitch_length/2),(microswitch_length/2)]) {
        translate([x,0,microswitch_high+microswitch_Base_add_thickness-0.1]) {
            rotate([90,0,0])
                    cylinder(h=(microswitch_holder_width),d=0.4,center=true);
            }
        }
    }
}

module microswitch_plate_footprint(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0])
        border_footprint(
            [microswitch_plate_cutout_size,microswitch_plate_cutout_size], 
            borders, 
            h_border_width, 
            v_border_width
        );
}

module microswitch_plate_cutout_footprint() {
    translate([h_unit/2,-v_unit/2,0]) {
        square([microswitch_plate_cutout_size, microswitch_plate_cutout_size],center=true);
    }
}

module microswitch_plate_base(borders=[1,1,1,1], thickness=plate_thickness) {
    linear_extrude(thickness, center=true)
        microswitch_plate_footprint(borders);
}

module microswitch_plate_cutout(thickness=plate_thickness) {
    linear_extrude(thickness+1, center=true)
        microswitch_plate_cutout_footprint();
}

module microswitch_case_footprint(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0])
        border_footprint(
            [microswitch_plate_cutout_size, microswitch_plate_cutout_size], 
            borders, 
            h_border_width, 
            v_border_width
        );
}

module microswitch_case_cutout_footprint() {
    translate([h_unit/2,-v_unit/2,0]) {
        square([microswitch_plate_cutout_size, microswitch_plate_cutout_size],center=true);
    }
}

module microswitch_case_base(borders=[1,1,1,1], thickness=plate_thickness) {
    linear_extrude(thickness, center=true)
        microswitch_case_footprint(borders);
}

module microswitch_case_cutout(thickness=plate_thickness) {
    linear_extrude(thickness+1, center=true)
        microswitch_case_cutout_footprint();
}

microswitch_socket();
