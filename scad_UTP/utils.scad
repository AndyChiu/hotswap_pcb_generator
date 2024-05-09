include <parameters.scad>
include <default_layout.scad>
include <layout.scad>
include <stabilizer_spacing.scad>


// Determine whether to invert the layout
switch_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_switch_layout, false))
    : set_defaults(base_switch_layout, false);
plate_layout_final = [
    for (group = base_plate_layout)
        invert_layout_flag
            ? invert_layout(set_defaults(group, ["switch"]))
            : set_defaults(group, ["switch"])
];
mcu_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_mcu_layout))
    : set_defaults(base_mcu_layout);
trrs_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_trrs_layout))
    : set_defaults(base_trrs_layout);
stab_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_stab_layout))
    : set_defaults(base_stab_layout, 2u);
standoff_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_standoff_layout, standoff_config_default))
    : set_defaults(base_standoff_layout, standoff_config_default);
via_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_via_layout, via_shape))
    : set_defaults(base_via_layout, via_shape);
ec11_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_ec11_layout))
    : set_defaults(base_ec11_layout);
evqwgd001_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_evqwgd001_layout))
    : set_defaults(base_evqwgd001_layout);
microswitch_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_microswitch_layout))
    : set_defaults(base_microswitch_layout);

// Moves the flat part to the top if layout is row-staggered so column wires
// can be routed. PCB should be printed upside down in this case.
border_z_offset =
    layout_type == "column"
    ? -1
    : layout_type == "row"
        ? 1
        : assert(false, "layout_type parameter is invalid");

// Tweaks to make wire channels connect properly depending on the key alignment
row_cutout_length =
    layout_type == "column"
//    ? h_unit+1
    ? 1000
    : layout_type == "row"
        ? 1000
        : assert(false, "layout_type parameter is invalid");

col_cutout_length =
    layout_type == "column"
    ? 1000
    : layout_type == "row"
        ? 1000
        : assert(false, "layout_type parameter is invalid");

switch_rotation =
    switch_orientation == "south"
    ? 0
    : switch_orientation == "north"
        ? 180
        : assert(false, "switch_orientation is invalid");



//unit、h_unit、v_unit 尺寸與版面設定的比例
unit_ratio = unit/base_pcb_layout_unit_size;
// Horizontal unit size (18mm for choc keycaps)
h_unit_ratio = h_unit/base_pcb_layout_h_unit_size;
// Vertical unit size Ratio to layout settings
v_unit_ratio = v_unit/base_pcb_layout_v_unit_size;



// Useful for manipulating layout elements
function slice(array, bounds, extra_data_override="") = [
    let(
        lower = bounds[0] >= 0 ? bounds[0] : max(len(array)+bounds[0], 0),
        upper = bounds[1] > 0 ? min(bounds[1], len(array)) : len(array)+bounds[1],
        step = len(bounds) == 3 ? bounds[2] : 1
    )
    for (i = [lower:step:upper-1])
       (len(array[i]) >= 2 && extra_data_override != "")
            ? [array[i][0], array[i][1], extra_data_override, array[i][3]]
            : array[i]
];

function set_defaults(layout, extra_data_default=[]) = [
    for (item = layout)
        let(
            location = len(item[0]) == 3
                ? item[0]
                : len(item[0]) == 2
                    ? [item[0][0],item[0][1],[0,0,0]]
                    : [item[0][0],1,[0,0,0]],
            borders = len(item) >= 2
                ? item[1]
                : [1,1,1,1],
            extra_data = len(item) == 3
                ? item[2]
                : extra_data_default
        )
        [
            location,
            borders,
            extra_data
        ]
];

function invert_borders(borders, invert=true) =
    invert
        ? [borders[0], borders[1], borders[3], borders[2]]
        : borders;

function invert_layout(layout) = [
    for (item = layout)
        let(
            location = item[0],
            borders = item[1],
            extra_data = item[2]
        )
        [
            [
                [-location[0][0]-location[1], location[0][1]],
                location[1],
                [-location[2][0], -location[2][1], location[2][2]],
            ],
            invert_borders(borders),
            extra_data
        ]
];

module layout_pattern(layout,pattern_type="") {
    union() {
        for (item = layout) {
            location = item[0];
            $borders = item[1];
            $extra_data = item[2];
            
//            echo("location:",location);
//            echo("$borders:",$borders);
//            echo("$extra_data:",$extra_data);

//            echo("location:",item[0]);
//     (extra_data = rotate_column, switch_type,srp="N",rx=0,ry=0,h=0,w=1)
            
            srp=item[2][2][0];
            keycapLegend=item[2][3];
            if (srp==undef || !base_pcb_layout_ApyAdjSwitchAngleAndHeight) {

                switch_offset = (location[1]-1)/2;  // Coordinate offset based on key shape
                if (pattern_type=="mcu_cutout") {
                    
                    translate([location[2][1]*h_unit+mcu_socket_width/2+1,-location[2][2]*v_unit-mcu_socket_length-2,-pcb_thickness/2-0.01]) {
                        rotate([0,0,location[2][0]]) {
                            translate([(location[0][0]-location[2][1]-switch_offset)*h_unit,
                                       (location[2][2]-location[0][1])*v_unit,
                                       0]) {
                                #cube([mcu_socket_width,mcu_socket_length,pcb_thickness/2+0.02]);
                            }
                        }
                    }
                } else {
                    translate([location[2][1]*h_unit,-location[2][2]*v_unit,0]) {
                        rotate([0,0,location[2][0]]) {
                            translate([(location[0][0]-location[2][1]+switch_offset)*h_unit,
                                       (location[2][2]-location[0][1])*v_unit,
                                       0]) {
                                children();
                                           if (base_pcb_layout_ShowKeycapLegend) {
                                translate([0+h_unit/2-3,-v_unit/2,base_pcb_layout_ShowKeycapLegend_H+2])     
                                    color("Black") %text(keycapLegend,size=3);
                            }
                            }
                        }
                    }
                }
            
            } else {

            h=item[2][2][3];
            w=item[2][2][4];
                
            rz=0;
            pz=-2;
            
            bx=item[2][2][5];
            by=item[2][2][6];
            bz=2;
                
            rx =
                srp == "N"
                ? 0
                : srp == "LU"
                    ? item[2][2][1]
                : srp == "L"
                    ? 0
                : srp == "LD"
                    ? -item[2][2][1]
                : srp == "U"
                    ? item[2][2][1]
                : srp == "D"
                    ? -item[2][2][1]                   
                : srp == "RU"
                    ? item[2][2][1]
                : srp == "R"
                    ? 0
                : srp == "RD"
                    ? -item[2][2][1]
                : "";
            ry =
                srp == "N"
                ? 0
                : srp == "LU"
                    ? item[2][2][2]
                : srp == "L"
                    ? item[2][2][2]
                : srp == "LD"
                    ? item[2][2][2]
                : srp == "U"
                    ? 0
                : srp == "D"
                    ? 0                   
                : srp == "RU"
                    ? -item[2][2][2]
                : srp == "R"
                    ? -item[2][2][2]
                : srp == "RD"
                    ? -item[2][2][2]
                : "";

            px =
                srp == "N"
                ? v_unit
                : srp == "LU"
                    ? bx
                : srp == "L"
                    ? bx
                : srp == "LD"
                    ? bx
                : srp == "U"
                    ? bx
                : srp == "D"
                    ? bx                  
                : srp == "RU"
                    ? 0
                : srp == "R"
                    ? 0
                : srp == "RD"
                    ? 0
                : "";

            py =
                srp == "N"
                ? -h_unit
                : srp == "LU"
                    ? -by
                : srp == "L"
                    ? -by
                : srp == "LD"
                    ? 0
                : srp == "U"
                    ? -by
                : srp == "D"
                    ? 0                  
                : srp == "RU"
                    ? -by
                : srp == "R"
                    ? -by
                : srp == "RD"
                    ? 0
                : "";    
            //左上 LU (+x,+y) (px,-py)
            //左 L    (0,+y) (px,-py)
            //左下 LD (-x,+y) (px,0)
            //上 U    (+x,0) (px,-py)
            //無 N    (0,0)  (px,-py)
            //下 D    (-x,0) (px,0)
            //右上 RU (+x,-y) (0,-py)
            //右 R    (0,-y) (0,-py)
            //右下 RD (-x,-y) (0,0)


            
//            echo("srp:",srp);
//            echo("rx,ry,rz:",rx,ry,rz);
//            echo("px,py,pz:",px,py,pz);
//            echo("bx,by,bz:",bx,by,bz);
//            echo("w:",w);
//            echo("h:",h);

            switch_offset = (location[1]-1)/2;  // Coordinate offset based on key shape


            translate([location[2][1]*h_unit,-location[2][2]*v_unit,0]) {
                rotate([0,0,location[2][0]]) {
                    translate([(location[0][0]-location[2][1]+switch_offset)*h_unit,
                               (location[2][2]-location[0][1])*v_unit,
                               0]) {
                    if (pattern_type=="switch_socket_cutout") {
                        rotate_p([rx,ry,rz], [px,py,pz+h]) 
                        translate([0,0,h]){
                            children();  
                                          }                      
                    } else if (pattern_type=="switch_socket_base_cutout") {
                        translate([0,-1*by,-1*bz-0.01]) 
                        cube([bx,by,bz+0.02]);
                       
                    } else {
                        difference() {
                            union() {

                                //建立突起的部分
                                hull(){
                                    rotate_p([rx,ry,rz], [px,py,pz+h]) 
                                    translate([0,-1*by,-1*bz+h]) 
                                    cube([bx,by,bz]);

                                    translate([0,-1*by,-1*bz]) 
                                    cube([bx,by,bz]);
                                }
                                
                                //建立choc基座
                                rotate_p([rx,ry,rz], [px,py,pz+h]) 
                                translate([0,0,h])
                                    children();

                            }
                            
                            //掏空突起部分的內部，預留 w mm壁厚度
                            hull(){
                                rotate_p([rx,ry,rz], [px,py,pz-2+h]) 
                                translate([w,-1*by+w,-1*bz-2+h]) 
                                cube([bx-(w*2),by-(w*2),bz+0.01]);

                                translate([w,-1*by+w,-1*bz-2]) 
                                cube([bx-(w*2),by-(w*2),bz]);
                            }
                        }
                        if (base_pcb_layout_ShowKeycapLegend) {
                            ShowKeycapLegend_H_add =
                                  base_pcb_layout_ShowVKeycap == true
                                    ? VKeySwitch_Size[2]+VKeycap_Size[2]
                                : base_pcb_layout_ShowVKeySwitch == true
                                    ? VKeySwitch_Size[2]
                                : 0;
                            rotate_p([rx,ry,rz], [px,py,pz+h]) 
                                translate([0+h_unit/2-3,-1*by+v_unit/2,h+base_pcb_layout_ShowKeycapLegend_H+ShowKeycapLegend_H_add+2])     
                                color("Black") %text(keycapLegend,size=3);
                        }
                                       
                        }
                    }
                }
            }
            
            }

//            if (base_pcb_layout_ShowKeycapLegend) {
//                switch_offset = (location[1]-1)/2;
//                        translate([location[2][1]*h_unit+h_unit/2,-location[2][2]*v_unit-v_unit/2,0]) {
//                            rotate([0,0,location[2][0]]) {
//                                    translate([(location[0][0]-location[2][1]+switch_offset)*h_unit,
//                                           (location[2][2]-location[0][1])*v_unit,
//                                           12]) {     
//                                                color("Black") %text(keycapLegend,size=3);
//                                               }
//                                     
//                                     }
//                                }
//                            }
        }
    }
}

module border(base_size, borders, thickness, h_unit=1, v_unit=1) {
    linear_extrude(thickness, center=true)
        border_footprint(base_size, borders, h_unit, v_unit);
}

module border_footprint(base_size, borders, h_unit=1, v_unit=1) {
    translate([
        h_unit/2 * (borders[3] - borders[2]),
        v_unit/2 * (borders[0] - borders[1]),
        0
    ]) {
        square([
            base_size[0]+h_unit*(borders[2]+borders[3])+0.001,
            base_size[1]+v_unit*(borders[0]+borders[1])+0.001
        ], center=true);
    }
}


// 曲面倒角
module chamfer(length,width,height) {
    $fn=40;
    translate([-length/2,-width/2,height/2]) {
        rotate([0,90.0]) {
            resize([height,width,length]) {
            difference(){
            cube([2,2,10]);
            cylinder(h=10*2,r=2,center=true);
            }
            }
        }
    }
}


//直角三角形
module right_triangle(length, width, height,rx=0,ry=0,rz=0) {

    points = [
        [0, 0],
        [length, 0],
        [0, height]
    ];
    translate([-length/2,-width/2,-height/2]) {
    rotate([90+rx,0+ry,0+rz]) {
    linear_extrude(width,center=true) {
        polygon(points);
    }
    }
}
}


//在指定位置旋轉
//Rotate at specified position
module rotate_p(a, orig) 
{
    translate(orig)
    rotate(a)
    translate(-orig)
    children();
}
