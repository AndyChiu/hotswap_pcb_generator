include <switch.scad>

/*
Switch Board(一般):
[mx, choc, chocV2, chocMini, ks27, ks33v3, mx_low, romer_g, redragon_low, alps]

Switch Board + Holder(含固定架,用於單PCB鍵盤):
[choc_holder, mx_holder, mx_s_holder, mx_s_holder2, ks27_holder, ks33v3_holder, redragon_low_holder, alps_holder]

1U PCB, 用於產生讓Dactyl鍵盤可用的1U PCB
[chocV2_1u]

*/

sSW1 = ["mx","choc","chocV2","chocMini","ks27","ks33v3","mx_low","romer_g","redragon_low","alps"];

sSW2 = ["choc_holder","mx_holder","mx_s_holder","mx_s_holder2","ks27_holder","ks33v3_holder","redragon_low_holder","alps_holder"];

sSW3 = ["alps_holder"];


sSW = sSW2;


for(i=[0:1:len(sSW)-1]){
    echo (sSW[i]);
    translate([unit*i*2,0,0])
    switch_socket(borders=[1,1,1,1],use_switch_type=sSW[i]);
    
//    if ($preview)
    {
    if (i % 2 == 0){
        translate([(10-len(sSW[i])/2*2.3)+unit*i*2,-25,0])
        color("red")
        linear_extrude(height=1)
        text(sSW[i],3);
    } else {
        translate([(10-len(sSW[i])/2*2.3)+unit*i*2,-25,0])
        color("blue")
        linear_extrude(height=1)
        text(sSW[i],3);
        
    }
    }
}