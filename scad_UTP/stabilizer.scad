include <parameters.scad>
include <utils.scad>
include <stabilizer_spacing.scad>

use <switch.scad>


module stabilizer_layout(spacing=2u) {
    switch_offset = len(spacing) == 4
        ? spacing[3]
        : 0;
    center_x = spacing[0]*unit/2 + switch_offset;
    translate([unit/2-center_x,0,0]) {
        translate([center_x-spacing[1],0,0]) children();
        translate([center_x+spacing[2],0,0]) mirror([1,0,0]) children();
    }
}

module stabilizer_pcb(spacing=2u) {
    margin = (spacing[0]-1)/2;
    difference() {
        union() {
            stabilizer_pcb_base([1,2,0,0], spacing);
            switch_socket_base([1,1,1+margin*unit*mm,1+margin*unit*mm]);
        }
        stabilizer_pcb_cutout(spacing);
        switch_socket_cutout([1,1,1+margin*unit*mm,1+margin*unit*mm]);
    }
}

module stabilizer_pcb_ChocV2(spacing=2u) {
    margin = (spacing[0]-1)/2;
    difference() {
        union() {
            stabilizer_pcb_base_ChocV2([1,2,0,0], spacing);
            switch_socket_base([1,1,1+margin*unit*mm,1+margin*unit*mm]);
        }
        switch_socket_cutout([1,1,1+margin*unit*mm,1+margin*unit*mm]);
        stabilizer_PCB_cutout_ChocV2(spacing);
    }
}

    
module stabilizer_plate(spacing=2u, thickness=plate_thickness) {
    linear_extrude(thickness, center=true)
    difference() {
        stabilizer_plate_footprint([1,1,1,1], spacing);
        stabilizer_plate_cutout_footprint(spacing);
        switch_plate_cutout_footprint();
    }
}


module stabilizer_pcb_base(borders=[1,2,0,0], spacing=2u) {
    module single_base() {
        translate([0,-v_unit/2,0])
            border(
                [7.5,1*unit],
                [borders[0]-1,max(borders[1]-1,1),0,0],
                pcb_thickness,
                h_border_width,
                v_border_width
            );
    }
    stabilizer_layout(spacing)
        single_base();
}


module stabilizer_pcb_base_ChocV2(borders=[1,2,0,0], spacing=2u) {
    module single_base() {
        translate([0,-v_unit/2,0])
            border(
                [10,1*unit],
                [borders[0]-1,max(borders[1]-1,1),0,0],
                pcb_thickness,
                h_border_width,
                v_border_width
            );
//        translate([4.5,-v_unit-2.05,0])
//            #cube([15,4.2,pcb_thickness/2]);
    }
    stabilizer_layout(spacing)
        single_base();
}

module stabilizer_pcb_cutout(spacing=2u) {
    module pcb_mount_cutout() {
        translate([0,-v_unit/2,-pcb_thickness/2]) {
            translate([0,6.985,0]) {
                cylinder(d=3.5, h=pcb_thickness+1);
                translate([0,0,-2.5]) cylinder(d=4*1.1, h=pcb_thickness);
            }
            translate([0,-8.255,0]) {
                bottom_cutout_diameter = 4.5;
                translate([0,0,-0.5]) hull() {
                    cylinder(d=bottom_cutout_diameter, h=pcb_thickness+1);
                    translate([-bottom_cutout_diameter/2,-bottom_cutout_diameter/2,0]) cube([bottom_cutout_diameter,bottom_cutout_diameter/2,pcb_thickness+1]);
                }
                translate([0,0,-1.2]) hull() {
                    cylinder(d=bottom_cutout_diameter, h=pcb_thickness);
                    translate([0,-1,0]) cylinder(d=bottom_cutout_diameter, h=pcb_thickness);
                }
            }
        }
    }
    module plate_mount_cutout() {
    }
    stabilizer_layout(spacing) {
        if (stabilizer_type == "pcb") {
            pcb_mount_cutout();
        } else if (stabilizer_type == "plate") {
            plate_mount_cutout();
        } else {
            assert(false, "stabilizer_type is invalid");
        }
    }
}


module stabilizer_plate_footprint(borders=[1,1,1,1], spacing=2u) {
    translate([unit/2,-v_unit/2,0])
    border_footprint(
        [spacing[0]*h_unit,v_unit],
        [for (b=borders) b-1]
    );
}

module stabilizer_plate_cutout_footprint(spacing=2u) {
    module pcb_mount_cutout() {
        // Same profile works for both
        plate_mount_cutout();
    }
    module plate_mount_cutout() {
        total_width = spacing[1] + spacing[2];
        wire_cutout_width = spacing == 2u
            ? unit/2
            : unit/4;
        translate([0,-v_unit/2,0]) {
            translate([-3.6,-6.604,0]) square([7.2, 12.2936]);
            translate([-1.524,-7.7724,0]) square([3.048, 2]);
            translate([-4.191,-0.508,0]) square([4.191, 2.794]);
            translate([0,-wire_cutout_width/2,0]) square([total_width, wire_cutout_width]);
        }
    }
    stabilizer_layout(spacing) {
        if (stabilizer_type == "pcb") {
            pcb_mount_cutout();
        } else if (stabilizer_type == "plate") {
            plate_mount_cutout();
        } else {
            assert(false, "stabilizer_type is invalid");
        }
    }
}

module stabilizer_PCB_cutout_ChocV2(spacing=2u) {
    module pcb_mount_cutout() {
        // Same profile works for both
        plate_mount_cutout();
    }
    module plate_mount_cutout() {
        total_width = spacing[1] + spacing[2];
        wire_cutout_width = spacing == 2u
            ? unit/2
            : unit/4;
        translate([0,-v_unit/2,0]) {
            translate([-3.6,-6.604,-5]) cube([7.2, 12.2936,10]);
            translate([-1.524,-7.7724,-5]) cube([3.048, 2,10]);
            translate([-1.3,5.6,-4.5]) cube([2.5,1,5]);
            translate([-4.191,0,-5]) cube([4.191*2, 2.794,10]);
            translate([-4.191,-10.05,-5]) cube([4.191*2+v_unit, 3.794,5]);
            translate([3,-10.05,-6]) cube([v_unit, 5.794,5]);
        }
    }
    stabilizer_layout(spacing) {
        if (stabilizer_type == "pcb") {
            pcb_mount_cutout();
        } else if (stabilizer_type == "plate") {
            plate_mount_cutout();
        } else {
            assert(false, "stabilizer_type is invalid");
        }
    }
}


module stabilizer_plate_base(borders=[1,1,1,1], spacing=2u, thickness=plate_thickness) {
    linear_extrude(thickness, center=true)
        stabilizer_plate_footprint(borders, spacing);
}

module stabilizer_plate_cutout(spacing=2u, thickness=plate_thickness) {
    linear_extrude(thickness+1, center=true)
        stabilizer_plate_cutout_footprint(spacing);
}

//stabilizer_pcb(2u);
//stabilizer_plate(2u);
//stabilizer_pcb_ChocV2(2u);