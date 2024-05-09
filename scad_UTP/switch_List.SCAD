include <switch.scad>

sSW = ["mx","mx_holder","mx_s_holder","mx_s_holder2","choc","choc_holder","chocV2","chocMini","ks27","mx_low","romer_g","chocV2_1u","redragon_low"];

//sSW = ["choc_holder"];

//一般
//"mx","choc","chocV2","chocMini","ks27","mx_low","romer_g","redragon_low"

//含固定架,用於單PCB鍵盤
//"mx_holder","mx_holder2","choc_holder"

//1U PCB, 用於產生讓Dactyl鍵盤可用的1U PCB
//"chocV2_1u"

for(i=[0:1:len(sSW)-1]){
    echo (sSW[i]);
    translate([10+unit*i*2,0,0])
    switch_socket(borders=[2.5,2.5,2,2],use_switch_type=sSW[i]);
    
    if (i % 2 == 0){
        translate([10+unit*i*2,-25,0]) color("red") %text(sSW[i],3);
    } else {
        translate([10+unit*i*2,-25,0]) color("blue") %text(sSW[i],3);
        
        }
}

