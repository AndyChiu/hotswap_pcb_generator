include <parameters.scad>
include <utils.scad>

use <switch.scad>
use <mcu.scad>
use <trrs.scad>
use <stabilizer.scad>
use <standoff.scad>
use <via.scad>
use <ec11.scad>
use <evqwgd001.scad>
use <microswitch.scad>

module pcb(switch_layout, mcu_layout,ec11_layout, evqwgd001_layout, microswitch_layout, trrs_layout, stab_layout, standoff_layout, via_layout, pcb_outer_layout) {
    difference() {
        
        pcb_base(switch_layout, mcu_layout,ec11_layout, evqwgd001_layout, microswitch_layout, trrs_layout, stab_layout, standoff_layout, via_layout,pcb_outer_layout);
        
        layout_pattern(switch_layout) {
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

module pcb_base(switch_layout, mcu_layout,ec11_layout, evqwgd001_layout, microswitch_layout, trrs_layout, stab_layout, standoff_layout, via_layout,pcb_outer_layout) {
    difference() {
    
        union() {
            //Andy add:
            pcb_layout_outer(pcb_outer_layout);
            
            layout_pattern(switch_layout) {
                
                if ($extra_data[1]=="chocMini") {
                    switch_socket_base_chocMini($borders);

                } else if ($extra_data[1]=="choc" && switch_socket_base_holder==true) {
                    switch_socket_base_choc($borders);
                    
                } else if ($extra_data[1]=="choc_holder") {
                    switch_socket_base_choc($borders);  
                    
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
        layout_pattern(ec11_layout) {
            ec11_socket($borders);
        }
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
        } else {
            layout_pattern(stab_layout) {
                stabilizer_pcb_base($borders, $extra_data);
            }   
        }  
        layout_pattern(standoff_layout) {
            pcb_standoff($extra_data);
        }
    }
    layout_pattern(mcu_layout) {
        mcu_socket_base($borders);
    }

}
    layout_pattern(mcu_layout) {
        mcu($borders);
    }

    //建立外框
    if (base_pcb_layout_outer_EdgeFrame) {
        difference() {
            pcb_layout_outer(base_pcb_layout_outer, base_pcb_layout_outer_EdgeFrame_hight,-2,base_pcb_layout_outer_EdgeFrame_size,base_pcb_layout_outer_EdgeFrame_size);
                pcb_layout_outer(base_pcb_layout_outer,base_pcb_layout_outer_EdgeFrame_hight);   
        }
}
}

module pcb_layout_outer(groups, LE_height=2, trans_z=-2,resize_x=0,resize_y=0) {
    //繪製PCB板的外圍
    //以便於直接當鍵盤使用時更為美觀
    //groups: 描繪位置群
    //LE_height: 外框高度
    //trans_z: 高度偏移
    //resize_y
    //resize_x: XY軸大小變更
    

    if (base_pcb_layout_outer_DesignMode) {
        //測試模式，只放上點，沒有使用hull
        translate([0,0,2])
        union() for (group = groups) {
                 for (point = group) {
                     translate(point[0]) color(point[2]) resize([point[1]*2+resize_x, point[1]*2+resize_y],0) circle(point[1],$fn=50);
            }
        }

        }
    else {
        //正常模式，產生hull結構
        translate([0,0,trans_z])
        #linear_extrude(LE_height) 
        union() for (group = groups) {
            hull() {
                for (point = group) {
                     translate(point[0]) resize([point[1]*2+resize_x, point[1]*2+resize_y],0) circle(point[1],$fn=50);
                 }
            }
        }

        }
}

    pcb(switch_layout_final, mcu_layout_final,ec11_layout_final, evqwgd001_layout_final, microswitch_layout_final, trrs_layout_final, stab_layout_final, standoff_layout_final, via_layout_final,base_pcb_layout_outer);


//TEST
//pcb_base(switch_layout_final, mcu_layout_final,ec11_layout_final, evqwgd001_layout_final, microswitch_layout_final, trrs_layout_final, stab_layout_final, standoff_layout_final, via_layout_final,base_pcb_layout_outer);

//TEST
//module pcb_layout_outer2(groups, LE_height=2, trans_z=-2,resize_x=0,resize_y=0)
//    //groups: 描繪位置群
//    //LE_height: 外框高度
//    //trans_z: 高度偏移
//    //resize_y
//    //resize_x: XY軸大小變更
//
//pcb_layout_outer(base_pcb_layout_outer);
//
//hull(){
//        difference() {
//            pcb_layout_outer(
//            base_pcb_layout_outer, 
//            base_pcb_layout_outer_EdgeFrame_hight,
//            -2,
//            base_pcb_layout_outer_EdgeFrame_size,
//            base_pcb_layout_outer_EdgeFrame_size);
//            
//            pcb_layout_outer(
//            base_pcb_layout_outer, 
//            base_pcb_layout_outer_EdgeFrame_hight,
//            -2,
//            base_pcb_layout_outer_EdgeFrame_size-1,
//            base_pcb_layout_outer_EdgeFrame_size-1);   
//        }
//
//projection(cut = true){
//        difference() {
//            pcb_layout_outer(
//            base_pcb_layout_outer, 
//            base_pcb_layout_outer_EdgeFrame_hight-2,
//            -2,
//            base_pcb_layout_outer_EdgeFrame_size-1,
//            base_pcb_layout_outer_EdgeFrame_size-1);
//            
//            pcb_layout_outer(
//            base_pcb_layout_outer, 
//            base_pcb_layout_outer_EdgeFrame_hight-2,
//            -2,
//            base_pcb_layout_outer_EdgeFrame_size-2,
//            base_pcb_layout_outer_EdgeFrame_size-2);   
//        }
//    }
//    }