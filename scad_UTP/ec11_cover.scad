include <parameters.scad>
include <utils.scad>

//EC11
ec11_socket_size = 14;
ec11_plate_cutout_size=11.8;
ec11_pin_lenght=3.5;
ec11_base_add_thickness= ec11_pin_lenght-(pcb_thickness-2);

module ec11_socket(borders=[1,1,1,1], rotate_column=false) {
    difference() {
        ec11_socket_base(borders);
        ec11_socket_cutout(borders, rotate_column);
    }
}

module ec11_socket_base(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,ec11_base_add_thickness/2]) {
        #cube([ec11_socket_size, ec11_socket_size, ec11_base_add_thickness], center=true);
        }
    //螺絲孔座
    for (x = [1,8.5+8.5+1]) {
        for (y = [-1,-8.5-8.5-1]) {
            //底部槽
            translate([x,y,0]) {
                cylinder(d=6, h=ec11_base_add_thickness,$fn=100);
            }
        }
    }        
    translate([h_unit/2,-v_unit/2,border_z_offset * 1])
            border(
                [ec11_socket_size,ec11_socket_size], 
                borders, 
                pcb_thickness-2, 
                h_border_width+3, 
                v_border_width+3
            );

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
                        cube([1,2.5,pcb_thickness+1+socket_depth],true);                         
                }
                for (x = [-5,5]) {
                    //底部槽
                    translate([x,0,-wire_diameter/2-wire_diameter])
                        cube([1,2.5,wire_diameter],true);                           
                }                
                //基座長寬 11.8
                //針腳距離14.8 x 12.5   
                //針腳 0.7
                //兩針之間距離5
                for (x = [-2.5,2.5]) {                     
                    translate([x,7.5,(pcb_thickness+1)/2])
                        rotate([180,0,0])
                            cylinder(h=pcb_thickness+1,r=0.8,$fn=30);
                   
                    translate([x,4.5,(pcb_thickness+1)/2])
                        rotate([180,0,0])
                            cylinder(h=pcb_thickness+1,r=0.8,$fn=30);

                    //底部線槽
                    translate([x,6,-wire_diameter/2-wire_diameter*1.25])
                        cube([wire_diameter,3,wire_diameter/2],true);                    
                }
                
                //三針一樣,只是多一針在中央,
                // Bottom switch pin                
                for (x = [-2.5,0,2.5]) {
                    translate([x,-7.5,(pcb_thickness+1)/2])
                        rotate([180,0,0])
                            cylinder(h=pcb_thickness+1,r=0.8,$fn=30);

                    translate([x,-4.5,(pcb_thickness+1)/2])
                        rotate([180,0,0])
                            cylinder(h=pcb_thickness+1,r=0.8,$fn=30);

                    //直線槽
                    translate([x,0,wire_diameter/2+ec11_base_add_thickness-wire_diameter*0.9])
                        rotate([90,90,0])
                            cylinder(h=ec11_socket_size,d=wire_diameter,center=true,$fn=40);                   
                    translate([x,0,wire_diameter/2+ec11_base_add_thickness-wire_diameter*1.25])
                        cube([wire_diameter,ec11_socket_size,wire_diameter/2],true);
                    
                    //底部線槽
                    translate([x,-6,-wire_diameter/2-wire_diameter*1.25])
                        cube([wire_diameter,3,wire_diameter/2],true); 
                    }
                //橫線槽        
                for (y = [-4.5,-2.5,2.5,4.5]) {
                    translate([0,y,wire_diameter/2+ec11_base_add_thickness-wire_diameter*0.9])
                        rotate([0,90,0])
                            cylinder(h=ec11_socket_size,d=wire_diameter,center=true,$fn=40);                            
                    translate([0,y,wire_diameter/2+ec11_base_add_thickness-wire_diameter*1.25])
                        cube([ec11_socket_size,wire_diameter,wire_diameter/2],true);                   
                }
                //螺絲孔 M2
                for (x = [-8.5,8.5]) {
                    for (y = [8.5,-8.5]) {
                        //底部槽
                        translate([x,y,-pcb_thickness/2]) {
                                cylinder(d=2*1.1, h=pcb_thickness+1,$fn=20);
                                translate([0,0,-2.5]) cylinder(d=4.1*1.1, h=pcb_thickness,$fn=20);
                        }
            
                    }
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

module ec11_upper_covert() {
/*
    使用 M2x3x3.5 熱壓螺母
        M2x6mm 螺絲
    
    */    
    
    //比對用
//    %translate([0,0,3.5]){
//        ec11_socket();  
//        //ec11_socket_base();
//    }

    difference(){
        union(){
        //主框
        translate([h_unit/2,-v_unit/2,(ec11_base_add_thickness+wire_diameter/2)+6.5]) {     
            cube([ec11_socket_size+1.5,ec11_socket_size+1.5,6.5+ec11_base_add_thickness-wire_diameter],center=true);
            }
        //次框
        translate([h_unit/2,-v_unit/2,(ec11_base_add_thickness)+4.5+0.5]) {
            cube([7+1,16.5+1,5],center=true);
        }   
            //螺絲孔座延伸到中央的延伸臂
            translate([0,0,(ec11_base_add_thickness)+7]) {
                for (x = [1,8.5+8.5+1]) {
                    for (y = [-1,-8.5-8.5-1]) {
                        hull($fn=100){
                            translate([x,y,-6/2]) {
                                cylinder(d=6, h=4,$fn=100);
                            }
                            translate([h_unit/2,-v_unit/2,1.15]) {
                                cylinder(d=18, h=3.5,$fn=100);
                            }
                        }
                    }
                }
            } 

        }
        
        //挖除EC11本體空間
        translate([h_unit/2,-v_unit/2,(ec11_base_add_thickness)+6.1]) {
            cube([12*1.1,12*1.1,7.5+1],center=true);
        }
        //挖除底座空間
        translate([h_unit/2,-v_unit/2,(ec11_base_add_thickness)+3.25]) {
            cube([ec11_socket_size+0.2,ec11_socket_size+0.2,ec11_base_add_thickness],center=true);
        }
        //挖除次框空間
        translate([h_unit/2,-v_unit/2,(ec11_base_add_thickness)+4.5]) {
            cube([6.5,16.5,5.1],center=true);
        }
        //中央開洞
        translate([h_unit/2,-v_unit/2,(ec11_base_add_thickness)+6.5]) {
            cylinder(d=7, h=10,$fn=50);
        }
        
        //螺絲孔
        translate([0,0,(ec11_base_add_thickness)+6.995]) {
            for (x = [1,8.5+8.5+1]) {
                for (y = [-1,-8.5-8.5-1]) {
                    translate([x,y,-6/2]) {
                        cylinder(d1=3.5*1.1,d2=3.5, h=3.5,$fn=50);
                    }
                }
            }
        } 
        //螺絲孔座削平
        translate([0,0,(ec11_base_add_thickness)+7]) {
            for (x = [1,8.5+8.5+1]) {
                for (y = [-1,-8.5-8.5-1]) {

                    translate([x,y,-6/2-2]) {
                        cylinder(d=6, h=2,$fn=100);
                    }
                }
            }
        } 
            
        //頂部凹槽
        translate([0,0,6.5*2-0.8]) {
            for (x = [19/2]) {
                for (y = [-4+0.05,-8.5-8.5+2-0.05]) {
                    translate([x,y,-6/2]) {
                        cube([2,1,6.5],center=true);
                    }
                }
            }
        }
    
    }
}

ec11_upper_covert();