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
                [-location[0][0]-location[1][0], location[0][1]],
                [location[1][1],location[1][0]],
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

                switch_offset = (location[1][0]-1)/2;  // Coordinate offset based on key shape
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
                                                ShowKeycapLegend_H_add =
                                                      base_pcb_layout_ShowVKeycap == true
                                                        ? VKeySwitch_Size[2]+VKeycap_Size[2]
                                                    : base_pcb_layout_ShowVKeySwitch == true
                                                        ? VKeySwitch_Size[2]
                                                    : 0;
                                                translate([0+h_unit/2-3,-v_unit/2,base_pcb_layout_ShowKeycapLegend_H+ShowKeycapLegend_H_add+2])     
 color("Black") %text(keycapLegend,size=3);
                            }
                            
                            
    //檢測用
    if (base_pcb_layout_ShowVKeySwitch && pattern_type=="switch_socket_base_cutout") {
        //軸體 [VKeySwitch_Size_x,VKeySwitch_Size_y,VKeySwitch_Size_z]
        %translate([h_unit/2,-v_unit/2,(pcb_thickness+VKeySwitch_Size[2])/2])
            cube([VKeySwitch_Size[0],VKeySwitch_Size[1],VKeySwitch_Size[2]],center=true);   
    }
    
    if (base_pcb_layout_ShowVKeycap && pattern_type=="switch_socket_base_cutout") {
        //鍵帽 [VKeycap_Size_x,VKeycap_Size_y,VKeycap_Size_z]
        %translate([(h_unit)/2,-v_unit/2,(pcb_thickness+VKeycap_Size[2])/2+VKeySwitch_Size[2]])
            color(VKeycap_Color,VKeycap_Alpha) cube([VKeycap_Size[0]*location[1][0],VKeycap_Size[1]*location[1][1],VKeycap_Size[2]],center=true);
    }                            
                            
                            
                            }
                        }
                    }
                }
            
            } else {

            w=item[2][2][4];
                
            //rz=0;
            pz=-2;
            
            bx=item[2][2][5];
            by=item[2][2][6];
            bz=2;
            bod=item[2][2][7];
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
                : srp == ""
                    ? 0 
                 : "" ; 
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
                : srp == ""
                    ? 0 
                 : "" ; 
            rz =
                srp == "N"
                ? 0
                : srp == "LU"
                    ? 0
                : srp == "L"
                    ? 0
                : srp == "LD"
                    ? 0
                : srp == "U"
                    ? 0
                : srp == "D"
                    ? 0                   
                : srp == "RU"
                    ? 0
                : srp == "R"
                    ? 0
                : srp == "RD"
                    ? 0
                : srp == ""
                    ? 0 
                 : "" ; 

            px =
                srp == "N"
                ? v_unit
                : srp == "LU"
                    ? h_unit
                : srp == "L"
                    ?  h_unit
                : srp == "LD"
                    ? h_unit
                : srp == "U"
                    ? h_unit
                : srp == "D"
                    ? h_unit                  
                : srp == "RU"
                    ? 0
                : srp == "R"
                    ? 0
                : srp == "RD"
                    ? 0
                : srp == ""
                    ? 0 
                : "" ;  
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
                : srp == ""
                    ? 0 
                : "" ;     

            
            h =
                srp == "N"
                ? item[2][2][3]
                : srp == "LU"
                    ? item[2][2][3]
                : srp == "L"
                    ? item[2][2][3]
                : srp == "LD"
                    ? item[2][2][3]
                : srp == "U"
                    ?item[2][2][3]
                : srp == "D"
                    ? item[2][2][3]                 
                : srp == "RU"
                    ? item[2][2][3]
                : srp == "R"
                    ? item[2][2][3]
                : srp == "RD"
                    ? item[2][2][3]
                : srp == ""
                    ? 0 
                 : "" ; 
                 
            bodx =
                bod == "C"
                ? -(bx-unit)/2
                : bod == "LU"
                    ? -(bx-unit-(unit/2*(location[1][0]-1)))
                : bod == "L"
                    ? -(bx-unit-(unit/2*(location[1][0]-1)))
                : bod == "LD"
                    ? -(bx-unit-(unit/2*(location[1][0]-1)))
                : bod == "U"
                    ? -(bx-unit)/2
                : bod == "D"
                    ? -(bx-unit)/2
                : bod == "RU"
                    ? -(unit/2*(location[1][0]-1))
                : bod == "R"
                    ? -(unit/2*(location[1][0]-1))
                : bod == "RD"
                    ? -(unit/2*(location[1][0]-1))
                : bod == ""
                    ? 0
                : "" ; 

            body =
                bod == "C"
                ? (by-unit)/2
                : bod == "LU"
                    ? (by-unit)-(unit/2*(location[1][1]-1))
                : bod == "L"
                    ? (by-unit)/2
                : bod == "LD"
                    ? (unit/2*(location[1][1]-1))
                : bod == "U"
                    ? (by-unit)-(unit/2*(location[1][1]-1))
                : bod == "D"
                    ? (unit/2*(location[1][1]-1))
                : bod == "RU"
                    ? (by-unit)-(unit/2*(location[1][1]-1))
                : bod == "R"
                    ? (by-unit)/2
                : bod == "RD"
                    ? (unit/2*(location[1][1]-1))
                : bod == ""
                    ? 0 
                : "" ;    

            bodxC=-(h_unit-unit)/2;
            bodyC=(v_unit-unit)/2;
                
            //左上 LU (+x,+y) (px,-py)
            //左 L    (0,+y) (px,-py)
            //左下 LD (-x,+y) (px,0)
            //上 U    (+x,0) (px,-py)
            //無 N    (0,0)  (px,-py)
            //下 D    (-x,0) (px,0)
            //右上 RU (+x,-y) (0,-py)
            //右 R    (0,-y) (0,-py)
            //右下 RD (-x,-y) (0,0)


            echo (item[2][3][0]);
            echo("srp:",srp);
            echo("rx,ry,rz:",rx,ry,rz);
            echo("px,py,pz:",px,py,pz);
            echo("bx,by,bz:",bx,by,bz);
            echo("w:",w);
            echo("h:",h);
            echo("bodx:",bodx);
            echo("body:",body);
            
            switch_offset = (location[1][0]-1)/2;  // Coordinate offset based on key shape


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
                        translate([0+bodx,-1*by+body,-1*bz-0.01]) 
                        cubeStyle([bx,by,bz+0.02],base_pcb_layout_RaisedSwitchBaseStyle);
                        
                    } else if (pattern_type=="switch_socket_base_cutout2") {
 
     
                        //掏空凸起部分的內部，預留 w mm壁厚度
                        //如果突起部分大小>unit,是否內部空腔要擴大
                        //不擴大,則用 h_unit 以及 v_unit 大小來掏空
                        if (base_pcb_layout_NoIncreaseInInternalCavity) {
                            hull(){
                                rotate_p([rx,ry,rz], [px,py,pz-2+h]) 
                                translate([w+bodxC,-1*v_unit+w+bodyC,-1*bz-2+h]) 
                                cubeStyle([h_unit-(w*2),v_unit-(w*2),bz+0.01],base_pcb_layout_RaisedSwitchBaseStyle);

                                translate([w+bodxC,-1*v_unit+w+bodyC,-1*bz-2]) 
                                cubeStyle([h_unit-(w*2),v_unit-(w*2),bz],base_pcb_layout_RaisedSwitchBaseStyle);
                            }
               
                        } else {
                            hull(){
                                rotate_p([rx,ry,rz], [px,py,pz-2+h]) 
                                translate([w+bodx,-1*by+w+body,-1*bz-2+h]) 
                                cubeStyle([bx-(w*2),by-(w*2),bz+0.01],base_pcb_layout_RaisedSwitchBaseStyle);

                                translate([w+bodx,-1*by+w+body,-1*bz-2]) 
                                cubeStyle([bx-(w*2),by-(w*2),bz],base_pcb_layout_RaisedSwitchBaseStyle);
                            }
                        }
                            
                    } else if (pattern_type=="switch_socket_base_cutout2MOD") {
 
     
                          //凸起部分的內部，預留 w mm壁厚度
                          //體積*0.95 切除底部1.5mm
                          //用於填充空間
                          iScale=0.95;
                          iCutBottom=1.5;
                          
                            difference(){
                            hull(){
                                rotate_p([rx,ry,rz], [px,py,pz-2+h]) 
                                translate([w+bodx,-1*by+w+body,-1*bz-2+h]) 
                                cubeStyle([(bx-(w*2))*iScale,(by-(w*2))*iScale,(bz+0.01)*iScale],base_pcb_layout_RaisedSwitchBaseStyle);

                                translate([w+bodx,-1*by+w+body,-1*bz-2]) 
                                cubeStyle([(bx-(w*2))*iScale,(by-(w*2))*iScale,bz*iScale],base_pcb_layout_RaisedSwitchBaseStyle);
                            }
                        
                                translate([w+bodx-1,-1*by+w+body-1,-1*bz-2-1]) 
                                cubeStyle([(bx-(w*2)*iScale)+2,(by-(w*2))*iScale+2,bz*iScale+1+iCutBottom],base_pcb_layout_RaisedSwitchBaseStyle);                        
                        }
                                                        
                            
                            
                    } else {
                        difference() {
                            union() {

                                //建立凸起的部分
                                hull(){
                                    //去除凸出底部的部分
                                    difference() {
                                        rotate_p([rx,ry,rz], [px,py,pz+h]) 
                                    translate([0+bodx,-1*by+body,-1*bz+h]) 
                                    cubeStyle([bx,by,bz],base_pcb_layout_RaisedSwitchBaseStyle);
                                        translate([0+bodx-2.5,-1*by+body-2.5,-1*bz-20]) 
                                    cube([bx+5,by+5,20]);
                                    }
                                    translate([0+bodx,-1*by+body,-1*bz]) 
                                    cubeStyle([bx,by,bz],base_pcb_layout_RaisedSwitchBaseStyle);
                                }
                                
                                //建立choc基座
                                rotate_p([rx,ry,rz], [px,py,pz+h]) 
                                translate([0,0,h])
                                    children();

                            }
                            
                            //掏空凸起部分的內部，預留 w mm壁厚度
//                            hull(){
//                                rotate_p([rx,ry,rz], [px,py,pz-2+h]) 
//                                translate([w,-1*by+w,-1*bz-2+h]) 
//                                cubeStyle([bx-(w*2),by-(w*2),bz+0.01],base_pcb_layout_RaisedSwitchBaseStyle);
//
//                                translate([w,-1*by+w,-1*bz-2]) 
//                                cubeStyle([bx-(w*2),by-(w*2),bz],base_pcb_layout_RaisedSwitchBaseStyle);
//                            }
                        }
                        if (base_pcb_layout_ShowKeycapLegend) {
                            ShowKeycapLegend_H_add =
                                  base_pcb_layout_ShowVKeycap == true
                                    ? VKeySwitch_Size[2]+VKeycap_Size[2]
                                : base_pcb_layout_ShowVKeySwitch == true
                                    ? VKeySwitch_Size[2]
                                : 0;
                            rotate_p([rx,ry,rz], [px,py,pz+h]) 
                                translate([0+h_unit/2-3,-1*by+v_unit/2+body,h+base_pcb_layout_ShowKeycapLegend_H+ShowKeycapLegend_H_add+2])     
                                color("Black") %text(keycapLegend,size=3);
                        }
                        
                        
    //檢測用
    if (base_pcb_layout_ShowVKeySwitch) {
        //軸體 [VKeySwitch_Size_x,VKeySwitch_Size_y,VKeySwitch_Size_z]
        rotate_p([rx,ry,rz], [px,py,pz+h]) 
        %translate([h_unit/2,-v_unit/2,(pcb_thickness+VKeySwitch_Size[2])/2+h])
            cube([VKeySwitch_Size[0],VKeySwitch_Size[1],VKeySwitch_Size[2]],center=true);   
    }
    
    if (base_pcb_layout_ShowVKeycap) {
        //鍵帽 [VKeycap_Size_x,VKeycap_Size_y,VKeycap_Size_z]
        rotate_p([rx,ry,rz], [px,py,pz+h]) 
        %translate([(h_unit)/2,-v_unit/2,(pcb_thickness+VKeycap_Size[2])/2+VKeySwitch_Size[2]+h])
            color(VKeycap_Color,VKeycap_Alpha) cube([VKeycap_Size[0]*location[1][0],VKeycap_Size[1]*location[1][1],VKeycap_Size[2]],center=true);
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

//Rounded Corners cube
//弧形邊緣的cube
module cubeRC(size,rc_size=2,center=false,cube_base=true,cube_top=false) {
    //size=[width,depth,height]
    //rc_size = Rounded Corners size
    
    width =size[0]-rc_size/2;
    depth = size[1]-rc_size/2;
    height =size[2]-rc_size;
        
//    width2 = center==true ? -size[0]/2 : 0;
//    depth2 = center==true ? -size[1]/2 : 0;
//    height2 = center==true ? -size[2]/2 : 0;  

//    //上層
//    t1 = center==true ? [-width/2,-depth/2,height/2] : [rc_size/2,rc_size/2,height+rc_size/2];
//    t2 = center==true ? [width/2,-depth/2,height/2] : [width+rc_size/2,rc_size/2,height+rc_size/2];
//    t3 = center==true ? [width/2,depth/2,height/2] : [width+rc_size/2,depth+rc_size/2,height+rc_size/2];
//    t4 = center==true ? [-width/2,depth/2,height/2] : [rc_size/2,depth+rc_size/2,height+rc_size/2];
//    //下層
//    b1 = center==true ? [-width/2,-depth/2,-height/2] : [rc_size/2,rc_size/2,rc_size/2];
//    b2 = center==true ? [width/2,-depth/2,-height/2] : [width+rc_size/2,rc_size/2,rc_size/2];
//    b3 = center==true ? [width/2,depth/2,-height/2] : [width+rc_size/2,depth+rc_size/2,rc_size/2];
//    b4 = center==true ? [-width/2,depth/2,-height/2] : [rc_size/2,depth+rc_size/2,rc_size/2];
//
//
//    t21 = center==true ? [-width/2,-depth/2,height/2] : [rc_size/2,rc_size/2,height+rc_size/2+rc_size/4];
//    t22 = center==true ? [width/2,-depth/2,height/2] : [width+rc_size/2,rc_size/2,height+rc_size/2+rc_size/4];
//    t23 = center==true ? [width/2,depth/2,height/2] : [width+rc_size/2,depth+rc_size/2,height+rc_size/2+rc_size/4];
//    t24 = center==true ? [-width/2,depth/2,height/2] : [rc_size/2,depth+rc_size/2,height+rc_size/2+rc_size/4];
//
//    b21 = center==true ? [-width/2,-depth/2,-height/2] : [rc_size/2,rc_size/2,rc_size/4];
//    b22 = center==true ? [width/2,-depth/2,-height/2] : [width+rc_size/2,rc_size/2,rc_size/4];
//    b23 = center==true ? [width/2,depth/2,-height/2] : [width+rc_size/2,depth+rc_size/2,rc_size/4];
//    b24 = center==true ? [-width/2,depth/2,-height/2] : [rc_size/2,depth+rc_size/2,rc_size/4];


    //上層
    t1 = center==true ? [-width/2+rc_size/4,-depth/2+rc_size/4,height/2] : [rc_size/2,rc_size/2,height+rc_size/2];
    t2 = center==true ? [width/2-rc_size/4,-depth/2+rc_size/4,height/2] : [width,rc_size/2,height+rc_size/2];
    t3 = center==true ? [width/2-rc_size/4,depth/2-rc_size/4,height/2] : [width,depth,height+rc_size/2];
    t4 = center==true ? [-width/2+rc_size/4,depth/2-rc_size/4,height/2] : [rc_size/2,depth,height+rc_size/2];
    //下層
    b1 = center==true ? [-width/2+rc_size/4,-depth/2+rc_size/4,-height/2] : [rc_size/2,rc_size/2,rc_size/2];
    b2 = center==true ? [width/2-rc_size/4,-depth/2+rc_size/4,-height/2] : [width,rc_size/2,rc_size/2];
    b3 = center==true ? [width/2-rc_size/4,depth/2-rc_size/4,-height/2] : [width,depth,rc_size/2];
    b4 = center==true ? [-width/2+rc_size/4,depth/2-rc_size/4,-height/2] : [rc_size/2,depth,rc_size/2];


    t21 = center==true ? [-width/2+rc_size/4,-depth/2+rc_size/4,height/2] : [rc_size/2,rc_size/2,height+rc_size/2+rc_size/4];
    t22 = center==true ? [width/2-rc_size/4,-depth/2+rc_size/4,height/2] : [width,rc_size/2,height+rc_size/2+rc_size/4];
    t23 = center==true ? [width/2-rc_size/4,depth/2-rc_size/4,height/2] : [width,depth,height+rc_size/2+rc_size/4];
    t24 = center==true ? [-width/2+rc_size/4,depth/2-rc_size/4,height/2] : [rc_size/2,depth,height+rc_size/2+rc_size/4];

    b21 = center==true ? [-width/2+rc_size/4,-depth/2+rc_size/4,-rc_size/4] : [rc_size/2,rc_size/2,rc_size/4];
    b22 = center==true ? [width/2-rc_size/4,-depth/2+rc_size/4,-rc_size/4] : [width,rc_size/2,rc_size/4];
    b23 = center==true ? [width/2-rc_size/4,depth/2-rc_size/4,-rc_size/4] : [width,depth,rc_size/4];
    b24 = center==true ? [-width/2+rc_size/4,depth/2-rc_size/4,rc_size/4] : [rc_size/2,depth,rc_size/4];

    
    hull($fa=1, $fs=0.1,$fn=50){
        
    translate(t1) sphere(rc_size/2); 
    translate(t2) sphere(rc_size/2); 
    translate(t3) sphere(rc_size/2); 
    translate(t4) sphere(rc_size/2); 
    //translate([0,0,-2]) cube([18+4,17+4,2],center=true); 
        
    translate(b1) sphere(rc_size/2); 
    translate(b2) sphere(rc_size/2); 
    translate(b3) sphere(rc_size/2); 
    translate(b4) sphere(rc_size/2); 
        
    if (cube_base==true) {
        translate(b21) cylinder(h=rc_size/2,r=rc_size/2,center=true); 
        translate(b22) cylinder(h=rc_size/2,r=rc_size/2,center=true); 
        translate(b23) cylinder(h=rc_size/2,r=rc_size/2,center=true); 
        translate(b24) cylinder(h=rc_size/2,r=rc_size/2,center=true); 
    }
    
    if (cube_top==true) {
        translate(t21) cylinder(h=rc_size/2,r=rc_size/2,center=true); 
        translate(t22) cylinder(h=rc_size/2,r=rc_size/2,center=true); 
        translate(t23) cylinder(h=rc_size/2,r=rc_size/2,center=true); 
        translate(t24) cylinder(h=rc_size/2,r=rc_size/2,center=true); 
    }    
    }
}

module cubeStyle(size,style) {
    if (style=="RoundedCorners") {
        cubeRC(size);
    } else {
        cube(size);
        }    
    }


module circleRC(diameter,height,rc_size=1,center=false,vertical_base=true,vertical_top=false,concave=false){
    //size=[width,depth,height]
    //rc_size = Rounded Corners size
    //vertical Corners
    
    height2=height-rc_size;
    
t1 = center==true ?  [0,0,0]:[diameter/2,diameter/2,height/2];

t2 = center==true ?  [0,0,-rc_size/2]:[diameter/2,diameter/2,0];

t3 = center==true ?  [0,0,0]:[diameter/2,diameter/2,rc_size/2];

    translate(t1)
    rotate_extrude($fn=100)
    if (concave==false) {
        translate([(diameter/2)-rc_size/2,0,0])
        union(){
            translate([-diameter/4+rc_size/2,0,0])
            square([diameter/2,height2],true);
            
            translate([-diameter/4+rc_size/4,height2/2,0])
            square([diameter/2-rc_size/2,rc_size],true);
            translate([0,height2/2,0])
            circle(d=rc_size,$fn=100); 

            translate([-diameter/4+rc_size/4,-height2/2,0])
            square([diameter/2-rc_size/2,rc_size],true);
            translate([0,-height2/2,0])
            circle(d=rc_size,$fn=100); 

            
            if (vertical_base==true) {
                translate([rc_size/4,-rc_size/4-height2/2,0])
                square([rc_size/2,rc_size/2],true);
                }
            if (vertical_top==true) {
                translate([rc_size/4,rc_size/4+height2/2,0])
                square([rc_size/2,rc_size/2],true);
                }
        }
    } else {
        translate([(diameter/2),0,0])
        difference(){
            translate([-diameter/4,0,0])
            square([diameter/2,height],true);

            translate([0,0,0])
            square([rc_size,height2],true);

            translate([0,height2/2,0])
            circle(d=rc_size,$fn=100); 
            translate([0,-height2/2,0])
            circle(d=rc_size,$fn=100); 
            if (vertical_base==true) {
                translate([-rc_size/4,-rc_size/4-height2/2,0])
                square([rc_size/2,rc_size/2],true);
                }
            if (vertical_top==true) {
                translate([-rc_size/4,rc_size/4+height2/2,0])
                square([rc_size/2,rc_size/2],true);
                }
        }
    
    }

}
