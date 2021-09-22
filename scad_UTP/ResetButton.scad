include <parameters.scad>
include <utils.scad>

//LxWxH 6x6x2.7
//pin W/T 0.6/0.2
// 6.6-0.2=6.4
// 5.1-0.6=4.5

RB_pin_width=0.6+wire_diameter;
RB_pin_thinness=0.2+wire_diameter;
RB_length=6;
RB_width=6;
RB_high=2.7;
RB_pin_long_spacing=4.5;
RB_Pin_width_spacing=6.4;
RB_holder_thinness=2;
RB_holder_width=RB_width/2;

module ResetButton_socket(borders=[1,1,1,1]) {
    difference() {
        #ResetButton_socket_base(borders);
        ResetButton_socket_cutout(borders);
    }
    ResetButton_socket_hold();
}

module ResetButton_socket_base(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0]) union() {
        cube([RB_length+2, RB_width+2, 0], center=true);
        translate([0,0,border_z_offset * 1])
            border(
                [RB_length+2, RB_width+2], 
                borders, 
                pcb_thickness-2, 
                h_border_width, 
                v_border_width
            );
    }
}

module ResetButton_socket_cutout(borders=[1,1,1,1]) {
    ResetButtondsocket_cutout(borders);
}

module ResetButtondsocket_cutout(borders=[1,1,1,1]) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                for (x = [-RB_pin_long_spacing/2,RB_pin_long_spacing/2]) {
                    for (y = [-RB_Pin_width_spacing/2,RB_Pin_width_spacing/2]) {
                    translate([x,y,pcb_thickness/2-socket_depth])
                        cube([RB_pin_width,RB_pin_thinness,pcb_thickness+1+socket_depth],true);
                        
                }
            }            
            }

        }
}

module ResetButton_socket_hold(){
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
     // Retention Tabs
    for (x = [-(RB_length/2)-RB_holder_thinness/2,(RB_length/2)+RB_holder_thinness/2]) {
        translate([x,0,(pcb_thickness+1)/3]) {
            rotate([0,0,90])
                #cube([RB_holder_width,RB_holder_thinness,(pcb_thickness/3)+RB_high+1],center=true);
            }
        }
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])        
    // hold the MCU 
    for (x = [-(RB_length/2),(RB_length/2)]) {
        translate([x,0,RB_high+1]) {
            rotate([90,0,0])
                    #cylinder(h=(RB_holder_width),d=0.5,center=true);
            }
        }
    }
    

module ResetButton_plate_footprint(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0])
        border_footprint(
            [ResetButton_plate_cutout_size,ResetButton_plate_cutout_size], 
            borders, 
            h_border_width, 
            v_border_width
        );
}

module ResetButton_plate_cutout_footprint() {
    translate([h_unit/2,-v_unit/2,0]) {
        square([ResetButton_plate_cutout_size, ResetButton_plate_cutout_size],center=true);
    }
}

module ResetButton_plate_base(borders=[1,1,1,1], thickness=plate_thickness) {
    linear_extrude(thickness, center=true)
        ResetButton_plate_footprint(borders);
}

module ResetButton_plate_cutout(thickness=plate_thickness) {
    linear_extrude(thickness+1, center=true)
        ResetButton_plate_cutout_footprint();
}

module ResetButton_case_footprint(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0])
        border_footprint(
            [ResetButton_plate_cutout_size, ResetButton_plate_cutout_size], 
            borders, 
            h_border_width, 
            v_border_width
        );
}

module ResetButton_case_cutout_footprint() {
    translate([h_unit/2,-v_unit/2,0]) {
        square([ResetButton_plate_cutout_size, ResetButton_plate_cutout_size],center=true);
    }
}

module ResetButton_case_base(borders=[1,1,1,1], thickness=plate_thickness) {
    linear_extrude(thickness, center=true)
        ResetButton_case_footprint(borders);
}

module ResetButton_case_cutout(thickness=plate_thickness) {
    linear_extrude(thickness+1, center=true)
        ResetButton_case_cutout_footprint();
}

ResetButton_socket();
