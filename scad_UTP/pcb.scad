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
                switch_socket_base1($borders);
            } else {
                switch_socket_base($borders);
            }
        }
        layout_pattern(mcu_layout) {
//            mcu($borders);
        }
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
}

module pcb_layout_outer(groups) {
    //繪製PCB板的外圍
    //以便於直接當鍵盤使用時更為美觀
    
translate([0,0,-2])
#linear_extrude(2) 
union() for (group = groups) {
      hull() {
         for (point = group) {
            translate(point[0]) circle(point[1]);
         }
    }
}

}

//pcb(switch_layout_final, mcu_layout_final,ec11_layout_final, evqwgd001_layout_final, microswitch_layout_final, trrs_layout_final, stab_layout_final, standoff_layout_final, via_layout_final,base_pcb_layout_outer);



pcb_base(switch_layout_final, mcu_layout_final,ec11_layout_final, evqwgd001_layout_final, microswitch_layout_final, trrs_layout_final, stab_layout_final, standoff_layout_final, via_layout_final,base_pcb_layout_outer);
