include <switch.scad>

sSW = ["mx","mx_holder","choc","choc_holder","chocV2","chocMini","ks27","mx_low","romer_g","redragon_low","chocV2_1u"];

//一般
//"mx","choc","chocV2","chocMini","ks27","mx_low","romer_g","redragon_low"

//含固定架,用於單PCB鍵盤
//"mx_holder","choc_holder"

//1U PCB, 用於產生讓Dactyl鍵盤可用的1U PCB
//"chocV2_1u"

for(i=[0:1:len(sSW)-1]){
    echo (sSW[i]);
    translate([10+unit*i*2,0,0])
    switch_socket(borders=[2.5,2.5,2,2],use_switch_type=sSW[i]);
    
    if (i % 2 == 0){
        translate([10+unit*i*2,-25,0]) color("red") linear_extrude(1)  text(sSW[i],3);
    } else {
        translate([10+unit*i*2,-25,0]) color("blue") linear_extrude(1) text(sSW[i],3);
        
        }
}

