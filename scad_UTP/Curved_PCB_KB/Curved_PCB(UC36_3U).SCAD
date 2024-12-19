include <..\switch.scad>


// 程式啟動放在最下面

module OneCol5_1(h_unit_pos) { 
    translate([h_unit*h_unit_pos,v_unit*1,4.4553]){
        rotate([-30,0,0]) { 
        switch_socket(borders=[1.58,1,1,1],use_switch_type="choc");
        }
    }
    translate([h_unit*h_unit_pos,v_unit*2,0.0843]){
        rotate([-15,0,0]) { 
        switch_socket(borders=[1.589,1.58,1,1],use_switch_type="choc");
        }
    }
    translate([h_unit*h_unit_pos,v_unit*3.04,0]){
        rotate([0,0,0]) { 
        switch_socket(borders=[1.59,1.589,1,1],use_switch_type="choc");
        }
    }
    translate([h_unit*h_unit_pos,v_unit*3.08,0.0843]){
        rotate([15,0,0]) { 
            translate([0,v_unit*1,0]){
        switch_socket(borders=[1.58,1.58,1,1],use_switch_type="choc");
            }
        }
    }
    translate([h_unit*h_unit_pos,v_unit*4.08,4.4553]){
        rotate([30,0,0]) { 
            translate([0,v_unit*1,0]){
        switch_socket(borders=[1.58,1.58,1,1],use_switch_type="choc");
            }
        }
    }

}

module OneCol5_2(){

    translate([h_unit*0,v_unit*-2,8.7337]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,0]) {
        switch_socket(borders=[1.9967,1,1,1],use_switch_type="choc");
        }
            }
    }
    translate([h_unit*0,v_unit*-1,2.1063]){
        rotate([-15,0,0]) { 
            translate([-h_unit/2,v_unit/2,0]) {
        switch_socket(borders=[1.402,1.9967,1,1],use_switch_type="choc");
        }
            }
    }
    translate([h_unit*0,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,0]) {
        switch_socket(borders=[1.402,1.402,1,1],use_switch_type="choc");
        }
            }
    }
    translate([h_unit*0,v_unit*1,2.1063]){
        rotate([15,0,0]) { 
            translate([-h_unit/2,v_unit/2,0]) {
        switch_socket(borders=[1.9967,1.402,1,1],use_switch_type="choc");
        }
            }
    }
    translate([h_unit*0,v_unit*2,8.7337]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,0]) {
        switch_socket(borders=[1,1.9967,1,1],use_switch_type="choc");
        }
            }
    }
}


// final
module OneCol5(h_unit_pos, counter_type) {
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*-2,8.5455]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.7695,1,0,0],use_switch_type="choc");
        }
            }
    }    
}
    if (counter_type>3) {
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness),2.1943]){
        rotate([-15,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.8775,1.9775,0,0],use_switch_type="choc");
        }
            }
    }
}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.9775,1.9775,0,0],use_switch_type="choc");
        }
            }
    }

        translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness),2.1943]){
        rotate([15,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.7695,1.8775,0,0],use_switch_type="choc");
        }
            }
    }

        translate([h_unit*h_unit_pos,v_unit*2,8.5455]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1,1.8695,0,0],use_switch_type="choc");
        }
            }
    }    


}


module OneCol5_3(h_unit_pos, counter_type) {
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc");
        }
            }
    }    
}
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1,2.1943+0.1316]){
        rotate([-15,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+0.141,2.831,0,0],use_switch_type="choc");
                
        }
            }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+0.141,2.831+0.141,0,0],use_switch_type="choc");
        }
            }
    }

        translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1,2.1943+0.1316]){
        rotate([15,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2.831+0.141,0,0],use_switch_type="choc");
        }
            }
    }

//switch+keycaps
    switch_hight=8;
    keycaps_hight=4.5;
    keycaps_h=13;
    keycaps_v=13;
    
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1,2.1943+0.1316]){
        rotate([-15,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }  
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1,2.1943+0.1316]){
        rotate([15,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }   
   
    
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

        if (counter_type==3) {
            translate([h_unit*h_unit_pos,v_unit*1.5+(15/90*pcb_thickness)+0.61,4.65/2]){
           cube([15,2,4.65],center=true);
        }
            translate([h_unit*h_unit_pos,v_unit*-1.5-(15/90*pcb_thickness)-0.61,4.65/2]){
           cube([15,2,4.65],center=true);                      
    }    
            
            
        }

}


module OneCol5_4(h_unit_pos, counter_type) {
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc");
        }
            }
    }    
}

    iBorder_brg=2.685;
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045,2.1943+0.1316+0.1316*2.5+0.0002]){
        rotate([-15,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        #switch_socket(borders=[2.831+iBorder_brg,2.831,0,0],use_switch_type="choc");
                
        }
            }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+iBorder_brg,2.831+iBorder_brg,0,0],use_switch_type="choc");
        }
            }
    }

        translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1+2.5+0.00045,2.1943+0.1316+0.1316*2.5+0.0002]){
        rotate([15,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2.831+iBorder_brg,0,0],use_switch_type="choc");
        }
            }
    }

//switch+keycaps
    switch_hight=8;
    keycaps_hight=3;
    keycaps_h=16.3;
    keycaps_v=16.3;
    
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5,2.1943+0.1316+0.1316*2.5]){
        rotate([-15,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }  
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1+2.5,2.1943+0.1316+0.1316*2.5]){
        rotate([15,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }   
   
    
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

        if (counter_type==3) {
            translate([h_unit*h_unit_pos,v_unit*1.5+(15/90*pcb_thickness)+0.61+2.5+0.00025,(4.65+0.3445)/2]){
           cube([15,2,4.65+0.3445],center=true);
        }
            translate([h_unit*h_unit_pos,v_unit*-1.5-(15/90*pcb_thickness)-0.61-2.5-0.0025,(4.65+0.3127)/2]){
           cube([15,2,4.65+0.3127],center=true);                      
    }    
            
            
        }

}



module OneCol5_5(h_unit_pos, counter_type) {
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc_holder");
        }
            }
    }    
}

    iBorder_brg=2.685;
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045,2.1943+0.1316+0.1316*2.5+0.0002]){
        rotate([-15,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+iBorder_brg,0,0,0],use_switch_type="choc_holder");
                
        }
            }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+iBorder_brg,2.831+iBorder_brg,0,0],use_switch_type="choc_holder");
        }
            }
    }

        translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1+2.5+0.00045,2.1943+0.1316+0.1316*2.5+0.0002]){
        rotate([15,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2.831+iBorder_brg,0,0],use_switch_type="choc_holder");
        }
            }
    }

//switch+keycaps
    switch_hight=8;
    keycaps_hight=3;
    keycaps_h=16.3;
    keycaps_v=16.3;
    
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5,2.1943+0.1316+0.1316*2.5]){
        rotate([-15,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }  
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1+2.5,2.1943+0.1316+0.1316*2.5]){
        rotate([15,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }   
   
    
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

        if (counter_type==3) {
            translate([h_unit*h_unit_pos,v_unit*1.5+(15/90*pcb_thickness)+0.61+2.50,-(5-1-1)/2]){
           cube([15,2,(4.65)*3-1],center=true);
        }
//            translate([h_unit*h_unit_pos,v_unit*-1.5-(15/90*pcb_thickness)-0.61-2.5-0.0025,(4.65+0.3127)/2]){
//           #cube([15,2,4.65+0.3127],center=true);                      
//    }    



difference() {

translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045,0]){
        rotate([-15,0,0]) { 
            translate([0,-v_unit/2-0.5,pcb_thickness*1+1.1]) {
        #cube([15,1,1],center=true);
                
        }
            }
    }   

translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045,0]){
        rotate([-15,0,0]) { 
            translate([3.12,-v_unit/2-0.5,pcb_thickness*1+1.1]) {
        #cube([1.1,1,1],center=true);
                
        }
            }
    }  

}   
            
        }

}


module OneCol5_5_Thumber10(LR="L",h_unit_pos, counter_type) {

//變形給拇指用
//        if (counter_type>4) {
//        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
//        rotate([-30,0,0]) { 
//            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
//        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc");
//        }
//            }
//    }    
//}


iSW =
    LR == "L"
        ? 1
    : LR == "R"
        ? -1
    : assert(false, "LR is invalid");

    iBorder_brg=2.685;
    
//switch+keycaps
    switch_hight=8;
    keycaps_hight=3;
    keycaps_h=16.3;
    keycaps_v=16.3;
//    keycaps_h=18.5;
//    keycaps_v=18.5;
    
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos-1.9,
                  v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045-1.6,
                  2.1943+0.1316+0.1316*2.5+0.0002+0.35]){
        rotate([-15,0,0]) { 
        rotate([0,0,-90-10]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,0,2.831+iBorder_brg,0],use_switch_type="choc_holder");
             }   
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);

        }
        }
    }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
        rotate([0,0,-90]) {         
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,0,2.831+iBorder_brg,2.831+iBorder_brg],use_switch_type="choc_holder");
        }
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }        
        }
            }
    }

        translate([h_unit*h_unit_pos-1.9,
                   v_unit*1+(15/90*pcb_thickness)+1+2.5+0.00045+1.6,
                   2.1943+0.1316+0.1316*2.5+0.0002+0.35]){
        rotate([15,0,0]) { 
        rotate([0,0,-90+10]) {           
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,0,2.831,2.831+iBorder_brg],use_switch_type="choc_holder");
        }
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }        
        
        
        }
            }
    }



        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

        if (counter_type==3) {


        //'(4.65)*3-1
        //-(5-1-1)/2+1
            translate([(h_unit*h_unit_pos-3.4),(v_unit*1.5+(15/90*pcb_thickness)+0.61+2.50+2)*iSW,5]){
            rotate([0,0,10*iSW]) { 
           cube([15,2,2],center=true);
        }
        }

           translate([(h_unit*h_unit_pos-3.2-0.1),
                      (-v_unit*1.5-(15/90*pcb_thickness)-0.61-2.50-2+0.3)*iSW  ,5.8]){
            rotate([-12*iSW,0,-10*iSW]) { 
           cube([15,2,2],center=true);
        }
        }

       hull(){
            translate([-h_unit/2+1.5,v_unit/2+iBorder_brg-0.3,1.05]){
            rotate([5,0,5]) { 
            //#cylinder(2,1,center=true);
            cube([2,1,2],center=true);
           
        }
        }        

            translate([h_unit/2-1.95,v_unit/2+iBorder_brg+1,1.4],$fn=30){
            rotate([13,0,5]) { 
            //#cylinder(2,2.5,2,center=true);
           cube([2.5,4,1.9],center=true);
        }
        } 
}

       hull(){
            translate([-h_unit/2+1.5,-v_unit/2-iBorder_brg+0.3,1.05]){
            rotate([-5,0,5]) { 
            //#cylinder(2,1,center=true);
            cube([2,1,2],center=true);
           
        }
        }        

            translate([h_unit/2-1.95,-v_unit/2-iBorder_brg-1.2,1.4],$fn=30){
            rotate([-13,0,-4]) { 
            //#cylinder(2,2.5,2,center=true);
           cube([2.5,4,1.9],center=true);
        }
        } 
        }

//        translate([h_unit*h_unit_pos,v_unit*-1.5-(15/90*pcb_thickness)-0.61-2.5-0.0025,(4.65+0.3127)/2]){
//           #cube([15,2,4.65+0.3127],center=true);                      
//    }    




            
        }

}


module OneCol5_6(h_unit_pos, counter_type) {
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc");
        }
            }
    }    
}
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1,2.1943+0.1316]){
        rotate([-15,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+0.141,0,0,0],use_switch_type="choc");
                
        }
            }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+0.141,2.831+0.141,0,0],use_switch_type="choc");
        }
            }
    }

        translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1,2.1943+0.1316]){
        rotate([15,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831+0.141,0,0],use_switch_type="choc");
        }
            }
    }

//switch+keycaps
    switch_hight=8;
    keycaps_hight=4.5;
    keycaps_h=13;
    keycaps_v=13;
    
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1,2.1943+0.1316]){
        rotate([-15,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }  
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1,2.1943+0.1316]){
        rotate([15,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }   
   
    
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

        if (counter_type==3) {
            
            translate([h_unit*h_unit_pos,v_unit*1.5+(15/90*pcb_thickness)-0.757,-(5-1-1)/2-0.7]){
           cube([15,2,(4.65)*3-1],center=true);
                }
                
            difference() {

            translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)+1-2.1-0.00045,0]){
                    rotate([-15,0,0]) { 
                        translate([0,-v_unit/2-0.5,pcb_thickness*1+1.1]) {
                    #cube([15,1,1],center=true);
                            
                    }
                        }
                }   

            translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)+1-2.1-0.00045,0]){
                    rotate([-15,0,0]) { 
                        translate([3.12,-v_unit/2-0.5,pcb_thickness*1+1.1]) {
                    #cube([1.1,1,1],center=true);
                            
                    }
                        }
                }  

            }   
            
            
        }

}

module OneCol5_5_Thumber15(h_unit_pos, counter_type) {

//變形給拇指用
//        if (counter_type>4) {
//        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
//        rotate([-30,0,0]) { 
//            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
//        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc");
//        }
//            }
//    }    
//}

    iBorder_brg=2.685;
    
//switch+keycaps
    switch_hight=8;
    keycaps_hight=3;
    keycaps_h=16.3;
    keycaps_v=16.3;

    
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos-2.8,
                  v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045-2,
                  2.1943+0.1316+0.1316*2.5+0.0002+0.4]){
        rotate([-15,0,0]) { 
        rotate([0,0,-90-15]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        #switch_socket(borders=[0,0,2.831+iBorder_brg,0],use_switch_type="choc_holder");
             }   
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }

    
        }
            }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
        rotate([0,0,-90]) {         
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,0,2.831+iBorder_brg,2.831+iBorder_brg],use_switch_type="choc_holder");
        }
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }        
        }
            }
    }

        translate([h_unit*h_unit_pos-2.8,
                   v_unit*1+(15/90*pcb_thickness)+1+2.5+0.00045+2,
                   2.1943+0.1316+0.1316*2.5+0.0002+0.4]){
        rotate([15,0,0]) { 
        rotate([0,0,-90+15]) {           
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,0,2.831,2.831+iBorder_brg],use_switch_type="choc_holder");
        }
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }        
        
        
        }
            }
    }



        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

        if (counter_type==3) {


        
            translate([h_unit*h_unit_pos-5,v_unit*1.5+(15/90*pcb_thickness)+0.61+2.50+2,-(5-1-1)/2+1]){
            rotate([0,0,15]) { 
           cube([15,2,(4.65)*3-1],center=true);
        }
        }

           translate([h_unit*h_unit_pos-5,-v_unit*1.5-(15/90*pcb_thickness)-0.61-2.50-2,5]){
            rotate([-12,0,-15]) { 
           cube([15,2,4],center=true);
        }
        }

       hull(){
            translate([-h_unit/2+1.5,v_unit/2+iBorder_brg-0.3,1.05]){
            rotate([7.5,0,0]) { 
            //#cylinder(2,1,center=true);
            cube([2,1,2],center=true);
           
        }
        }        

            translate([h_unit/2-2,v_unit/2+iBorder_brg+1.5,1.5],$fn=30){
            rotate([13,0,6]) { 
            //#cylinder(2,2.5,2,center=true);
           cube([2.5,5,2],center=true);
        }
        } 
}
       hull(){
            translate([-h_unit/2+1.5,-v_unit/2-iBorder_brg+0.3,1.05]){
            rotate([-7.5,0,0]) { 
            //#cylinder(2,1,center=true);
            cube([2,1,2],center=true);
           
        }
        }        

            translate([h_unit/2-2,-v_unit/2-iBorder_brg-1.5,1.5],$fn=30){
            rotate([-13,0,-6]) { 
            //#cylinder(2,2.5,2,center=true);
           cube([2.5,5,2],center=true);
        }
        } 
        }
        //            translate([h_unit*h_unit_pos,v_unit*-1.5-(15/90*pcb_thickness)-0.61-2.5-0.0025,(4.65+0.3127)/2]){
//           #cube([15,2,4.65+0.3127],center=true);                      
//    }    




            
        }

}


module OneCol5_6(h_unit_pos, counter_type) {
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc");
        }
            }
    }    
}
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1,2.1943+0.1316]){
        rotate([-15,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+0.141,0,0,0],use_switch_type="choc");
                
        }
            }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+0.141,2.831+0.141,0,0],use_switch_type="choc");
        }
            }
    }

        translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1,2.1943+0.1316]){
        rotate([15,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831+0.141,0,0],use_switch_type="choc");
        }
            }
    }

//switch+keycaps
    switch_hight=8;
    keycaps_hight=4.5;
    keycaps_h=13;
    keycaps_v=13;
    
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1,2.1943+0.1316]){
        rotate([-15,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }  
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1,2.1943+0.1316]){
        rotate([15,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }   
   
    
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

        if (counter_type==3) {
            
            translate([h_unit*h_unit_pos,v_unit*1.5+(15/90*pcb_thickness)-0.757,-(5-1-1)/2-0.7]){
           cube([15,2,(4.65)*3-1],center=true);
                }
                
            difference() {

            translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)+1-2.1-0.00045,0]){
                    rotate([-15,0,0]) { 
                        translate([0,-v_unit/2-0.5,pcb_thickness*1+1.1]) {
                    #cube([15,1,1],center=true);
                            
                    }
                        }
                }   

            translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)+1-2.1-0.00045,0]){
                    rotate([-15,0,0]) { 
                        translate([3.12,-v_unit/2-0.5,pcb_thickness*1+1.1]) {
                    #cube([1.1,1,1],center=true);
                            
                    }
                        }
                }  

            }   
            
            
        }

}

module OneCol5_7(h_unit_pos, counter_type) {
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc");
        }
            }
    }    
}

    iBorder_brg=2.685;
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045,2.1943+0.1316+0.1316*2.5+0.0002+5.6]){
        rotate([-45,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        #switch_socket(borders=[2.831+iBorder_brg+2,2.831,0,0],use_switch_type="choc");
                
        }
            }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+iBorder_brg+4,2.831+iBorder_brg+4,0,0],use_switch_type="choc");
        }
            }
    }

        translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1+2.5+0.00045,2.1943+0.1316+0.1316*2.5+0.0002+5.6]){
        rotate([45,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2.831+iBorder_brg+2,0,0],use_switch_type="choc");
        }
            }
    }

//switch+keycaps
    switch_hight=8;
    keycaps_hight=3;
    keycaps_h=11.3;
    keycaps_v=11.3;    
    
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5,2.1943+0.1316+0.1316*2.5+5.6]){
        rotate([-45,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }  
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1+2.5,2.1943+0.1316+0.1316*2.5+5.6]){
        rotate([45,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }   
   
    
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

        if (counter_type==3) {
            translate([h_unit*h_unit_pos,v_unit*1.5+(15/90*pcb_thickness)+0.61+2.5+0.00025,(4.65+0.3445+10)/2]){
           cube([15,2,4.65+0.3445+10],center=true);
        }
            translate([h_unit*h_unit_pos,v_unit*-1.5-(15/90*pcb_thickness)-0.61-2.5-0.0025,(4.65+0.3127+10)/2]){
           cube([15,2,4.65+0.3127+10],center=true);                      
    }    
            
            translate([h_unit*h_unit_pos,v_unit*1.5+(15/90*pcb_thickness)+0.61+2.5+0.00025-1
            
    
    ,(4.65+0.3445+10)]){
           #cube([15,4,2],center=true);
        }
            translate([h_unit*h_unit_pos,v_unit*-1.5-(15/90*pcb_thickness)-0.61-2.5-0.0025+1,(4.65+0.3127+10)]){
           #cube([15,4,2],center=true);                      
    }    
            
        }

}

module OneCol5_8(h_unit_pos, counter_type) {
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc");
        }
            }
    }    
}

    iBorder_brg=2.685;
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045-0.5,2.1943+0.1316+0.1316*2.5+0.0002+18]){
        rotate([-90,0,0]) {
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        #switch_socket(borders=[2.831+iBorder_brg+20.5,2.831,0,0],use_switch_type="choc");
                
        }
            }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+iBorder_brg+20.8,2.831+iBorder_brg+20.8,0,0],use_switch_type="choc");
        }
            }
    }

        translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1+2.5+0.00045+0.5,2.1943+0.1316+0.1316*2.5+0.0002+18]){
        rotate([90,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2.831+iBorder_brg+20.5,0,0],use_switch_type="choc");
        }
            }
    }

//switch+keycaps
    switch_hight=8;
    keycaps_hight=3;
    keycaps_h=11.3;
    keycaps_v=11.3;    
    
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.5,2.1943+0.1316+0.1316*2.5+18]){
        rotate([-90,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }  
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1+2.5+0.5,2.1943+0.1316+0.1316*2.5+18]){
        rotate([90,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }   
   
    
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

}

module OneCol5_9(h_unit_pos, counter_type) {
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc");
        }
            }
    }    
}

    iBorder_brg=1.3;
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-0.00045,2.1943+0.1316+0.1316*2.5+0.0002+1.36]){
        rotate([-25,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        #switch_socket(borders=[2.831+iBorder_brg,2.831,0,0],use_switch_type="choc");
                
        }
            }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+iBorder_brg,2.831+iBorder_brg,0,0],use_switch_type="choc");
        }
            }
    }

        translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1+0.00045,2.1943+0.1316+0.1316*2.5+0.0002+1.36]){
        rotate([25,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2.831,0,0],use_switch_type="choc");
        }
            }
    }

//switch+keycaps
    switch_hight=8;
    keycaps_hight=3;
    keycaps_h=11.3;
    keycaps_v=11.3;    
    
       translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1,2.1943+0.1316+0.1316*2.5+1.3]){
        rotate([-25,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }  
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,v_unit*1+(15/90*pcb_thickness)+1,2.1943+0.1316+0.1316*2.5+1.3]){
        rotate([25,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }   
   
    
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

        if (counter_type==3) {
            translate([h_unit*h_unit_pos,v_unit*1.5+(15/90*pcb_thickness)+0.61+2.5+0.00025,(4.65+0.3445+4.6)/2]){
           cube([15,2,4.65+0.3445+4.6],center=true);
        }
            translate([h_unit*h_unit_pos,v_unit*-1.5-(15/90*pcb_thickness)-0.61-2.5-0.0025,(4.65+0.3127+4.6)/2]){
           cube([15,2,4.65+0.3127+4.6],center=true);                      
    }    
            
            translate([h_unit*h_unit_pos,v_unit*1.5+(15/90*pcb_thickness)+0.61+2.5+0.00025-1
            
    
    ,(4.65+0.3445+3.6)]){
           #cube([15,4,2],center=true);
        }
            translate([h_unit*h_unit_pos,v_unit*-1.5-(15/90*pcb_thickness)-0.61-2.5-0.0025+1,(4.65+0.3127+3.6)]){
           #cube([15,4,2],center=true);                      
    }    
            
        }

}


module OneCol5_10(h_unit_pos, counter_type) {
    
    swr=30;
    swh_offset=2.34;
    swh=2.1943+0.1316+0.1316*2.5+0.0002+swh_offset;
    swy=v_unit*1+(15/90*pcb_thickness)+1+2.5+0.00045-0.53;
    swy2=v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045;
    iBorder_brg=2.15;
    iBorder_brg2=4.15;
    iBorder_brg3=2.15;

    supr=-30;
    suph=28.37;
    suph_offset=-5.5;
    supy=18;
    
    supty=-v_unit/2-2.03;
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc");
        }
            }
    }    
}

    
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos,swy*-1,swh]){
        rotate([-1*swr,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+iBorder_brg3,0,0,0],use_switch_type="choc");
                
        }
            }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831+iBorder_brg2,2.831+iBorder_brg2,0,0],use_switch_type="choc");
        }
            }
    }

        translate([h_unit*h_unit_pos,swy,swh]){
        rotate([swr,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2.831+iBorder_brg,0,0],use_switch_type="choc");
        }
            }
    }

//switch+keycaps
    switch_hight=8;
    keycaps_hight=4;
    keycaps_h=11.4;
    keycaps_v=11.4;
    
       translate([h_unit*h_unit_pos,swy*-1,swh]){
        rotate([-1*swr,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }  
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,swy,swh]){
        rotate([swr,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }   
   
    
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

        if (counter_type==3) {
            rotate([supr,0,0]) { 

                translate([h_unit*h_unit_pos,supy,suph/2+suph_offset]){
            cube([15,2,suph],center=true);
        }
    }
//            translate([h_unit*h_unit_pos,v_unit*-1.5-(15/90*pcb_thickness)-0.61-2.5-0.0025,(4.65+0.3127)/2]){
//           #cube([15,2,4.65+0.3127],center=true);                      
//    }    



difference() {

translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045,0]){
        rotate([-1*swr,0,0]) { 
            translate([0,supty,pcb_thickness*1+1.1+swh_offset]) {
        #cube([15,1,1],center=true);
                
        }
            }
    }   

translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045,0]){
        rotate([-1*swr,0,0]) { 
            translate([3.12,supty,pcb_thickness*1+1.1+swh_offset]) {
        #cube([1.1,1,1],center=true);
                
        }
            }
    }  

}   
            
        }

}

module OneCol5_11(h_unit_pos, counter_type) {
    
    swr=15;
    swh_offset=-0.635;
    swh=2.1943+0.1316+0.1316*2.5+0.0002+swh_offset;
    swy=v_unit*1+(15/90*pcb_thickness)+1+2.5+0.00045-3.825;
    swy2=v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045;
    iBorder_brg1=0;
    iBorder_brg2=3.2;
    iBorder_brg3=0;

    supr=-0;
    suph=14.8;
    suph_offset=-8.8;
    supy=25;
    
    supty=-v_unit/2+3.2;
    supth=pcb_thickness*1+2.3+swh_offset;
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc");
        }
            }
    }    
}

    
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos,swy*-1,swh]){
        rotate([-1*swr,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[iBorder_brg1,0,0,0],use_switch_type="choc");
                
        }
            }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[iBorder_brg2,iBorder_brg2,0,0],use_switch_type="choc");
        }
            }
    }

        translate([h_unit*h_unit_pos,swy,swh]){
        rotate([swr,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,iBorder_brg3,0,0],use_switch_type="choc");
        }
            }
    }

//switch+keycaps
    switch_hight=8;
    keycaps_hight=4;
    keycaps_h=11.4;
    keycaps_v=11.4;
    
       translate([h_unit*h_unit_pos,swy*-1,swh]){
        rotate([-1*swr,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }  
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,swy,swh]){
        rotate([swr,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }   
   
    
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

        if (counter_type==3) {
            rotate([supr,0,0]) { 

                translate([h_unit*h_unit_pos,supy,suph/2+suph_offset]){
            cube([15,2,suph],center=true);
        }
    }
//            translate([h_unit*h_unit_pos,v_unit*-1.5-(15/90*pcb_thickness)-0.61-2.5-0.0025,(4.65+0.3127)/2]){
//           #cube([15,2,4.65+0.3127],center=true);                      
//    }    



difference() {

translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045,0]){
        rotate([-1*swr,0,0]) { 
            translate([0,supty,supth]) {
        #cube([15,1,1],center=true);
                
        }
            }
    }   

translate([h_unit*h_unit_pos,v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045,0]){
        rotate([-1*swr,0,0]) { 
            translate([3.12,supty,supth]) {
        #cube([1.1,1,1],center=true);
                
        }
            }
    }  

}   
            
        }

}


module OneCol5_12(h_unit_pos, counter_type) {
    
    swr=28;
    swh_offset=2;
    swh=2.1943+0.1316+0.1316*2.5+0.0002+swh_offset;
    swy=v_unit*1+(15/90*pcb_thickness)+1+2.5+0.00045-1.325;
    swy2=v_unit*-1-(15/90*pcb_thickness)-1-2.5-0.00045;
    iBorder_brg1=4.8; //72.3
    iBorder_brg2=5.2;
    iBorder_brg3=4.8;

    supr=-14;
    suph=19;
    suph_offset=-2.3;
    supy=23;

    supr2=-90-28/2;
    suph2=50.3; //33.9;
    suph_offset2=-(50.3)/2-3; //;-v_unit/2-1;
    supy2=1.3;

    supr3=-swr/2;
    suph3=6; //33.9;
    suph_offset3=-2.3; //;-v_unit/2-1;
    supy3=-27.2;
    
    supty=-v_unit/2+0.3;
    supth=pcb_thickness*1-3.5;
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc");
        }
            }
    }    
}

    
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos,swy*-1,swh]){
        rotate([-1*swr,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[iBorder_brg1,0,0,0],use_switch_type="choc");
                
        }
            }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[iBorder_brg2,iBorder_brg2,0,0],use_switch_type="choc");
        }
            }
    }

        translate([h_unit*h_unit_pos,swy,swh]){
        rotate([swr,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,iBorder_brg3,0,0],use_switch_type="choc");
        }
            }
    }

//switch+keycaps
    switch_hight=8;
    switch_base_hight=5.5;   
    switch_base_v=15;
    switch_base_h=15;    
    keycaps_hight=4;
    keycaps_h=11.4;
    keycaps_v=11.4;
    
       translate([h_unit*h_unit_pos,swy*-1,swh]){
        rotate([-1*swr,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }       
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,swy,swh]){
        rotate([swr,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }   
   


      translate([h_unit*h_unit_pos,swy*-1,swh]){
        rotate([-1*swr,0,0]) { 
            translate([-switch_base_h/2,-switch_base_v/2,pcb_thickness]) {
        %cube([switch_base_h,switch_base_v,switch_base_hight],center=false);
                
        }
            }
    }       
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-switch_base_h/2,-switch_base_v/2,pcb_thickness]) {
        %cube([switch_base_h,switch_base_v,switch_base_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,swy,swh]){
        rotate([swr,0,0]) { 
            translate([-switch_base_h/2,-switch_base_v/2,pcb_thickness]) {
        %cube([switch_base_h,switch_base_v,switch_base_hight],center=false);
                
        }
            }
    } 
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

        if (counter_type==3) {
            rotate([supr,0,0]) { 

                translate([h_unit*h_unit_pos,supy,suph/2+suph_offset]){
            #cube([15,2,suph],center=true);
        }
    }

            rotate([supr2,0,0]) { 

                translate([-h_unit*h_unit_pos,supy2,suph2/2+suph_offset2]){
            %cube([15,2,suph2],center=true);
        }
    }
    
difference() {
    
            rotate([supr3,0,0]) { 

                translate([-h_unit*h_unit_pos,supy3,suph3/2+suph_offset3]){
            cube([15,2,suph3],center=true);
        }
    }



    
            rotate([supr3,0,0]) { 

                translate([-h_unit*h_unit_pos,supy3-0.55,suph3/2+suph_offset3-2]){
            #cube([15,1,2],center=true);
        }
    }


}   
            
        }

}

module OneCol5_13(h_unit_pos, counter_type) {
    
    swr=28;
    swh_offset=2;
    swh=2.1943+0.1316+0.1316*2.5+0.0002+swh_offset;
    swy=v_unit*1+(15/90*pcb_thickness)+1+2.5+0.00045-1.325;
    iBorder_brg1=4.8; //72.3
    iBorder_brg2=5.2;
    iBorder_brg3=4.77;

    swr_2=20;    
    swh_offset_2=0.725;
    swh_2=2.1943+0.1316+0.1316*2.5+0.0002+swh_offset_2;
    swy_2=v_unit*1+(15/90*pcb_thickness)+1+1.5+0.00045-1.325;
 //    iBorder_brg1_2=4.8; //72.3
    iBorder_brg2_2=2.11;
//    iBorder_brg3_2=4.8;

    supr=-14;
    suph=16.4;
    suph_offset=-2.3;
    supy=23;

    supr2=-90-28/2;
    suph2=50.3; //33.9;
    suph_offset2=-(50.3)/2-3; //;-v_unit/2-1;
    supy2=1.3;

    supr3=-swr/2;
    suph3=6; //33.9;
    suph_offset3=-2.3; //;-v_unit/2-1;
    supy3=-27.2;
    
    supty=-v_unit/2+0.3;
    supth=pcb_thickness*1-3.5;
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,(v_unit*-2)-2,8.9598+0.1316]){
        rotate([-30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,2,0,0],use_switch_type="choc");
        }
            }
    }    
}

    
//    if (counter_type>3) {
       translate([h_unit*h_unit_pos,swy*-1,swh]){
        rotate([-1*swr,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[iBorder_brg1,0,0,0],use_switch_type="choc");
                
        }
            }
    }  
//}

    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[iBorder_brg2_2,iBorder_brg2,0,0],use_switch_type="choc");
        }
            }
    }

        translate([h_unit*h_unit_pos,swy_2,swh_2]){
        rotate([swr_2,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.831,iBorder_brg3,0,0],use_switch_type="choc");
        }
            }
    }

//switch+keycaps
    switch_hight=8;
    switch_base_hight=5.5;   
    switch_base_v=15;
    switch_base_h=15;    
    keycaps_hight=4;
    keycaps_h=10;
    keycaps_v=10;
    
       translate([h_unit*h_unit_pos,swy*-1,swh]){
        rotate([-1*swr,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }       
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,swy_2,swh_2]){
        rotate([swr_2,0,0]) { 
            translate([-keycaps_h/2,-keycaps_v/2,(switch_hight+keycaps_hight)/2-pcb_thickness/2]) {
        %cube([keycaps_h,keycaps_v,switch_hight+keycaps_hight],center=false);
                
        }
            }
    }   
   


      translate([h_unit*h_unit_pos,swy*-1,swh]){
        rotate([-1*swr,0,0]) { 
            translate([-switch_base_h/2,-switch_base_v/2,pcb_thickness]) {
        %cube([switch_base_h,switch_base_v,switch_base_hight],center=false);
                
        }
            }
    }       
    translate([h_unit*h_unit_pos,v_unit*0,0]){
        rotate([0,0,0]) { 
            translate([-switch_base_h/2,-switch_base_v/2,pcb_thickness]) {
        %cube([switch_base_h,switch_base_v,switch_base_hight],center=false);
                
        }
            }
    }
       translate([h_unit*h_unit_pos,swy_2,swh_2]){
        rotate([swr_2,0,0]) { 
            translate([-switch_base_h/2,-switch_base_v/2,pcb_thickness]) {
        %cube([switch_base_h,switch_base_v,switch_base_hight],center=false);
                
        }
            }
    } 
    
        if (counter_type>4) {
        translate([h_unit*h_unit_pos,v_unit*2+2
    ,8.9455+0.1316]){
        rotate([30,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[0,2.831,0,0],use_switch_type="choc");
        }
            }
    }    

}

        if (counter_type==3) {
            rotate([supr,0,0]) { 

                translate([h_unit*h_unit_pos,supy,suph/2+suph_offset]){
            #cube([15,2,suph],center=true);
        }
    }

            rotate([supr2,0,0]) { 

                translate([-h_unit*h_unit_pos,supy2,suph2/2+suph_offset2]){
            %cube([15,2,suph2],center=true);
        }
    }
    
difference() {
    
            rotate([supr3,0,0]) { 

                translate([-h_unit*h_unit_pos,supy3,suph3/2+suph_offset3]){
            cube([15,2,suph3],center=true);
        }
    }



    
            rotate([supr3,0,0]) { 

                translate([-h_unit*h_unit_pos,supy3-0.55,suph3/2+suph_offset3-2]){
            #cube([15,1,2],center=true);
        }
    }


}   
            
        }

}



//thumb
module OneCol_RT1() {

    translate([h_unit*1.1,v_unit*-0.5,0]){
        rotate([0,0,90]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,2,11,6],use_switch_type="choc");
        }
            }
    }
    
//--

    translate([h_unit*0,v_unit*-0.5,0]){
        rotate([0,0,90]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,3,11,5.72],use_switch_type="choc");
        }
            }
    }
    
//--
 
    translate([h_unit*-1.1,v_unit*0,0.79]){
        rotate([5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.1,2,1,2],use_switch_type="choc");
        }
            }
    }
 
    translate([h_unit*-1.1,v_unit*-1.1,0.79]){
        rotate([-5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,1.4775,1,2],use_switch_type="choc");
        }
            }
    }
//--

 
    translate([h_unit*-1.1,v_unit*1.1,4.69]){
        rotate([20,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.4775,2.1,1,2],use_switch_type="choc");
        }
            }
    }

    translate([h_unit*0,v_unit*1.1,4.69]){
        rotate([20,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.4775,6.71,3,2],use_switch_type="choc");
        }
            }
    }
    
}

module OneCol_RT2() {

    translate([h_unit*1.1,v_unit*-0.5,0]){
        rotate([0,0,90]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,3,11,6],use_switch_type="choc");
        }
            }
    }
    
//--

//--
 
    translate([h_unit*0,v_unit*0,0.79]){
        rotate([5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.1,2,2,2],use_switch_type="choc");
        }
            }
    }
 
    translate([h_unit*0,v_unit*-1.1,0.79]){
        rotate([-5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,1.4775,2,2],use_switch_type="choc");
        }
            }
    }
    
//--
 
    translate([h_unit*-1.1,v_unit*0,0.79]){
        rotate([5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.1,2,1,2],use_switch_type="choc");
        }
            }
    }
 
    translate([h_unit*-1.1,v_unit*-1.1,0.79]){
        rotate([-5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,1.4775,1,2],use_switch_type="choc");
        }
            }
    }
//--

 
    translate([h_unit*-1.1,v_unit*1.1,4.69]){
        rotate([20,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.4775,2.1,1,2],use_switch_type="choc");
        }
            }
    }

    translate([h_unit*0,v_unit*1.1,4.69]){
        rotate([20,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.4775,2.1,3,2],use_switch_type="choc");
        }
            }
    }
    
}

module OneCol_LT1() {

    translate([h_unit*-1.1,v_unit*-0.5,0]){
        rotate([0,0,-90]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        
                switch_socket(borders=[2,2,6,11],use_switch_type="choc");
        }
            }
    }
    
//--

    translate([h_unit*0,v_unit*-0.5,0]){
        rotate([0,0,-90]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,3,5.72,11],use_switch_type="choc");
        }
            }
    }
    
//--
 
    translate([h_unit*1.1,v_unit*0,0.79]){
        rotate([5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.1,2,2,1],use_switch_type="choc");
        }
            }
    }
 
    translate([h_unit*1.1,v_unit*-1.1,0.79]){
        rotate([-5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,1.4775,2,1],use_switch_type="choc");
        }
            }
    }
//--

 
    translate([h_unit*1.1,v_unit*1.1,4.69]){
        rotate([20,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.4775,2.1,2,1],use_switch_type="choc");
        }
            }
    }

    translate([h_unit*0,v_unit*1.1,4.69]){
        rotate([20,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.4775,6.71,3,2],use_switch_type="choc");
        }
            }
    }
    
}

module OneCol_T1UL(BL,BR) {
    //1U
        translate([h_unit*0,v_unit*-0.5,0]){
        rotate([0,0,-90]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[BR,BL,6,11],use_switch_type="choc");
        }
            }
    }

}

module OneCol_T1UR(BL,BR) {
    //1U
        translate([h_unit*0,v_unit*-0.5,0]){
        rotate([0,0,90]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[BL,BR,11,6],use_switch_type="choc");
        }
            }
    }

}

module OneCol_T3U(BL1,BR1,BL2,BR2,BL3,BR3) {
    //3U 2,2 - 2,3

    translate([h_unit*0,v_unit*1.1,4.69]){
        rotate([20,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.4775,2.1,BL1,BR1],use_switch_type="choc");
        }
            }
    }    

//    translate([h_unit*0.5+BR1-1-1/2,v_unit*1.1,4.69+pcb_thickness/2-5/2]){
//        rotate([20,0,0]) { 
//            #cube([1,v_unit,0],center=true);
//            }
//    }    
//    translate([h_unit*-0.5-BL1+1+1/2,v_unit*1.1+0.33,4.69+pcb_thickness/2-3/2]){
//        rotate([20,0,0]) { 
//            #cube([1,v_unit,3],center=true);
//            }
//    }
    
    translate([h_unit*0,v_unit*0,0.79]){
        rotate([5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.1,2,BL2,BR2],use_switch_type="choc");
        }
            }
    }
 
    translate([h_unit*0,v_unit*-1.1,0.79]){
        rotate([-5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,1.4775,BL3,BR3],use_switch_type="choc");
        }
            }
    }    

}


module OneCol_T3UL2() {
    //3U 2,2 - 2,3
    
    translate([h_unit*0,v_unit*0,0.79]){
        rotate([5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.1,2,2,2],use_switch_type="choc");
        }
            }
    }
 
    translate([h_unit*0,v_unit*-1.1,0.79]){
        rotate([-5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,1.4775,2,2],use_switch_type="choc");
        }
            }
    }    

    translate([h_unit*0,v_unit*1.1,4.69]){
        rotate([20,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.4775,2.1,2,3],use_switch_type="choc");
        }
            }
    }    
}

module OneCol_T3UL1() {
    //3U 2,1
    translate([h_unit*0,v_unit*0,0.79]){
        rotate([5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.1,2,2,1],use_switch_type="choc");
        }
            }
    }
 
    translate([h_unit*0,v_unit*-1.1,0.79]){
        rotate([-5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,1.4775,2,1],use_switch_type="choc");
        }
            }
    }
 
    translate([h_unit*0,v_unit*1.1,4.69]){
        rotate([20,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.4775,2.1,2,1],use_switch_type="choc");
        }
            }
    }    
}
module OneCol_T2UR(BL1,BR1,BL2,BR2) {
    //2U 2,3
    //RIGHT
    translate([h_unit*0,v_unit*1.1,4.69]){
        rotate([20,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.4775,6.71,BL1,BR1],use_switch_type="choc");
        }
            }
    }
    translate([h_unit*0,v_unit*-0.5,0]){
        rotate([0,0,90]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[BL2,BR2,11,5.72],use_switch_type="choc");
        }
            }
    }
}

module OneCol_T2UL(BL1,BR1,BL2,BR2) {
    //2U 3,2
    //LEFT
    translate([h_unit*0,v_unit*1.1,4.69]){
        rotate([20,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.4775,6.71,BL1,BR1],use_switch_type="choc");
        }
            }
    }

    translate([h_unit*0,v_unit*-0.5,0]){
        rotate([0,0,-90]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[BR2,BL2,5.72,11],use_switch_type="choc");
        }
            }
    }
}

module OneCol_LT2() {

    translate([h_unit*-1.1,v_unit*-0.5,0]){
        rotate([0,0,-90]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,3,6,11],use_switch_type="choc");
        }
            }
    }
    
//--

//--
 
    translate([h_unit*0,v_unit*0,0.79]){
        rotate([5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.1,2,2,2],use_switch_type="choc");
        }
            }
    }
 
    translate([h_unit*0,v_unit*-1.1,0.79]){
        rotate([-5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,1.4775,2,2],use_switch_type="choc");
        }
            }
    }
    
//--
 
    translate([h_unit*1.1,v_unit*0,0.79]){
        rotate([5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2.1,2,2,1],use_switch_type="choc");
        }
            }
    }
 
    translate([h_unit*1.1,v_unit*-1.1,0.79]){
        rotate([-5,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[2,1.4775,2,1],use_switch_type="choc");
        }
            }
    }
//--

 
    translate([h_unit*1.1,v_unit*1.1,4.69]){
        rotate([20,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.4775,2.1,2,1],use_switch_type="choc");
        }
            }
    }

    translate([h_unit*0,v_unit*1.1,4.69]){
        rotate([20,0,0]) { 
            translate([-h_unit/2,v_unit/2,pcb_thickness/2]) {
        switch_socket(borders=[1.4775,2.1,2,3],use_switch_type="choc");
        }
            }
    }
    
}

module Group_TR_4x3() {

translate([h_unit*-2.6,v_unit*-0.22,0]){
    rotate([0,0,10]){
        OneCol_T3U(2,4.8, 2,3.9, 2,3.2);
    }
}    
translate([h_unit*-1.3,v_unit*-0.05,0]){
    rotate([0,0,5]){
        OneCol_T3U(4.8,5, 3.9,3.5, 3.2,3.5);
    }
}
translate([h_unit*0,v_unit*0,0]){
        OneCol_T2UR(4,4,4,3);
}
translate([h_unit*1.1,v_unit*0,0]){
        OneCol_T1UR(2,2);
}

}

module Group_TR_3x3() {

 
translate([h_unit*-1.3,v_unit*-0.35,2]){
    rotate([-3,10,5]){
        OneCol_T3U(2,5, 2,3.5, 2,3.5);
    }
}
translate([h_unit*0,v_unit*0,0]){
        OneCol_T2UR(4,4,4,5);
}
translate([h_unit*1.1,v_unit*0,0]){
        OneCol_T1UR(2,2);
}

}
module Group_TL_3x3() {

 
translate([h_unit*1.3,v_unit*-0.35,2]){
    rotate([3,-10,-5]){
        OneCol_T3U(5,2, 2,2, 2,2);
    }
}
translate([h_unit*0,v_unit*0,0]){
        OneCol_T2UL(4,4,4,5);
}
translate([h_unit*-1.1,v_unit*0,0]){
        OneCol_T1UL(2,2);
}

}

//Group_TR_3x3();

//Group_test_OneCol5();


module Group_test_OneCol5() {

translate ([h_unit*-2.1,v_unit*0,10]){
rotate([0,20,0])
OneCol5(0,3);
}
translate ([h_unit*-1.1,v_unit*0,5]){
rotate([0,15,0])
OneCol5(0,4);
} 
translate ([h_unit*-0.1,v_unit*0,0]){
rotate([0,10,0])
OneCol5(0,5);
}
translate ([h_unit*1,v_unit*0.2,-5]){
    OneCol5(0,5);
}
translate ([h_unit*2,v_unit*0,0]){
    OneCol5(0,5);
}
translate ([h_unit*3.08,v_unit*-0.5,5]){
    rotate([0,-10,0])
    OneCol5(0,5);
}
translate ([h_unit*4.05,v_unit*-0.5,10]){
    rotate([0,-15,0])
    OneCol5(0,5);
}
}



//OneCol5(0,5);


//  Group_test_OneCol5();

//translate([h_unit*1,-v_unit*1,0]){
//    switch_socket(borders=[1,1,1,1],use_switch_type="choc");
//}
//translate([h_unit*3,-v_unit*1,0]){

//translate([h_unit*2,-v_unit*1,0]){
//    switch_socket(borders=[1,1,1,1],use_switch_type="chocV2");
//}
//translate([h_unit*3,-v_unit*1,0]){
//    switch_socket(borders=[1,1,1,1],use_switch_type="chocMini");
//}
//translate([h_unit*4,-v_unit*1,0]){
//    switch_socket(borders=[1,1,1,1],use_switch_type="mx");
//}
//translate([h_unit*5,-v_unit*1,0]){
//    switch_socket(borders=[1,1,1,1],use_switch_type="mx_low");
//} 
//translate([h_unit*6,-v_unit*1,0]){
//    switch_socket(borders=[1,1,1,1],use_switch_type="ks27");
//}
//translate([h_unit*7,-v_unit*1,0]){
//    switch_socket(borders=[1,1,1,1],use_switch_type="redragon_low");
//}
//translate([h_unit*8,-v_unit*1,0]){
//    switch_socket(borders=[1,1,1,1],use_switch_type="romer_g");
//}
//

// 把 //拿掉可以執行
// 目前 3U M字 跟 L字的設計較為完整

//====5U========
//OneCol5(1,5);
//OneCol5_1(0,3);
//OneCol5_2(0,3);

//=====3U =========

//------ M字 ------

//>>>> 窄間距 (13mm)
//OneCol5_3(0,3);
//>>>> 一般間距 (16.3mm)
//OneCol5_4(0,3);
//>>>> 一般座長、窄間距鍵
//OneCol5_9(0,3);

//------ L字 ------

//>>>> 凸前端 一般間距 (16.3mm) (必須設定 unit=16mm)
//OneCol5_5(0,3);

//>>>> 凸前端 窄間距 (Keycaps 13mm)
//OneCol5_6(0,3);

//凸前端 最窄間距 (Keycaps 11.4mm)
//OneCol5_11(0,3);

//高L字 窄間距 (Keycaps 11.4mm)
//OneCol5_10(0,3);

//-----高尾M--------
//仰角 (Keycaps 11.4mm)
//OneCol5_12(0,3);
//平角
//OneCol5_13(0,3);

//====TEST=====

//大M字
//OneCol5_7(0,3);

//ㄩ字型
//OneCol5_8(0,3);

//六鍵拇指簇
//右側
//OneCol_RT1();
//左側
//OneCol_LT1();

//七鍵拇指簇
//右側
//OneCol_RT2();
//左側
//OneCol_LT2();

//L 拇指
//OneCol5_5_Thumber15(0,3);
OneCol5_5_Thumber10("R",0,3);