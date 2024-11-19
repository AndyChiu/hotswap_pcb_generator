include <parameters.scad>
include <utils.scad>

use <switch.scad>
use <mcu.scad>
use <ec11.scad>
use <evqwgd001.scad>
use <trrs.scad>
use <stabilizer.scad>
use <microswitch.scad>
use <via.scad>
use <IDC\IDC_Holder.scad>

module pcb(switch_layout, mcu_layout,ec11_layout, evqwgd001_layout, microswitch_layout, trrs_layout, stab_layout, standoff_layout, via_layout, pcb_outer_layout) {
    
    difference() {
        
        pcb_base(switch_layout, mcu_layout,ec11_layout, evqwgd001_layout, microswitch_layout, trrs_layout, stab_layout, standoff_layout, via_layout,pcb_outer_layout);
        
        if (base_pcb_layout_DesignMode==false || $preview==false) {
            
            layout_pattern(switch_layout,"switch_socket_cutout") {
                switch_socket_cutout($borders, $extra_data[0], $extra_data[1]);
            }
            
            layout_pattern(standoff_layout) {
                pcb_standoff($extra_data);
            }
                   
            if (switch_type == "ks27") {
                layout_pattern(stab_layout) {
                    stabilizer_PCB_cutout_ChocV2($extra_data);
                }
            } else if (switch_type == "Choc" && choc_v2 == true) {
                layout_pattern(stab_layout) {
                    stabilizer_pcb_cutout_ChocV2($extra_data);
                }
            } else {
                layout_pattern(stab_layout) {
                    stabilizer_pcb_cutout($extra_data);
                }
            }  
            layout_pattern(standoff_layout) {
                pcb_standoff_hole($extra_data);
            }
            layout_pattern(via_layout) {
                via($extra_data);
            }
        }
    }
}

module pcb_base(switch_layout, mcu_layout,ec11_layout, evqwgd001_layout, microswitch_layout, trrs_layout, stab_layout, standoff_layout, via_layout,pcb_outer_layout) {
    difference() {
    
            union() {
                //Andy add:
                difference() {
                    pcb_layout_outer(pcb_outer_layout);
                    //cutout
                    layout_pattern(switch_layout,"switch_socket_base_cutout");
//                  layout_pattern(mcu_layout,"mcu_cutout");
                    layout_pattern(mcu_layout) {
                        mcu_socket_base($borders);
                    }                    
                }
                
                layout_pattern(switch_layout) {
                    
                    if ($extra_data[1]=="chocMini") {
                        switch_socket_base_chocMini($borders);
    
                    } else if ($extra_data[1]=="choc" && switch_socket_base_holder==true) {
                        switch_socket_base_choc($borders);
                        
                    } else if ($extra_data[1]=="choc_holder") {
                        switch_socket_base_choc($borders);  
                        
                    } else if ($extra_data[1]=="mx_s_holder") {
                        
                        switch_socket_base_mx_stabilizer($borders);      
    
                    } else if ($extra_data[1]=="mx_s_holder2") {
                        
                        switch_socket_base_mx_stabilizer2($borders);      
                        
                    } else if ($extra_data[1]=="mx" && switch_socket_base_holder==true) {
                        switch_socket_base_mx($borders);
    
                    } else if ($extra_data[1]=="mx_holder") {
                        
                        switch_socket_base_mx($borders);
                            
                    } else {
                        switch_socket_base($borders);
                    }
                }
    
    //        layout_pattern(mcu_layout) {
    //            mcu($borders);
    //        }
    //        layout_pattern(ec11_layout) {
    //            ec11_socket($borders);
    //        }
            layout_pattern(evqwgd001_layout) {
                evqwgd001_socket($borders);
            }
            layout_pattern(microswitch_layout) {
                microswitch_socket($borders);
            }
            layout_pattern(trrs_layout) {
                trrs($borders);
            }
            if (switch_type == "ks27") {
                layout_pattern(stab_layout) {
                    stabilizer_pcb_base_ChocV2($borders, $extra_data);
                }
            } else if (switch_type == "Choc" && choc_v2 == true) {
                layout_pattern(stab_layout) {
                    stabilizer_pcb_base_ChocV2($borders, $extra_data);
                }
    //        } else if (switch_type == "mx" && switch_socket_base_holder == true) {
    //            layout_pattern(stab_layout) {
    //                stabilizer_pcb($borders, $extra_data);
    //            }
            } else if (switch_type == "mx_s_holder2") {
                layout_pattern(stab_layout) {
                    stabilizer_pcb_base2($borders, $extra_data);
                }
            } else {
                layout_pattern(stab_layout) {
                    stabilizer_pcb_base($borders
                    , $extra_data);
                }   
            }  
            layout_pattern(standoff_layout) {
                pcb_standoff($extra_data);
            }
        }
        
//        layout_pattern(mcu_layout) {
//            mcu_socket_base($borders);
//        }
        
        layout_pattern(ec11_layout) {
            ec11_socket_base($borders);
        }
    
        layout_pattern(base_switch_layout,"switch_socket_base_cutout2");    

    }
    
    layout_pattern(mcu_layout) {
        mcu($borders);
    }
    layout_pattern(ec11_layout) {
        ec11_socket($borders);
    }    

    //建立外框
    if (base_pcb_layout_outer_EdgeFrame=="RoundedCorners") {
        difference() {
             pcb_layout_outer(base_pcb_layout_outer, base_pcb_layout_outer_EdgeFrame_hight,-2,base_pcb_layout_outer_EdgeFrame_size_x,base_pcb_layout_outer_EdgeFrame_size_y,"EdgeFrameOuter");
           pcb_layout_outer(base_pcb_layout_outer,base_pcb_layout_outer_EdgeFrame_hight+0.02,-2-0.01,0,0,"EdgeFrameInner");   
        }
    } else if (base_pcb_layout_outer_EdgeFrame=="Basic") {
        difference() {
             pcb_layout_outer(base_pcb_layout_outer, base_pcb_layout_outer_EdgeFrame_hight,-2,base_pcb_layout_outer_EdgeFrame_size_x,base_pcb_layout_outer_EdgeFrame_size_y,"EdgeFrame");
           pcb_layout_outer(base_pcb_layout_outer,base_pcb_layout_outer_EdgeFrame_hight+0.02,-2-0.01,0,0,"EdgeFrame");   
        }

    }

}

module pcb_layout_outer(groups, LE_height=2, trans_z=-2,resize_x=0,resize_y=0,modeType="") {
    //繪製PCB板的外圍
    //以便於直接當鍵盤使用時更為美觀
    //groups: 描繪位置群
    //LE_height: 外框高度
    //trans_z: 高度偏移
    //resize_y
    //resize_x: XY軸大小變更
    
    if (base_pcb_layout_outer_DesignMode==true) {
        //測試模式，只放上點，沒有使用hull
        translate([0,0,2])
        union() for (group = groups) {
                 for (point = group) {
                     translate([point[0][0]*h_unit_ratio,
                                point[0][1]*v_unit_ratio,
                                point[0][2]]) color(point[2]) resize([point[1]*2+resize_x, point[1]*2+resize_y],0) circle(point[1],$fn=50);
                     translate([point[0][0]*h_unit_ratio,
                                point[0][1]*v_unit_ratio,
                                point[0][2]+5]) rotate([0,0,0]) color("Black") %text(point[3],size=3);                
            }
        }
    } else if (base_pcb_layout_outer_DesignMode=="DontShow" && modeType=="") {
        echo ("DontShow");
        
    } else if (modeType=="EdgeFrameOuter") {
        //外框外側
        translate([0,0,trans_z])
        union() for (group = groups) {
            hull_color =
                (base_pcb_layout_outer_hull_color!="None" &&base_pcb_layout_outer_hull_color!="Group")
                ? base_pcb_layout_outer_hull_color
                : base_pcb_layout_outer_hull_color=="Group"
                ? group[0][2]        
                : false ;
            color(hull_color)      
            hull() {
                for (point = group) {
                     translate([point[0][0]*h_unit_ratio,
                                point[0][1]*v_unit_ratio,
                                point[0][2]+LE_height/2]) resize([point[1]*2+resize_x, point[1]*2+resize_y],0) circleRC(point[1],LE_height,1,true,$fn=point[1]*20);
                 }
            }
        }
    } else if (modeType=="EdgeFrameInner") {
        //外框內側
    //circleRC(diameter,height,rc_size=1,center=false,vertical_base=true,vertical_top=false,concave=false)
        translate([0,0,trans_z])
        union() for (group = groups) {
            hull_color =
                (base_pcb_layout_outer_hull_color!="None" &&base_pcb_layout_outer_hull_color!="Group")
                ? base_pcb_layout_outer_hull_color
                : base_pcb_layout_outer_hull_color=="Group"
                ? group[0][2]        
                : false ;
            color(hull_color)      
            hull() {
                for (point = group) {
                     translate([point[0][0]*h_unit_ratio,
                                point[0][1]*v_unit_ratio,
                                point[0][2]+LE_height/2]) resize([point[1]*2+resize_x, point[1]*2+resize_y],0) circleRC(point[1],LE_height,1,true,true,false,true,$fn=point[1]*20);
                 }
            }
        }

    } else {
        //正常模式，產生hull結構
        translate([0,0,trans_z])
        union() for (group = groups) {
            hull_color =
                (base_pcb_layout_outer_hull_color!="None" &&base_pcb_layout_outer_hull_color!="Group")
                ? base_pcb_layout_outer_hull_color
                : base_pcb_layout_outer_hull_color=="Group"
                ? group[0][2]        
                : false ;
            color(hull_color)
            linear_extrude(LE_height) 
            hull() {
                for (point = group) {
                     translate([point[0][0]*h_unit_ratio,
                                point[0][1]*v_unit_ratio,
                                point[0][2]]) resize([point[1]*2+resize_x, point[1]*2+resize_y],0) circle(point[1],$fn=point[1]*20);
                 }
            }
            

        }

        }
}

module pcb_layout_Rubber_Pads(group) {
    //挖PCB板的橡膠墊凹槽
    //以便於直接當鍵盤使用時更為美觀
    //group: 描繪位置群
    for (point = group) {
          translate ([point[0][0]*h_unit_ratio,
                                point[0][1]*v_unit_ratio,
                                point[0][2]])
    color(point[2]) cylinder(h=point[1][1],r=point[1][0]/2,center=true,$fn=point[1][0]*3);
   
        if (base_pcb_layout_Rubber_Pads_DesignMode) {
          translate ([point[0][0]*h_unit_ratio,
                                point[0][1]*v_unit_ratio,
                                point[0][2]])
        rotate([180,0,0]) color("Black") %text(point[3],size=3);
        }
      }
}

module pcb_layout_IDC_Hole(group) {
    //挖PCB板，讓IDC接口有洞可以出入，座的深度可以更深
    //group: 描繪位置
    for (point = group) {
        translate([point[0][0]*h_unit_ratio,
                                point[0][1]*v_unit_ratio,
                                point[0][2]])  rotate(point[1]) color(point[3])cube(point[2]);
    }
}

module pcb_layout_IDC(group) {
    //放置IDC接
    //group: 描繪位置
    for (point = group) {
        translate([point[0][0]*h_unit_ratio,
                                point[0][1]*v_unit_ratio,
                                point[0][2]]) rotate(point[1]) color(point[2]) IDC_Port();
    }
}

module pcb_layout_Raised_Text(group) {
    //板上繪製凸起文字
    //group: 描繪位置
    for (point = group) {
        color(point[4])
        translate([point[0][0]*h_unit_ratio,
                                point[0][1]*v_unit_ratio,
                                point[0][2]]) rotate(point[1]) {
             linear_extrude(point[2])
                text(text = point[3][0], font = point[3][1], size = point[3][2]);
        } 
    }
}

module pcb_layout_Indented_Text(group) {
    //板上繪製內凹文字
    //group: 描繪位置
    for (point = group) {
        color(point[4])
        translate([point[0][0]*h_unit_ratio,
                                point[0][1]*v_unit_ratio,
                                point[0][2]]) rotate(point[1]) {
             linear_extrude(point[2])
                text(text = point[3][0], font = point[3][1], size = point[3][2]);
        } 
    }
}




//TEST
difference(){
    
    pcb(switch_layout_final, mcu_layout_final,ec11_layout_final, evqwgd001_layout_final, microswitch_layout_final, trrs_layout_final, stab_layout_final, standoff_layout_final, via_layout_final,base_pcb_layout_outer);

    //圓形矽膠墊挖洞
    pcb_layout_Rubber_Pads(base_pcb_layout_Rubber_Pads);   

    //IDC座與接口挖空
    pcb_layout_IDC_Hole(base_pcb_layout_IDC_Hole);   
    
    ////Indented_Text TEST
    pcb_layout_Indented_Text(base_pcb_layout_Indented_Text); 
}

//IDC TEST
pcb_layout_IDC(base_pcb_layout_IDC);   

////Raised_Text TEST
pcb_layout_Raised_Text(base_pcb_layout_Raised_Text);   


//layout_pattern(base_switch_layout,"switch_socket_base_cutout2MOD"); 
//
//translate([0,-100,12.8])
//#cube([100,100,0.5]);
