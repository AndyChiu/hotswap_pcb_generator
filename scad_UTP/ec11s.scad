include <parameters.scad>
include <utils.scad>

//EC11
ec11_socket_size = 18;
ec11_plate_cutout_size=11.8;
ec11_pin_lenght=3.5;
ec11_height = 4.5;
ec11_base_add_thickness= ec11_pin_lenght -(pcb_thickness-2) + pcb_thickness/4;

module ec11_socket(borders=[1,1,1,1], rotate_column=false) {
    difference() {
        ec11_socket_base(borders);
        ec11_socket_cutout(borders, rotate_column);
    }


}

module ec11_socket_base(borders=[1,1,1,1]) {
//    translate([h_unit/2,-v_unit/2,ec11_height/2-pcb_thickness/4]) {
//        cube([ec11_socket_size, ec11_socket_size+2, ec11_base_add_thickness], center=true);
    translate([h_unit/2,-v_unit/2,ec11_height/2-pcb_thickness/4]) {
        cubeRC([ec11_socket_size, ec11_socket_size+2, ec11_height], center=true);
        }
    translate([h_unit/2,-v_unit/2,border_z_offset * 1])
            border(
                [ec11_socket_size,ec11_socket_size], 
                borders, 
                pcb_thickness-2, 
                h_border_width+3, 
                v_border_width+3
            );
    if ($preview==true && base_pcb_layout_Preview_Show_EC11_Knob==true) {
        translate([h_unit/2,-v_unit/2,11.5])
        %hull()
        {//Bottle Cap
        translate([0,0,8.8])
        cylinder(h=0.01,d=26,center=true,$fn=21);
        cylinder(h=0.01,d=29.6,center=true,$fn=21);
        }
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

    translate([h_unit/2,-v_unit/2,ec11_height/2-pcb_thickness/4])
    union()
    {
    //EC11使用空間
    cube([11.8+0.2 ,12.1+0.2 ,ec11_height+0.01],center=true);
    cube([ 8.7+0.2 ,13+0.2   ,ec11_height+0.01],center=true);
    cube([7,15.5,ec11_height+0.01],center=true);

//    translate([0,0,1.2])
//    cube([7,ec11_socket_size,ec11_height],center=true);

    //固定座空位
    cube([15.3+0.3, 1.8+0.3, ec11_height+0.01],center=true);

    //中央下凹
//    translate([0,0,-0.5])
//    cube([6,1.2,ec11_height+0.5],center=true);

    //中央圓孔
    translate([0,0,-1])
    cylinder(h=ec11_height+0.01+1, d=6, center=true,$fn=200);

    }


    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                
                //基座長寬 11.8
                //針腳距離14.8 x 12.5   
                //針腳 0.7
                //兩針之間距離5
                
                //三針一樣,只是多一針在中央
                // Bottom switch pin
                for (x = [-2.5,2.5]) {
                        
                    translate([x,7.5+0.4,(ec11_height)-pcb_thickness/2+pcb_thickness/4])
                        rotate([180,0,0])
                            cylinder(h=ec11_height+pcb_thickness/4+0.01,r=0.8);

                    translate([x,9.8+0.5,(ec11_height)-pcb_thickness/2+pcb_thickness/4])
                        rotate([180,0,0])
                            cylinder(h=ec11_height+pcb_thickness/4+0.01,r=0.8);
                    translate([x,(ec11_socket_size+2-3)/2,ec11_height-wire_diameter/2-pcb_thickness/4])
                        cube([wire_diameter,2.5,wire_diameter],true);                   
                    translate([x,(ec11_socket_size+2-3)/2,-(pcb_thickness)/2+wire_diameter/2])
                        cube([wire_diameter,2.5,wire_diameter],true);                   
                   
                }
                for (x = [-2.5,0,2.5]) {
                        
                    translate([x,-7.5-0.4,(ec11_height)-pcb_thickness/2+pcb_thickness/4])
                        rotate([180,0,0])
                            cylinder(h=ec11_height+pcb_thickness/4+0.01,r=0.8);
                    translate([x,-9.8-0.5,(ec11_height)-pcb_thickness/2+pcb_thickness/4])
                        rotate([180,0,0])
                            cylinder(h=ec11_height+pcb_thickness/4+0.01,r=0.8);

                    translate([x,-(ec11_socket_size+2-3)/2,ec11_height-wire_diameter/2-pcb_thickness/4])
                        cube([wire_diameter,2.5,wire_diameter],true);                   
                    translate([x,-(ec11_socket_size+2-3)/2,-(pcb_thickness)/2+wire_diameter/2])
                        cube([wire_diameter,2.5,wire_diameter],true);                   
                }

                //EC11 4角落挖洞
                for (x = [-6,6]) {
                    for (y = [-6.15,6.15]) {
                        
                    translate([x,y,(pcb_thickness+4.6)/2])
                        rotate([180,0,0])
                            cylinder(h=pcb_thickness+4.6,r=0.8);

                   }
                }
                

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



//TEST
//translate([h_unit/2,-v_unit/2,4.5/2-pcb_thickness/4])
//union()
//{
//cube([12,12,4.5],center=true);
//
//translate([0,0,-4.5/2+1.5/2])
//cube([7,15.8,1.5],center=true);
//
//translate([0,0,-4.5/2+1.5/2])
//cube([16,2,1.5],center=true);
//}