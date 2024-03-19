include <parameters.scad>
include <utils.scad>

module switch_socket(borders=[1,1,1,1], rotate_column=false,use_switch_type=switch_type) {
   
    //    difference() { 
    union() {
    translate([0,0,0])    
//    rotate(a=-5, v=[0,0,0])
    difference() {
        if (use_switch_type=="chocMini") {
            switch_socket_base_chocMini(borders);
            
        } else if (use_switch_type=="choc" && switch_socket_base_holder==true) {
            switch_socket_base_choc(borders);
            
        } else if (use_switch_type=="choc_holder") {
            switch_socket_base_choc(borders);
            
        } else if (use_switch_type=="chocV2_1u") {
            switch_socket_base_1U_PCB(borders);
            
        } else if (use_switch_type=="mx" && switch_socket_base_holder==true) {
            switch_socket_base_mx(borders);
            
        } else if (use_switch_type=="mx_holder") {
            switch_socket_base_mx(borders);
            
        } else {
            switch_socket_base(borders);
            
        }
        switch_socket_cutout(borders, rotate_column,use_switch_type);
    }
    
//    difference() {
//        switch_socket_base_1U(borders);
//        switch_socket_cutout(borders, rotate_column);
//    }
}
}

module switch_socket_base(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0]) 
    //    difference() {
   union() {
        cube([socket_size, socket_size, pcb_thickness], center=true);
        translate([0,0,border_z_offset ])
            border(
                [socket_size,socket_size], 
                borders, 
                pcb_thickness-2, 
                h_border_width, 
                v_border_width
            );
    }
}


module switch_socket_base_1U_PCB(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0]) 
        difference() {
   //union() {
        cube([13.3, 14, pcb_thickness], center=true);
        translate([0,0,border_z_offset ])
            border(
                [socket_size,socket_size], 
                borders, 
                pcb_thickness-2, 
                h_border_width, 
                v_border_width
            );
    }
}

module switch_socket_base_chocMini(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0]) 
    //    difference() {
   union() {
        cube([socket_size, socket_size, pcb_thickness-2], center=true);
        translate([0,0,border_z_offset ])
            border(
                [socket_size,socket_size], 
                borders, 
                pcb_thickness-2, 
                h_border_width, 
                v_border_width
            );
    }
}

module switch_socket_base_1U(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0]) 
        translate([0,0,border_z_offset ])
            border(
                [socket_size,socket_size], 
                borders, 
                pcb_thickness-2, 
                h_border_width, 
                v_border_width
            );
}


//Choc軸加勾釦的底座
module switch_socket_base_choc(borders=[1,1,1,1]) {
    //choc_holder_wall_h_thickness=(h_unit/2)-(14.5/2);
    //choc_holder_wall_h_thickness_add=1.5-(socket_size-13.8);
    choc_holder_wall_h_thickness_add=0;
    
    choc_holder_wall_h_thickness=socket_size-13.8+choc_holder_wall_h_thickness_add;
    choc_holder_wall_h_width_r=3.8;
    choc_holder_wall_h_width_l=4.5;
    choc_holder_wall_height=2.2;  //2.2
    
//    //上牆 
//    translate([socket_size+(h_unit-socket_size)/2-choc_holder_wall_h_width_r/2,-(v_unit-socket_size)/2-choc_holder_wall_h_thickness/2+choc_holder_wall_h_thickness_add,(choc_holder_wall_height/2)]) 
//        cube([choc_holder_wall_h_width_r, choc_holder_wall_h_thickness, pcb_thickness+choc_holder_wall_height], center=true);
//
//    translate([(h_unit-socket_size)/2+choc_holder_wall_h_width_l/2,-(v_unit-socket_size)/2-choc_holder_wall_h_thickness/2+choc_holder_wall_h_thickness_add,(choc_holder_wall_height/2)]) 
//        cube([choc_holder_wall_h_width_l, choc_holder_wall_h_thickness, pcb_thickness+choc_holder_wall_height], center=true);

    //choc_holder_wall_v_thickness_add=1.5-(socket_size-14.5);
    choc_holder_wall_v_thickness_add=0.5;
    //choc_holder_wall_v_thickness_add=0;
    choc_holder_wall_v_thickness=socket_size-14.5+choc_holder_wall_v_thickness_add;
    choc_holder_wall_v_width_r=5+7.85;
    choc_holder_wall_v_width_l=5+7.85;
    choc_holder_wall_v_offset=0.2;
    choc_holder_wall_support_width=1;
    
    //勾住位置
    choc_holder_hook_thickness=0.35; //0.35
    choc_holder_hook_height=1;     //1.3
    choc_holder_hook_length=2.5;     //2.5
    choc_holder_hook_margin1=3.5;     //3.5
    choc_holder_hook_margin2=choc_holder_hook_margin1+7;     //10.5

    //右牆
    translate([socket_size+(h_unit-socket_size)/2-choc_holder_wall_v_thickness/2+choc_holder_wall_v_thickness_add+choc_holder_wall_v_offset,-(v_unit-socket_size)/2-choc_holder_wall_v_width_r/2,(choc_holder_wall_height/2)]) {
        cube([choc_holder_wall_v_thickness,choc_holder_wall_v_width_r,  pcb_thickness+choc_holder_wall_height], center=true);
    }
//    
//    translate([socket_size+(h_unit-socket_size)/2-choc_holder_wall_v_thickness/2+choc_holder_wall_v_thickness_add+choc_holder_wall_v_offset+choc_holder_wall_v_thickness_add+choc_holder_wall_support_width/2, -(v_unit-socket_size)/2-choc_holder_wall_v_width_r/2, (choc_holder_wall_height+2)/2]) 
//    {
//        rotate([0,0,90])
//        chamfer(choc_holder_wall_v_width_r, choc_holder_wall_support_width, choc_holder_wall_height+2);
//    
//    }
//    
   //-(v_unit-socket_size)/2-choc_holder_wall_v_width_r/2

    if (switch_socket_base_holder_support_frame) {

    translate([socket_size+(h_unit-socket_size)/2-choc_holder_wall_v_thickness/2+choc_holder_wall_v_thickness_add+choc_holder_wall_v_offset+choc_holder_wall_v_thickness_add+choc_holder_wall_support_width/2, -(socket_size+choc_holder_wall_v_thickness)/2, (choc_holder_wall_height+2)/2]) 
    {
        rotate([0,0,0])
        right_triangle(choc_holder_wall_support_width,choc_holder_wall_v_thickness,(choc_holder_wall_height+2),0,0,0);
    }
}
//        }
    //右短牆
//     translate([socket_size+(h_unit-socket_size)/2-choc_holder_wall_v_thickness/2+choc_holder_wall_v_thickness_add+choc_holder_wall_v_offset,-(v_unit)/2+2.5+(choc_holder_hook_length/2),(choc_holder_wall_height/2)]) 
//        cube([choc_holder_wall_v_thickness,choc_holder_hook_length, pcb_thickness+choc_holder_wall_height ], center=true);
//
//     translate([socket_size+(h_unit-socket_size)/2-choc_holder_wall_v_thickness/2+choc_holder_wall_v_thickness_add+choc_holder_wall_v_offset,-(v_unit)/2-2.5-(choc_holder_hook_length/2),(choc_holder_wall_height/2)]) 
//        cube([choc_holder_wall_v_thickness,choc_holder_hook_length, pcb_thickness+choc_holder_wall_height ], center=true);

    //右短牆連橫牆
//    translate([socket_size+(h_unit-socket_size)/2-choc_holder_wall_v_thickness/2+choc_holder_wall_v_thickness_add+choc_holder_wall_v_offset,-(v_unit)/2,(choc_holder_wall_height/2)-choc_holder_hook_height/2]) 
//        cube([choc_holder_wall_v_thickness,5, pcb_thickness+choc_holder_wall_height -choc_holder_hook_height], center=true);


        
     translate([socket_size+(h_unit-socket_size)/2-(choc_holder_wall_v_thickness+choc_holder_hook_thickness)/2+choc_holder_wall_v_thickness_add,-(v_unit)/2+2.5+(choc_holder_hook_length/2),(pcb_thickness+choc_holder_hook_height)/2+choc_holder_wall_height-choc_holder_hook_height]) 

        cube([choc_holder_wall_v_thickness+choc_holder_hook_thickness,choc_holder_hook_length, choc_holder_hook_height ], center=true);
 
     translate([socket_size+(h_unit-socket_size)/2-(choc_holder_wall_v_thickness+choc_holder_hook_thickness)/2+choc_holder_wall_v_thickness_add,-(v_unit)/2-2.5-(choc_holder_hook_length/2),(pcb_thickness+choc_holder_hook_height)/2+choc_holder_wall_height-choc_holder_hook_height]) 
    
    cube([choc_holder_wall_v_thickness+choc_holder_hook_thickness,choc_holder_hook_length, choc_holder_hook_height ], center=true);
 
    //左牆
    translate([(h_unit-socket_size)/2+choc_holder_wall_v_thickness/2-choc_holder_wall_v_thickness_add-choc_holder_wall_v_offset, -(v_unit-socket_size)/2-choc_holder_wall_v_width_l/2, (choc_holder_wall_height/2)]) {
        cube([choc_holder_wall_v_thickness,choc_holder_wall_v_width_l,  pcb_thickness+choc_holder_wall_height], center=true);
    }
    
//    translate([(h_unit-socket_size)/2+choc_holder_wall_v_thickness/2-choc_holder_wall_v_thickness_add-choc_holder_wall_v_offset-choc_holder_wall_v_thickness_add-choc_holder_wall_support_width/2,  -(v_unit-socket_size)/2-choc_holder_wall_v_width_l/2,  (choc_holder_wall_height+2)/2]) {
//        rotate([0,0,90+180])
//        chamfer(choc_holder_wall_v_width_l, choc_holder_wall_support_width, choc_holder_wall_height+2);
//    }

if (switch_socket_base_holder_support_frame) {

    translate([(h_unit-socket_size)/2+choc_holder_wall_v_thickness/2-choc_holder_wall_v_thickness_add-choc_holder_wall_v_offset-choc_holder_wall_v_thickness_add-choc_holder_wall_support_width/2+choc_holder_wall_support_width,  -(socket_size+choc_holder_wall_v_thickness)/2,  (choc_holder_wall_height+2)/2]) {
        right_triangle(choc_holder_wall_support_width,choc_holder_wall_v_thickness,(choc_holder_wall_height+2),0,0,180);
    }
}
//     translate([(h_unit-socket_size)/2+(choc_holder_wall_v_thickness+choc_holder_hook_thickness)/2-choc_holder_wall_v_thickness_add,-(v_unit-socket_size)/2-choc_holder_wall_v_width_l/2-(choc_holder_hook_margin1/2),(pcb_thickness+choc_holder_hook_height)/2+choc_holder_wall_height-choc_holder_hook_height]) 

    //左短牆

//    translate([(h_unit-socket_size)/2+(choc_holder_wall_v_thickness)/2-choc_holder_wall_v_thickness_add-choc_holder_wall_v_offset,-(v_unit)/2+2.5+(choc_holder_hook_length/2),(choc_holder_wall_height/2)]) 
//     #cube([choc_holder_wall_v_thickness,choc_holder_hook_length,  pcb_thickness+choc_holder_wall_height ], center=true);
//
//    translate([(h_unit-socket_size)/2+choc_holder_wall_v_thickness/2-choc_holder_wall_v_thickness_add-choc_holder_wall_v_offset,-(v_unit)/2-2.5-(choc_holder_hook_length/2),(choc_holder_wall_height/2)]) 
//     #cube([choc_holder_wall_v_thickness,choc_holder_hook_length,  pcb_thickness+choc_holder_wall_height ], center=true);
//

    //左短牆連橫牆
//    translate([(h_unit-socket_size)/2+(choc_holder_wall_v_thickness)/2-choc_holder_wall_v_thickness_add-choc_holder_wall_v_offset,-(v_unit)/2,(choc_holder_wall_height/2)-choc_holder_hook_height/2]) 
//        cube([choc_holder_wall_v_thickness,5, pcb_thickness+choc_holder_wall_height -choc_holder_hook_height], center=true);
        
        
    translate([(h_unit-socket_size)/2+(choc_holder_wall_v_thickness+choc_holder_hook_thickness)/2-choc_holder_wall_v_thickness_add,-(v_unit)/2+2.5+(choc_holder_hook_length/2),(pcb_thickness+choc_holder_hook_height)/2+choc_holder_wall_height-choc_holder_hook_height]) 
     
    cube([choc_holder_wall_v_thickness+choc_holder_hook_thickness,choc_holder_hook_length, choc_holder_hook_height ], center=true);

     translate([(h_unit-socket_size)/2+(choc_holder_wall_v_thickness+choc_holder_hook_thickness)/2-choc_holder_wall_v_thickness_add,-(v_unit)/2-2.5-(choc_holder_hook_length/2),(pcb_thickness+choc_holder_hook_height)/2+choc_holder_wall_height-choc_holder_hook_height]) 
     
     cube([choc_holder_wall_v_thickness+choc_holder_hook_thickness,choc_holder_hook_length, choc_holder_hook_height ], center=true);

 
/////

    translate([h_unit/2,-v_unit/2,0]) 
    //    difference() {
    union() {
        cube([socket_size, socket_size, pcb_thickness], center=true);
        translate([0,0,border_z_offset ])
            border(
                [socket_size,socket_size], 
                borders, 
                pcb_thickness-2, 
                h_border_width, 
                v_border_width
            );
    }
}

module switch_socket_base_mx(borders=[1,1,1,1]) {
    //MX軸的定位板為方形14mm的空間
    //因此模擬溝槽的部分，應該是夾起來要14mm
    //也就是牆厚與鉤子寬度不論怎麼設定，都要讓空間保留14mm
    //頂多少0.5mm做為緩衝
    
    //多0.5是預留給卡榫的空間
    mx_socket_size_v =14.5; //+0.25;
    mx_socket_size_h =14; //+0.25;
    //mx_holder_wall_h_thickness=(h_unit/2)-(14.5/2);
    
    //mx_holder_wall_h_thickness_add=1.25-(socket_size-mx_socket_size_v);
    //mx_holder_wall_v_thickness_add=1.25-(socket_size-mx_socket_size_v);
    
    mx_holder_wall_h_thickness_add=1;
    mx_holder_wall_v_thickness_add=1;
    
    mx_holder_wall_h_thickness=socket_size-mx_socket_size_v+mx_holder_wall_h_thickness_add;
    
    mx_holder_wall_v_thickness=socket_size-mx_socket_size_h+mx_holder_wall_v_thickness_add;
    
    mx_holder_wall_h_width_u=17; //5 //10;
    mx_holder_wall_h_width_d=17; //5 //10;
    mx_holder_wall_h_width=10; 
    mx_holder_wall_h_width_u_offset=0;// 5/2;
    mx_holder_wall_h_width_d_offset=0; //5/2;

    mx_holder_wall_v_width_r=17.5; //5 //16;
    mx_holder_wall_v_width_l=17.5; //4.5
    mx_holder_wall_v_width_ru=3; //5 //16;
    mx_holder_wall_v_width_lu=3; //4.5
    mx_holder_wall_v_width_rd=3; //5 //16;
    mx_holder_wall_v_width_ld=3; //4.5
    mx_holder_wall_v_width=5; 
    mx_holder_wall_v_width_r_offset=0;
    mx_holder_wall_v_width_l_offset=0;
    mx_holder_wall_v_width_ru_offset=0.25;
    mx_holder_wall_v_width_lu_offset=0.25;
    mx_holder_wall_v_width_rd_offset=0.25;
    mx_holder_wall_v_width_ld_offset=0.25;
    
    mx_holder_wall_height=5; //5

    mx_holder_hook_thickness=0.25; //0.25
    mx_holder_hook_height=1.4;//1.4;     //1.3
    mx_holder_hook_length=14; //5;     //2.5
    mx_holder_hook_margin1=3.5;     //3.5
    mx_holder_hook_margin2=mx_holder_hook_margin1+7;     //10.5

    
//    //檢測用軸體14x14x5
    %translate([h_unit/2,-v_unit/2,(pcb_thickness+5)/2])
    cube([14,14,5],center=true);
//     
//    echo("pcb_thickness:",pcb_thickness);
//    echo("socket_size:",socket_size);
//    echo("unit:", unit);
//    echo("v_unit:", v_unit);
//    echo("h_unit:", h_unit);
//    echo("mx_socket_size_v",mx_socket_size_v);
//    echo("mx_holder_wall_h_thickness:",mx_holder_wall_h_thickness);
//    echo("mx_holder_wall_h_thickness_add:",mx_holder_wall_h_thickness_add)
     
//上牆
    translate([unit/2+mx_holder_wall_h_width_u_offset, -(v_unit-mx_socket_size_v)/2 + mx_holder_wall_h_thickness/2, (mx_holder_wall_height)/2]) 
        cube([mx_holder_wall_h_width_u, mx_holder_wall_h_thickness, pcb_thickness+mx_holder_wall_height], center=true);

    //鉤子
    translate([unit/2, -(v_unit-mx_socket_size_v)/2 + mx_holder_wall_h_thickness/2 - mx_holder_hook_thickness/2,(pcb_thickness+mx_holder_hook_height)/2+mx_holder_wall_height-mx_holder_hook_height]) 
     
        cube([mx_holder_hook_length, mx_holder_wall_h_thickness+mx_holder_hook_thickness, mx_holder_hook_height ], center=true);
    
    //支撐
    if (switch_socket_base_holder_support_frame) {

    translate([unit/2 - mx_holder_wall_h_thickness /2 , -(v_unit-mx_socket_size_v)/2 +   mx_holder_wall_h_thickness + mx_holder_wall_support_width/2, (mx_holder_wall_height)/2]) 
    {
        rotate([0,0,90])
        right_triangle(mx_holder_wall_support_width,mx_holder_wall_h_thickness,(mx_holder_wall_height+pcb_thickness),0,0,0);
    }

    }
//下牆
    translate([h_unit/2+mx_holder_wall_h_width_d_offset, -v_unit/2-mx_holder_wall_h_thickness/2-mx_socket_size_v/2, (mx_holder_wall_height/2)]) 
        cube([mx_holder_wall_h_width_d, mx_holder_wall_h_thickness, pcb_thickness+mx_holder_wall_height], center=true);

    //鉤子
    translate([h_unit/2, -v_unit/2-mx_holder_wall_h_thickness/2-mx_socket_size_v/2+mx_holder_hook_thickness/2, (pcb_thickness+mx_holder_hook_height)/2+mx_holder_wall_height-mx_holder_hook_height]) 
     
        cube([mx_holder_hook_length, mx_holder_wall_h_thickness+mx_holder_hook_thickness, mx_holder_hook_height ], center=true);

//支撐
    if (switch_socket_base_holder_support_frame) {
    translate([h_unit/2 + mx_holder_wall_h_thickness/2 , -v_unit/2-mx_holder_wall_h_thickness-mx_socket_size_v/2 -  mx_holder_wall_support_width/2, (mx_holder_wall_height/2)])
    {
        rotate([0,0,-90])
        right_triangle(mx_holder_wall_support_width,mx_holder_wall_h_thickness,(mx_holder_wall_height+pcb_thickness),0,0,0);
    }
}
    
    
    mx_holder_wall_v_offset=0.2;
    mx_holder_wall_support_width=1;
    

//    //右牆
//    translate([(h_unit)/2 + mx_socket_size_h/2 +mx_holder_wall_v_thickness/2, -(v_unit)/2+mx_holder_wall_v_width_r_offset, (mx_holder_wall_height/2)]) {
//        cube([mx_holder_wall_v_thickness,mx_holder_wall_v_width_r,  pcb_thickness+mx_holder_wall_height], center=true);
//    }
//    
//    //左牆
//    translate([(h_unit)/2 - mx_socket_size_h/2 -mx_holder_wall_v_thickness/2 , -(v_unit)/2 +mx_holder_wall_v_width_l_offset, (mx_holder_wall_height/2)]) {
//        cube([mx_holder_wall_v_thickness,mx_holder_wall_v_width_l,  pcb_thickness+mx_holder_wall_height], center=true);
//    }
    
    //右牆-兩側式
    //-(v_unit)/2
    translate([(h_unit)/2 + mx_socket_size_h/2 +mx_holder_wall_v_thickness/2, -mx_holder_wall_v_width_ru/2 +mx_holder_wall_v_width_ru_offset, (mx_holder_wall_height/2)]) {
        cube([mx_holder_wall_v_thickness,mx_holder_wall_v_width_ru,  pcb_thickness+mx_holder_wall_height], center=true);
    }

    translate([(h_unit)/2 + mx_socket_size_h/2 +mx_holder_wall_v_thickness/2, -14 - (mx_holder_wall_v_width_rd/2) -mx_holder_wall_v_width_rd_offset, (mx_holder_wall_height/2)]) {
        cube([mx_holder_wall_v_thickness,mx_holder_wall_v_width_rd,  pcb_thickness+mx_holder_wall_height], center=true);
    }
    
    //左牆-兩側式
    //
    translate([(h_unit)/2 - mx_socket_size_h/2 -mx_holder_wall_v_thickness/2 , -(mx_holder_wall_v_width_lu)/2 +mx_holder_wall_v_width_lu_offset, (mx_holder_wall_height/2)]) {
        cube([mx_holder_wall_v_thickness,mx_holder_wall_v_width_lu,  pcb_thickness+mx_holder_wall_height], center=true);
    }
    
    translate([(h_unit)/2 - mx_socket_size_h/2 -mx_holder_wall_v_thickness/2 ,-14 -(mx_holder_wall_v_width_ld)/2 - mx_holder_wall_v_width_ld_offset, (mx_holder_wall_height/2)]) {
        cube([mx_holder_wall_v_thickness,mx_holder_wall_v_width_ld,  pcb_thickness+mx_holder_wall_height], center=true);
    }

 
/////

    translate([h_unit/2,-v_unit/2,0]) 
    //    difference() {
    union() {
        cube([socket_size, socket_size, pcb_thickness], center=true);
        translate([0,0,border_z_offset ])
            border(
                [socket_size,socket_size], 
                borders, 
                pcb_thickness-2, 
                h_border_width, 
                v_border_width
            );
    }
}

module switch_socket_cutout(borders=[1,1,1,1], rotate_column=false,use_switch_type=switch_type) {
    
    if (use_switch_type == "mx" || use_switch_type == "mx_holder") {
        if (use_folded_contact) {
            mx_improved_socket_cutout(borders, rotate_column);
        } else if (utp_wire==true && diode_less==false && wire_diameter<=1) {
            mx_socket_cutout_led(borders, rotate_column);     
        } else if (utp_wire==true && diode_less==true && wire_diameter<=1) {
            mx_socket_cutout_led_dl(borders, rotate_column);
        } else {
            mx_socket_cutout(borders, rotate_column);
        }
    } else if (use_switch_type == "chocV2" && utp_wire==true) {
        if (diode_less==false && wire_diameter<=1) {
            choc_v2_socket_cutout_led(borders, rotate_column);
        } else if (diode_less==true && wire_diameter<=1) {
            choc_v2_socket_cutout_led_dl(borders, rotate_column);      
        } else {
        assert(false, "switch_type is invalid");
        }
    } else if (use_switch_type == "choc" || use_switch_type == "choc_holder" || use_switch_type == "choc_1u") {
        if (utp_wire==true && diode_less==false && wire_diameter<=1) {
            choc_socket_cutout_led(borders, rotate_column);
        } else if (utp_wire==true && diode_less==true && wire_diameter<=1) {
            choc_socket_cutout_led_dl(borders, rotate_column);
        } else {
            choc_socket_cutout(borders, rotate_column);
        }    

    } else if (use_switch_type == "chocV2_1u") {
        choc_v2_socket_cutout_led_1U_PCB(borders, rotate_column);

    } else if (use_switch_type == "chocMini") {
        if (utp_wire==true && diode_less==false && wire_diameter<=1) {
            //還沒處理
            //chocMini_socket_cutout_led(borders, rotate_column);
            chocMini_socket_cutout_led_dl(borders, rotate_column);
        } else if (utp_wire==true && diode_less==true && wire_diameter<=1) {
            chocMini_socket_cutout_led_dl(borders, rotate_column);
        } else {
            //還沒處理
            //chocMini_socket_cutout(borders, rotate_column);
            chocMini_socket_cutout_led_dl(borders, rotate_column);
        }     
    } else if (use_switch_type == "ks27") {
        if (utp_wire==true && diode_less==false && wire_diameter<=1) {
            ks27_socket_cutout_led(borders, rotate_column);
        } else if (utp_wire==true && diode_less==true && wire_diameter<=1) {
            ks27_socket_cutout_led_dl(borders, rotate_column);
        } else {
            ks27_socket_cutout(borders, rotate_column);
        }    
    } else if (use_switch_type == "mx_low") {
        if (utp_wire==true && diode_less==false && wire_diameter<=1) {
            mxlow_socket_cutout_led(borders, rotate_column);
        } else if (utp_wire==true && diode_less==true && wire_diameter<=1) {
            mxlow_socket_cutout_led_dl(borders, rotate_column);
        } else {
            mxlow_socket_cutout(borders, rotate_column);
        }  
    } else if (use_switch_type == "redragon_low") {
        if (utp_wire==true && diode_less==false && wire_diameter<=1) {
            redragonlow_socket_cutout_led(borders, rotate_column);
        } else if (utp_wire==true && diode_less==true && wire_diameter<=1) {
            redragonlow_socket_cutout_led_dl(borders, rotate_column);
        } else {
            redragonlow_socket_cutout(borders, rotate_column);
        }  
    } else if (use_switch_type == "romer_g") {
        if (utp_wire==true && diode_less==false && wire_diameter<=1) {
            romerg_socket_cutout_led(borders, rotate_column);
        } else if (utp_wire==true && diode_less==true && wire_diameter<=1) {
            romerg_socket_cutout_led_dl(borders, rotate_column);
        } else {
            romerg_socket_cutout(borders, rotate_column);
        }  
        } else {
        assert(false, "switch_type is invalid");
    }
}

module mx_socket_cutout(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth])
                    cylinder(h=pcb_thickness+1,r=2.1);
                // Side pins
                for (x = [-4,4]) {
                    translate([x*grid,0,pcb_thickness/2-socket_depth])
                        cylinder(h=pcb_thickness+1,r=1.05);
                }
                // Top switch pin
                translate([2*grid,4*grid,pcb_thickness/2-socket_depth])
                    cylinder(h=pcb_thickness+1,r=1);
                // Bottom switch pin
                translate([-3*grid,2*grid,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=.7);
                // Diode cathode cutout
                translate([3*grid,-4*grid,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,4*grid,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=row_cutout_length,d=wire_diameter,center=true);
                // Column wire
                translate([3*grid,-4*grid,-(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                        translate([0,0,-4*grid])
                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);

                // Diode Channel
                translate([-3*grid,-1*grid-.25,pcb_thickness/2])
                    cube([1,6*grid+.5,2],center=true);
                translate([0,-4*grid,pcb_thickness/2])
                    cube([6*grid,1,2],center=true);
                translate([-1*grid-.5,-4*grid,pcb_thickness/2])
                    cube([4*grid,2,3],center=true);
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}
module mx_improved_socket_cutout(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth])
                    cylinder(h=pcb_thickness+1,r=2.1);
                // Side pins
                for (x = [-4,4]) {
                    translate([x*grid,0,pcb_thickness/2-socket_depth])
                        cylinder(h=pcb_thickness+1,r=1.05);
                }
                // Top switch pin
                translate([2*grid,4*grid,pcb_thickness/2-socket_depth])
                    cylinder(h=pcb_thickness+1,r=1);
                // Bottom switch pin
                translate([-3*grid,2*grid,-(pcb_thickness+1)/2]) {
                    translate([-.625,-0.75,0]) cube([1.25,1.5,pcb_thickness+1]);
                }
                // Diode cathode cutout
                translate([3*grid,-4*grid,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,4*grid,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=row_cutout_length,d=wire_diameter,center=true);
                // Column wire
                translate([3*grid,-4*grid,-(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                        translate([0,0,-4*grid])
                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);

                // Diode Channel
                translate([-3*grid,-1*grid-.25,pcb_thickness/2])
                    cube([1,6*grid+.5,2],center=true);
                translate([0,-4*grid,pcb_thickness/2])
                    cube([6*grid,1,2],center=true);
                translate([-1*grid-.5,-4*grid,pcb_thickness/2])
                    cube([4*grid,2,3],center=true);
                translate([-0.5*grid,2*grid+0.25,pcb_thickness/2])
                    cube([5*grid,1,2],center=true);
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module mx_socket_cutout_led(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=2.1,$fn=30);
                // Side pins
                for (x = [-4,4]) {
                    translate([x*grid,0,pcb_thickness/2-socket_depth-socket_depth])
                        cylinder(h=pcb_thickness+1+socket_depth,r=1.05);
                }
                // Top switch pin
                translate([2*grid,4*grid,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                
                // Bottom switch pin
                translate([-3*grid,2*grid,0])
                    rotate([180+diode_pin_angle,0,0])                    //cylinder(h=pcb_thickness+1,r=.7);
                cylinder(h=pcb_thickness+1,d=1.75,center=true, $fn=40);
                // Diode cathode cutout
                //for 5.1mm x 2.5mm diode
//                translate([.3*grid-.5,2.4*grid,pcb_thickness/2])
//                    cube([4*grid,2,3],center=true);
                // for 3.3mm x 1.9mm
                
                translate([.3*grid-.5,2.4*grid,3-pcb_thickness/2])
                    cube([3.5,2,2],center=true);

                //去除薄邊
                translate([0,1,3-pcb_thickness/2])
                    cube([2,3,3],center=true);                
                
                translate([3*grid,2.4*grid,0])
                    //cylinder(h=pcb_thickness+1,r=.7,center=true);
                    cylinder(h=pcb_thickness+1,d=1.75,center=true, $fn=40);
                // Diode cathode cutout - TO RETURN
                translate([6*grid,2.4*grid,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                translate([-2.2*grid,-1.5*grid,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Diode Channel
                //整條-左側
                translate([1.5,2.4*grid,pcb_thickness/2])
                    cube([9*grid,1,2],center=true);
                //右側
                translate([-2.5*grid,-0.1*grid,pcb_thickness/2])
                    rotate([0,0,15])
                    cube([1,3.5*grid,2],center=true);                
                //左側背面
                translate([4.5*grid,2.4*grid,-pcb_thickness/2])
                    cube([3*grid,1,2],center=true);
    //左側背面
                translate([-2.5*grid,-0.1*grid,-pcb_thickness/2])
                    rotate([0,0,15])
                    cube([1,3.5*grid,2],center=true);                                 
                // Wire Channels
                // Row wire
                translate([0,4*grid,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    //cylinder(h=18,d=wire_diameter,center=true);
                cube([pcb_thickness/1.5,wire_diameter,18],center=true);
                
                // Column wire
                //Lower channel
//                translate([3*grid,-4*grid,-(pcb_thickness/2-wire_diameter/2)]) 
//                    rotate([90,0,rotate_column?90:0])
//                        translate([0,0,-4*grid])
//                        cylinder(h=col_cutout_length,d=wire_diameter*1.5,center=true);

                //Upper channel
                translate([3.5*grid,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                translate([2.5*grid,-3.8-0.3,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cube([wire_diameter,pcb_thickness/1.5,15],center=true);
                    //cylinder(h=15,d=wire_diameter,center=true);
    //Deep Channels
    if (both_deep_channels==true) {
        //row
        translate([unit/2 - 6/2,4*grid,pcb_thickness/2-wire_diameter/3-1]) rotate([0,90,0])
            cube([pcb_thickness/1.5,wire_diameter,6],center=true);
        
        //col
        translate([3.5*grid,3.8+2+0.7,(pcb_thickness/2-wire_diameter/3-1)]) 
            rotate([90,0,rotate_column?90:0])
                cube([wire_diameter*1.1,pcb_thickness/1.5,6],center=true);        
    }

                // LED cutout
                if (led_hole==true) {
                    translate([0,-4*grid,0])
                        cube([5,4,10],center=true);
                }
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}

module mx_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=2.1);
                // Side pins
                for (x = [-4,4]) {
                    translate([x*grid,0,pcb_thickness/2-socket_depth-socket_depth])
                        cylinder(h=pcb_thickness+1+socket_depth,r=1.05);
                }
                // Top switch pin
                translate([2*grid,4*grid,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([-3*grid,2*grid,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=.7);
                // Diode cathode cutout
//                translate([3*grid,2.4*grid,0])
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                // Diode cathode cutout - TO RETURN
//                translate([6*grid,2.4*grid,0])
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                if (both_deep_channels==true) {
                    translate([0,4*grid,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
        cube([pcb_thickness/1.5,wire_diameter*1.1,unit],center=true);                
                } else {

                    translate([0,4*grid,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                        cylinder(h=unit,d=wire_diameter,center=true);

                }

                // Column wire
                //Lower channel
//                translate([3*grid,-4*grid,-(pcb_thickness/2-wire_diameter/2)]) 
//                    rotate([90,0,rotate_column?90:0])
//                        translate([0,0,-4*grid])
//                        cylinder(h=col_cutout_length,d=wire_diameter*1.5,center=true);

                //Upper channel
        if (both_deep_channels==true) {                
                
                translate([-3.3*grid,3.8+1,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                        cube([wire_diameter*1.1,pcb_thickness/1.5,5],center=true);
                translate([-3*grid,-2.7,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cube([wire_diameter*1.1,pcb_thickness/1.5,10],center=true);

        } else {

                translate([-3.3*grid,3.8+1,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                translate([-3*grid,-2.7,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=10,d=wire_diameter,center=true);

        }            


                // Diode Channel
//                translate([1.5,2.4*grid,pcb_thickness/2])
//                    cube([9*grid,1,2],center=true);
//                translate([.3*grid-.5,2.4*grid,pcb_thickness/2])
//                    cube([4*grid,2,3],center=true);

                // LED cutout
                if (led_hole==true) {
                    translate([0,-4*grid,0])
                        cube([5,4,10],center=true);
                }
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module choc_socket_cutout(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth])
                    cylinder(h=pcb_thickness+1,d=3.5);
                // Side pins
                for (x = [-5.5,5.5]) {
                    translate([x,0,pcb_thickness/2-socket_depth])
                        cylinder(h=pcb_thickness+1,d=1.75);
                }
                // Top switch pin
                translate([0,5.9,pcb_thickness/2-socket_depth])
                    cylinder(h=pcb_thickness+1,r=1);
                // Bottom switch pin
                translate([5,3.8,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=.7);
                // Diode cathode cutout
                translate([-3.125,-3.8,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=row_cutout_length,d=wire_diameter,center=true);
                // Column wire
                translate([-3.125,-3.8,-(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);

                // Diode Channel
                translate([-3.125,0,pcb_thickness/2])
                    cube([1,7.6,2],center=true);
                translate([.75,3.8,pcb_thickness/2])
                    cube([8.5,1,2],center=true);
                translate([-3.125,1.8,pcb_thickness/2])
                    cube([2,5,3.5],center=true);
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module choc_socket_cutout_led_BAK(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=3.5*1.1, $fn=40);
                // Side pins
                for (x = [-5.5,5.5]) {
                    translate([x,0,pcb_thickness/2-socket_depth-socket_depth])
                        cylinder(h=pcb_thickness+1+socket_depth,d=1.75*1.1, $fn=40);
                }
                // Top switch pin
//                translate([0,5.9,pcb_thickness/2-socket_depth-socket_depth])
//                    cylinder(h=pcb_thickness+1+socket_depth,r=1, $fn=40);

                translate([0,5.9,pcb_thickness-socket_depth-socket_depth])
                    cube(size = [2, 1, pcb_thickness+1+socket_depth], center = true);


                // Bottom switch pin
                translate([5,3.8,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,d=1.6*1.1, $fn=40);
                // Diode cathode cutout
                translate([-3.125,3.8,0]) 
                    cylinder(h=pcb_thickness+1,d=1.75*1.1,center=true, $fn=40);

                // Wire Channels
                // Row wire
                if (both_deep_channels==true) {
    translate([0,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                cube([pcb_thickness/1.5,wire_diameter*1.1,unit],center=true);
                    } else {
                translate([0,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true);                        
                        }
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
//                    cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire
                if (both_deep_channels==true) {
translate([-3.125,0,(pcb_thickness/2-wire_diameter/3)])  
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter*1.1,pcb_thickness/1.5,unit],center=true);
                } else {
                translate([-3.125,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                translate([-3.125,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);
                }
                // Diode cathode cutout - TO RETURN
//                translate([-6*grid,3.8,0])
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);
            
                translate([-5*grid,3.8,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true,$fn=40);
                translate([2.5*grid,0,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true,$fn=40);
                
                    
                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
                // for 3.3mm x 1.9mm
                translate([.75-2.3,3.8,pcb_thickness/2-0.2])
                    cube([8.5+4,1,2],center=true);
                translate([1,3.75,pcb_thickness/2-0.2])
                    cube([5,2,3.5],center=true);
                //去除薄邊
                translate([0,3.5-2,pcb_thickness/2-0.2])
                    cube([2,5,3.5],center=true);
                                
                //for 5.1mm x 2.5mm diode
//                translate([.75-2,3.5,3/2-0.35])
                    //cube([8.5+4,1,3/2+0.2],center=true);
//                translate([0.2,3.5,3-pcb_thickness/2])
                    //cube([5.6,2.9,3],center=true);
//                //去除薄邊
//                translate([0,3.5-2,3-pcb_thickness/2])
//                    cube([2,5,3],center=true);
                
                //拉線渠道
                translate([4,2,pcb_thickness/2])
                    rotate(a=[0,0,65])
                    cube([5,1,2],center=true);

                // LED cutout
                if (led_hole==true) {
                    translate([0,-5,0])
                        cube([5,3,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}



module choc_socket_cutout_led(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=3.5*1.1, $fn=40);
                // Side pins
                for (x = [-5.5,5.5]) {
                    translate([x,0,pcb_thickness/2-socket_depth-socket_depth])
                        cylinder(h=pcb_thickness+1+socket_depth,d=1.75*1.1, $fn=40);
                }
                // Top switch pin
                translate([0,5.9,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1, $fn=40);
                // Bottom switch pin
                translate([5,3.8-0.5,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,d=1.6*1.1, $fn=40);
                // Diode cathode cutout
                translate([-3.125,3.8,0]) 
                    cylinder(h=pcb_thickness+1,d=1.75*1.1,center=true, $fn=40);

                // Wire Channels
                // Row wire
                if (both_deep_channels==true) {
    translate([0,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                cube([pcb_thickness/1.5,wire_diameter*1.1,unit],center=true);
//test
    translate([-1*unit/2+6,5.9,pcb_thickness/2-wire_diameter/3-1]) rotate([0,90,0])
                cube([pcb_thickness/1.5,wire_diameter*1.1,6],center=true);
                    
                    } else {
                translate([0,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true);                        
                        }
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
//                    cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire
                if (both_deep_channels==true) {
translate([-3.125,0,(pcb_thickness/2-wire_diameter/3)])  
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter*1.1,pcb_thickness/1.5,unit],center=true);

//test
translate([-3.125,unit/2-3,(pcb_thickness/2-wire_diameter/3-1)])  
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter*1.1,pcb_thickness/1.5,6],center=true);
                    
                } else {
                translate([-3.125,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                translate([-3.125,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);
                }
                // Diode cathode cutout - TO RETURN
//                translate([-6*grid,3.8,0])
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                translate([-5*grid,3.8,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true,$fn=40);
                translate([2.5*grid,0-0.5,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true,$fn=40);
                
                    
                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);

                // for 3.3mm x 1.9mm
//                translate([.75-2,3.8,pcb_thickness/2-0.2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2-0.2])
//                    cube([5,2,3.5],center=true);
                //for 5.1mm x 2.5mm diode
                translate([.75-2,3.5,3/2-0.35])
                    cube([8.5+4,1,3/2+0.2],center=true);
//測試 test            
                translate([.75-5.5,3.5,-3/2-0.35])
                    cube([3,1,1],center=true);
// for 3.3mm x 1.9mm
                translate([0.2,3.5,3-pcb_thickness/2])
                    //cube([5.6,2.9,3],center=true);
                    cube([3.5,2,2],center=true);
                //去除薄邊
                translate([0,3.5,3-pcb_thickness/2])
                    cube([2,5,3],center=true);
               
                translate([4,2-0.5,pcb_thickness/2])
                    rotate(a=[0,0,65])
                    cube([5,1,2],center=true);

//測試 test
                translate([4,2-0.5,-pcb_thickness/2+0.35])
                    rotate(a=[0,0,65])
                    cube([5,1,1],center=true);

                // LED cutout
                if (led_hole==true) {
                    translate([0,-5,0])
                        cube([5,3,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}



module choc_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=3.5*1.1);
                // Side pins
                for (x = [-5.5,5.5]) {
                    translate([x,0,pcb_thickness/2-socket_depth-socket_depth])
                        cylinder(h=pcb_thickness+1+socket_depth,d=1.75*1.1);
                }
                // Top switch pin
                translate([0,5.9,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([5,3.8,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=0.8);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter*1.1,center=true); 
                //h=unit or row_cutout_length
                
                // Add deep chnnels
                //5-wire_diameter/1.2+1.5
                translate([0,5.9,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([0,90,0])
                        cube([pcb_thickness/1.5,wire_diameter*1.1,5*3],center=true);

                translate([-(5-wire_diameter/1.2+1.5),5.9,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([0,90,0])
                        cube([pcb_thickness/1.5,wire_diameter*1.1,5],center=true);
                        
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Add deep Channels
                translate([5,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter*1.1,pcb_thickness/1.5,5],center=true);
                        //-3.8-2
                translate([5-wire_diameter/1.2,-1.8,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter*1.1,pcb_thickness/1.5,5*2.4],center=true);
                       
                       
                translate([5-wire_diameter/1.2,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter*1.1,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0,-5,0])
                            cube([5,3,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module chocMini_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central Chamber
                translate([0,0,0])
                    cube([11.5*1.02,5.5*1.02,socket_depth+pcb_thickness],center=true);
                translate([0,5.5/2,0])
                    cube([5,2,socket_depth+pcb_thickness],center=true);

                // Side pins
                for (x = [-5.35,5.35]) {
                    translate([x,-5.15
,pcb_thickness/2-socket_depth-socket_depth])
                        cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                }
                // Top switch pin
                translate([-2.2,5.3,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                // Bottom switch pin
                translate([5,5.15
,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=0.8);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
//                translate([-unit/5,5.3,(pcb_thickness-2)/2-wire_diameter/3]) rotate([0,90,0])
//                    cylinder(h=unit/2-1,d=wire_diameter,center=true); 
//                translate([unit/4,4.6,(pcb_thickness-2)/2-wire_diameter/3]) rotate([12,90,0])
//                    cylinder(h=unit/2,d=wire_diameter,center=true); 
                    
                // Add deep chnnels
                translate([-3.8,5.3,((pcb_thickness-2)/2-wire_diameter/3)]) 
                    rotate([0,90,0])
                        cube([pcb_thickness/1.5,wire_diameter,8],center=true);
                translate([3.7,4.5,((pcb_thickness-2)/2-wire_diameter/3)]) 
                    rotate([12,90,0])
                        cube([pcb_thickness/1.5,wire_diameter,8],center=true);

                // Column wire
                translate([6.1,-2,((pcb_thickness-2)/2-wire_diameter/2)]) 
                    rotate([90,0,rotate_column?90:0])
                    //cylinder(h=12,d=wire_diameter,center=true);
                    cube([wire_diameter,wire_diameter,13],center=true);
                // Add deep Channels
                translate([4.5,6.8,((pcb_thickness-2)/2-wire_diameter/2)]) 
                    rotate([90,0,rotate_column?90:0])
                    cube([wire_diameter,wire_diameter,4.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0,-4,0])
                            cube([5.5,4,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}

module choc_v2_socket_cutout_led(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=4.8*1.05);
                // Side pins (V1)       
                if (choc_v2_compatible_v1==true){
                    for (x = [-5.5,5.5]) {
                        translate([x,0,pcb_thickness/2-socket_depth-socket_depth])
                            cylinder(h=pcb_thickness+1+socket_depth,d=1.75);
                    }
                }
                
                // Bottom Side pin (V2)
                translate([-5,-5.15,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                       cylinder(h=pcb_thickness+1+socket_depth,r=0.7);
                
                // Top switch pin
                translate([0,5.9,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([5,3.8,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=0.7);
                // Diode cathode cutout
                translate([-3.125,3.8,0]) 
                    cylinder(h=pcb_thickness+1,r=.8,center=true);

                        
                // Wire Channels
                // Row wire
                translate([0,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true);
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                
                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
                translate([5-wire_diameter/1.2+1.5,5.9,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([0,90,0])
                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                translate([-(5-wire_diameter/1.2+1.5),5.9,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([0,90,0])
                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                                    
                }
                
                // Column wire

                // Deep Channel
                translate([-3.125,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([-3.125,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                translate([-3.125,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode cathode cutout - TO RETURN
                translate([-6*grid,3.8,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                    
                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
                translate([.75-2,3.8,pcb_thickness/2])
                    cube([8.5+4,1,2],center=true);
                translate([1,3.75,pcb_thickness/2])
                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {                
                        translate([0,-5,0])
                            cube([5,3,10],center=true);
                }
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module choc_v2_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=4.8*1.05);
                // Side pins (V1)       
                if (choc_v2_compatible_v1==true){
                    for (x = [-5.5,5.5]) {
                        translate([x,0,pcb_thickness/2-socket_depth-socket_depth])
                            cylinder(h=pcb_thickness+1+socket_depth,d=1.75);
                    }
                }
                
                // Bottom Side pin (V2)
                translate([-5,-5.15,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                       cylinder(h=pcb_thickness+1+socket_depth,r=0.7);
                
                // Top switch pin
                translate([0,5.9,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([5,3.8,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true); 
                //h=unit or row_cutout_length
                
                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
                    translate([5-wire_diameter/1.2+1.5,5.9,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                    translate([-(5-wire_diameter/1.2+1.5),5.9,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([5,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([5-wire_diameter/1.2,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                       
                       
                translate([5-wire_diameter/1.2,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0,-5,0])
                            cube([5,3,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}

module ks27_socket_cutout_led(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=4.8*1.02);

                // Top switch pin
                translate([-2.9,5.7,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([4.4,4.2,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=0.7);
                // Diode cathode cutout
                translate([-5,3.8,0]) 
                    cylinder(h=pcb_thickness+1,r=.8,center=true);

                        
                // Wire Channels
                // Row wire
                translate([0,5.7,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true);
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                translate([(5-wire_diameter/1.2+1.5),5.7,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])

                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                        
                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
                translate([-(5-wire_diameter/1.2+1.5),5.7,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([0,90,0])
                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                                    
                }
                
                // Column wire

                // Deep Channel
                translate([-5,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([-5,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                translate([-5,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode cathode cutout - TO RETURN
                translate([-6*grid,3.8,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                    
                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
                translate([.75-2,3.8,pcb_thickness/2])
                    cube([8.5+4,1,2],center=true);
                translate([1,3.75,pcb_thickness/2])
                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0.5,-5,0])
                            cube([5.5,3,10],center=true);
                }

            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}

module choc_v2_socket_cutout_led_1U_PCB(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=4.8*1.05);
                // Side pins (V1)       
                if (choc_v2_compatible_v1==true){
                    for (x = [-5.5,5.5]) {
                        translate([x,0,pcb_thickness/2-socket_depth-socket_depth])
                            cylinder(h=pcb_thickness+1+socket_depth,r=0.95);
                    }
                }
   
                for (x = [-7.5,7.5]) {
                    translate([x,0,0])
                        cube([3,3,5],center=true);
                    
                    }

                
                // Bottom Side pin (V2)
                translate([-5,-5.15,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                       cylinder(h=pcb_thickness+1+socket_depth,r=0.7);
                
                // Top switch pin
                translate([0,5.9,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=.8);

//TEST
                //背後穿入孔洞
                translate([3,5.5,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=.8);

                translate([-5,5.5,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=.8);

                translate([-3.125,-2.5,0]) 
                    cylinder(h=pcb_thickness+1,r=.8,center=true);
                
                //背後線槽
                translate([5-wire_diameter/1.2+1.5,5.9,(0)]) 
                    rotate([0,90,0])
                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                translate([-(5-wire_diameter/1.2+3),5.9,0]) 
                    rotate([0,90,0])
                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);


                translate([-3.125,-3.8-1.5,0]) 
                    rotate([90,0,rotate_column?90:0])
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([-3.125,3.8+2,0]) 
                    rotate([90,0,rotate_column?90:0])
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);


                // Bottom switch pin
                translate([5,3.8,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1,r=0.7);
                // Diode cathode cutout
                translate([-3.125,3.8,0]) 
                    cylinder(h=pcb_thickness+1,r=.8,center=true);

                        
                // Wire Channels
                // Row wire
                translate([-1,5.9,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit-10,d=wire_diameter,center=true);
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
//                    cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                
                // Both Deep Channels(Row and Column)
//                if (both_deep_channels==true) {
//                translate([5-wire_diameter/1.2+1.5,5.9,(pcb_thickness/2-wire_diameter/3)]) 
//                    rotate([0,90,0])
//                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);
//
//                translate([-(5-wire_diameter/1.2+1.5),5.9,(pcb_thickness/2-wire_diameter/3)]) 
//                    rotate([0,90,0])
//                        cube([pcb_thickness/1.5,wire_diameter,5],center=true);
//                                    
//                }
                
                // Column wire

                // Deep Channel
//                translate([-3.125,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
//                    rotate([90,0,rotate_column?90:0])
////                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
//                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
//                translate([-3.125,3.8+2,(pcb_thickness/2-wire_diameter/3)]) 
//                    rotate([90,0,rotate_column?90:0])
////                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
//                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                translate([-3.125,0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=6,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode cathode cutout - TO RETURN
                translate([-5*grid,3.8,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                translate([3*grid,1.8,0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                    
                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
                translate([0,3.8,pcb_thickness/2])
                    cube([socket_size,1,2],center=true);
                translate([1,3.75,pcb_thickness/2])
                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {                
                        translate([0,-6,0])
                            cube([5,4,10],center=true);
                }
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}



module ks27_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,d=4.8*1.02);
                           
                // Top switch pin
                translate([-2.9,5.7,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([4.4,4.2,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
                translate([0,5.7,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true); 
                //h=unit or row_cutout_length
                
                //ROW left deep channel
                translate([-(5-wire_diameter/1.2+1.5),5.7,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
                    translate([6-wire_diameter/1.2+1.5,5.7,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,5],center=true);


                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([4.4,4.2+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([5.3-wire_diameter/1.2,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                       
                       
                translate([5.3-wire_diameter/1.2,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0.5,-5,0])
                            cube([5.5,3,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}



module mxlow_socket_cutout_led(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,0])
                    cube([6,6,pcb_thickness+1+socket_depth],center=true);
                translate([0,4,0])
                    cube([2.2,2,pcb_thickness+1+socket_depth],center=true);
                          
                // Top switch pin
                translate([0,6.6,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([-3.9,3.3,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
//                translate([0,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
//                    #cylinder(h=unit,d=wire_diameter,center=true); 


                translate([unit/3,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/2,d=wire_diameter,center=true); 

                translate([-unit/3,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/2,d=wire_diameter,center=true);

                translate([0,6.6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/5,d=wire_diameter,center=true);
                    
    //h=unit or row_cutout_length
                
                //ROW left deep channel
                   translate([6-wire_diameter/1.2+1.5,5.6,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
 
                    translate([-(5-wire_diameter/1.2+1.5),5.6,(pcb_thickness/2-wire_diameter/3)]) 
                            rotate([0,90,0])
                                cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([-3.9,4.2+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([-3.9-wire_diameter/1.2,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                       
                       
                translate([-3.9-wire_diameter/1.2,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0.5,-5,0])
                            cube([9,1.7,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module mxlow_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,0])
                    cube([6,6,pcb_thickness+1+socket_depth],center=true);
                translate([0,4,0])
                    cube([2.2,2,pcb_thickness+1+socket_depth],center=true);
                          
                // Top switch pin
                translate([0,6.6,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([-3.9,3.3,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
//                translate([0,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
//                    #cylinder(h=unit,d=wire_diameter,center=true); 


                translate([unit/3,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/2,d=wire_diameter,center=true); 

                translate([-unit/3,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/2,d=wire_diameter,center=true);

                translate([0,6.6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/5,d=wire_diameter,center=true);
                    
    //h=unit or row_cutout_length
                
                //ROW left deep channel
                   translate([6-wire_diameter/1.2+1.5,5.6,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
 
                    translate([-(5-wire_diameter/1.2+1.5),5.6,(pcb_thickness/2-wire_diameter/3)]) 
                            rotate([0,90,0])
                                cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([-3.9,4.2+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([-3.9-wire_diameter/1.2,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                       
                       
                translate([-3.9-wire_diameter/1.2,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0.5,-5,0])
                            cube([9,1.7,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}

module redragonlow_socket_cutout_led(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,0])
                    cube([6,6,pcb_thickness+1+socket_depth],center=true);
                translate([0,4,0])
                    cube([2.2,2,pcb_thickness+1+socket_depth],center=true);
                          
                // Top switch pin
                translate([0,6.6,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([-3.9,3.3,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
//                translate([0,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
//                    #cylinder(h=unit,d=wire_diameter,center=true); 


                translate([unit/3,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/2,d=wire_diameter,center=true); 

                translate([-unit/3,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/2,d=wire_diameter,center=true);

                translate([0,6.6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/5,d=wire_diameter,center=true);
                    
    //h=unit or row_cutout_length
                
                //ROW left deep channel
                   translate([6-wire_diameter/1.2+1.5,5.6,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
 
                    translate([-(5-wire_diameter/1.2+1.5),5.6,(pcb_thickness/2-wire_diameter/3)]) 
                            rotate([0,90,0])
                                cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([-3.9,4.2+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([-3.9-wire_diameter/1.2,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                       
                       
                translate([-3.9-wire_diameter/1.2,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0.5,-5,0])
                            cube([9,1.7,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module redragonlow_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([0,0,0])
                    cylinder($fn = 40,h=pcb_thickness+1+socket_depth,r=4.2/2*1.07,center=true);
                          
                // Top switch pin
                translate([0,6,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([-3.9,3,(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
//                translate([0,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
//                    #cylinder(h=unit,d=wire_diameter,center=true); 


                translate([unit/3,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/2,d=wire_diameter,center=true); 

                translate([-unit/3,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/2,d=wire_diameter,center=true);

                translate([0,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit/5,d=wire_diameter,center=true);
                    
    //h=unit or row_cutout_length
                
                //ROW left deep channel
                   translate([6-wire_diameter,6,(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter*1.1,7],center=true);

                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
 
                    translate([-(4-wire_diameter/1.2+1.5),6,(pcb_thickness/2-wire_diameter/3)]) 
                            rotate([0,90,0])
                                cube([pcb_thickness/1.5,wire_diameter*1.1,7],center=true);

                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([-3.9,4.2+2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter*1.1,pcb_thickness/1.5,5],center=true);
                        
                translate([-3.9-wire_diameter/1.2,-3,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter*1.1,pcb_thickness/1.5,10],center=true);
                       
                       
                translate([-3.9-wire_diameter/1.2,-3.8+0.5,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=15,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                        translate([0,-4.5,0])
                            cube([5,1.7,10],center=true);
                }

            
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}

module romerg_socket_cutout_led(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([(11.6/2)-(1.5/2),0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                translate([-((11.6/2)-(1.5/2)),0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
 
                // Top switch pin
                translate([-((5/2)-0.5),-(9.6/2-(0.3/2)),pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([((5/2)-0.5),9.6/2-(0.3/2),(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Diode cathode cutout
                translate([4*grid,-(9.6/2-(0.3/2)),0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                // Diode cathode cutout - TO RETURN
                translate([6*grid,-(9.6/2-(0.3/2)),0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);
                translate([-4*grid,-(9.6/2-(0.3/2)),0])
                    cylinder(h=pcb_thickness+1,r=.7,center=true);                
                // Wire Channels
                // Row wire
//                translate([0,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
//                    #cylinder(h=unit,d=wire_diameter,center=true); 


                translate([0,9.6/2-(0.3/2),pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true); 
     
                //ROW left deep channel
                   translate([5-wire_diameter/1.2+1.5,9.6/2-(0.3/2),(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,7],center=true);

                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
 
                    translate([(5.5-wire_diameter/1.2),9.6/2-(0.3/2),(pcb_thickness/2-wire_diameter/3)]) 
                            rotate([0,90,0])
                                cube([pcb_thickness/1.5,wire_diameter,5],center=true);

                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([4,4.2+1,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([5.5,-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,4],center=true);
                       
                       
//                translate([3.5,-3.8+0.5+3,(pcb_thickness/2-wire_diameter/3)]) 
//                    rotate([90,0,rotate_column?90:0])
//                    cylinder(h=10,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
                translate([3.125,0,pcb_thickness/2])
                    cube([1,9,2],center=true);
                translate([4.5,-3.5,pcb_thickness/2])
                    cube([2,2,2],center=true);
                translate([1,-(9.6/2-(0.3/2)),pcb_thickness/2])
                    cube([13,1,2],center=true);
                translate([2,-(9.6/2-(0.3/2)),pcb_thickness/2])
                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                    translate([0,0,0])
                        cube([4,4,pcb_thickness+1+socket_depth],center=true);

                }
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}


module romerg_socket_cutout_led_dl(borders=[1,1,1,1], rotate_column=false) {
    render() translate([h_unit/2,-v_unit/2,0]) rotate([0,0,switch_rotation])
        intersection() {
            union() {
                // Central pin
                translate([(11.6/2)-(1.5/2),0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
                translate([-((11.6/2)-(1.5/2)),0,pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=0.8);
 
                // Top switch pin
                translate([-((5/2)-0.5),-(9.6/2-(0.3/2)),pcb_thickness/2-socket_depth-socket_depth])
                    cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Bottom switch pin
                translate([((5/2)-0.5),9.6/2-(0.3/2),(pcb_thickness+1)/2])
                    rotate([180+diode_pin_angle,0,0])
                        cylinder(h=pcb_thickness+1+socket_depth,r=1);
                // Diode cathode cutout
//                translate([-3.125,3.8,0]) 
//                    cylinder(h=pcb_thickness+1,r=.7,center=true);

                // Wire Channels
                // Row wire
//                translate([0,6,pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
//                    #cylinder(h=unit,d=wire_diameter,center=true); 


                translate([0,9.6/2-(0.3/2),pcb_thickness/2-wire_diameter/3]) rotate([0,90,0])
                    cylinder(h=unit,d=wire_diameter,center=true); 
     
                //ROW left deep channel
                   translate([5-wire_diameter/1.2+1.5,9.6/2-(0.3/2),(pcb_thickness/2-wire_diameter/3)]) 
                        rotate([0,90,0])
                            cube([pcb_thickness/1.5,wire_diameter,7],center=true);

                // Both Deep Channels(Row and Column)
                if (both_deep_channels==true) {
 
                    translate([-(4.5-wire_diameter/1.2),9.6/2-(0.3/2),(pcb_thickness/2-wire_diameter/3)]) 
                            rotate([0,90,0])
                                cube([pcb_thickness/1.5,wire_diameter,7],center=true);

                } 
//                #translate([5,5.9,pcb_thickness/2-wire_diameter]) rotate([0,90,0])
                    //cube([pcb_thickness/1.5,wire_diameter,5],center=true);
                
                // Column wire

                // Deep Channels
                translate([-(5/2)-0.5,4.2+1,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,5],center=true);
                        
                translate([-((5/2)-0.5),-3.8-2,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
//                        cylinder(h=col_cutout_length,d=wire_diameter,center=true);
                        cube([wire_diameter,pcb_thickness/1.5,4],center=true);
                       
                       
                translate([-(5/2)-0.5,-3.8+0.5+3,(pcb_thickness/2-wire_diameter/3)]) 
                    rotate([90,0,rotate_column?90:0])
                    cylinder(h=10,d=wire_diameter,center=true);
    //cube([wire_diameter,wire_diameter*1.5,15],center=true);

                // Diode Channel
//                translate([-3.125,0,pcb_thickness/2])
//                    cube([1,7.6,2],center=true);
//                translate([.75-2,3.8,pcb_thickness/2])
//                    cube([8.5+4,1,2],center=true);
//                translate([1,3.75,pcb_thickness/2])
//                    cube([5,2,3.5],center=true);
                
                // LED cutout
                if (led_hole==true) {
                    translate([0,0,0])
                        cube([4,4,pcb_thickness+1+socket_depth],center=true);

                }
            }

            translate([
                h_border_width/2 * (borders[3] - borders[2]),
                v_border_width/2 * (borders[0] - borders[1]),
                -1
            ]) {
                cube([
                    socket_size+h_border_width*(borders[2]+borders[3])+0.02,
                    socket_size+v_border_width*(borders[0]+borders[1])+0.02,
                    2*pcb_thickness
                ], center=true);
            }
        }
}

module switch_plate_footprint(borders=[1,1,1,1]) {
    translate([h_unit/2,-v_unit/2,0])
        border_footprint(
            [socket_size,socket_size], 
            borders, 
            h_border_width, 
            v_border_width
        );
}

module switch_plate_cutout_footprint() {
    translate([h_unit/2,-v_unit/2,0]) {
        square([plate_cutout_size, plate_cutout_size],center=true);
    }
}

module switch_plate_base(borders=[1,1,1,1], thickness=plate_thickness) {
    linear_extrude(thickness, center=true)
        switch_plate_footprint(borders);
}

module switch_plate_cutout(thickness=plate_thickness) {
    linear_extrude(thickness+1, center=true)
        switch_plate_cutout_footprint();
}


