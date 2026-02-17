include <parameters.scad>
include <utils.scad>

use <grid_patterns.scad>

module OLED_Socket(OLED_Roate=[0,0,0])
{
    

    //OLED位移位置
    OLED_Translate=[-OLED_Size[0]/2+OLED_Translate_Offset[0],
                     OLED_Translate_Offset[1],
                     oled_Standoff_height+OLED_Translate_Offset[2]];

    
    //Socket
    difference()
    {
    rotate(OLED_Roate)
    union()
    {
    difference() {
        union() {
            // Base
            translate([-(2.54*5)/2,-2,-10]) 
                cube([2.54*5,5,oled_base_height+10]);
            // Border
    //        translate([0,mcu_socket_length/2-2,pcb_thickness/2-1])
    //            border(
    //                [mcu_h_unit_size*h_unit,mcu_v_unit_size*v_unit], 
    //                borders, 
    //                pcb_thickness-2
    //            );
        }

        iLastRow =(0+0.5)*mcu_pin_pitch;
        //        echo ("Last Row:",iLastRow);
        
        for (pin = [-0.5:1.5]) {

            translate([(pin)*mcu_pin_pitch,iLastRow,-10-0.01]) 
                cylinder(h=oled_base_height+10+0.02,d=wire_diameter*1.5);
            translate([-(pin)*mcu_pin_pitch,iLastRow,-10-0.01]) 
                cylinder(h=oled_base_height+10+0.02,d=wire_diameter*1.5);
            translate([
                    (pin)*mcu_pin_pitch,iLastRow+wire_diameter-mcu_wire_channels_length/2+2,
                    oled_base_height-wire_diameter/2
                ]) rotate([90,-180,0])
            cube([wire_diameter,wire_diameter+0.01,mcu_wire_channels_length],true);
            translate([
                    -(pin)*mcu_pin_pitch,iLastRow+wire_diameter-mcu_wire_channels_length/2+2,
                    oled_base_height-wire_diameter/2
                ]) rotate([90,0,0])
            cube([wire_diameter,wire_diameter+0.01,mcu_wire_channels_length],true);
            
            translate([
                    (pin)*mcu_pin_pitch,iLastRow+wire_diameter-mcu_wire_channels_length/2+2,
                    oled_base_height-wire_diameter/2-wire_diameter*2
                ]) rotate([90,-180,0])
            cube([wire_diameter,wire_diameter,mcu_wire_channels_length],true);
            translate([
                    -(pin)*mcu_pin_pitch,iLastRow+wire_diameter-mcu_wire_channels_length/2+2,
                    oled_base_height-wire_diameter/2-wire_diameter*2
                ]) rotate([90,0,0])
            cube([wire_diameter,wire_diameter,mcu_wire_channels_length],true);

        }

    }

    //預覽顯示OLED位置模擬
    if ($preview==true && base_pcb_layout_Preview_Show_OLED==true) {
        %translate(OLED_Translate)
        OLED_PCB();
    }    
    
    
    if (base_pcb_layout_OLED_Standoff_Type=="CS") {
    //Cylindrical Standoff
    //圓柱支架

        //LU
        if (base_pcb_layout_OLED_Standoff_LU)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_LU);
        }
        //LD
        if (base_pcb_layout_OLED_Standoff_LD)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_LD);
        }
        //RU
        if (base_pcb_layout_OLED_Standoff_RU)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_RU);
        }
        //RD
        if (base_pcb_layout_OLED_Standoff_RD)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_RD);
        }
        
    } else if (base_pcb_layout_OLED_Standoff_Type=="SS") {
    //Square Standoff
    //圓柱支架
        //LU
        if (base_pcb_layout_OLED_Standoff_LU)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_LU);
        }
        //LD
        if (base_pcb_layout_OLED_Standoff_LD)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_LD);
        }
        //RU
        if (base_pcb_layout_OLED_Standoff_RU)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_RU);
        }
        //RD
        if (base_pcb_layout_OLED_Standoff_RD)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_RD);
        }
    }
    

    }

    translate([0,0,-50])
    cube([100,100,100],center=true);
    
    }
}

module OLED_PCB()
{
    
    difference()
    {
    cube(OLED_Size);
    
    union()
    {
        translate([(OLED_Hole_Distancia[0])+OLED_Hole_Size,
                   (OLED_Hole_Distancia[1])+OLED_Hole_Size,
                    OLED_Size[2]/2])                   
            cylinder(h=OLED_Size[2]+1,d=OLED_Hole_Size, center=true,$fn=100);
        
        translate([OLED_Hole_Size,
                   (OLED_Hole_Distancia[1])+OLED_Hole_Size,
                    OLED_Size[2]/2])                   
            cylinder(h=OLED_Size[2]+1,d=OLED_Hole_Size, center=true,$fn=100);
        

        translate([OLED_Hole_Size,
                   OLED_Hole_Size,
                    OLED_Size[2]/2])                   
            cylinder(h=OLED_Size[2]+1,d=OLED_Hole_Size, center=true,$fn=100);


        translate([((OLED_Hole_Distancia[0]))+OLED_Hole_Size,
                   OLED_Hole_Size,
                    OLED_Size[2]/2])                   
            cylinder(h=OLED_Size[2]+1,d=OLED_Hole_Size, center=true,$fn=100);

    
    }
        }
}
 
 
module OLDE_Standoff_CS(OLED_Standoff_Size,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset)
{
//Cylindrical Standoff
difference()
{
union()
{
translate([0,0,oled_Standoff_height-OLED_Standoff_Size[2]/2])
cylinder(h=OLED_Standoff_Size[2],d1=OLED_Standoff_Size[1],d2=OLED_Standoff_Size[0],center=true,$fn=100);

}

translate([0,0,oled_Standoff_height-OLED_Pilot_Hole_Size[1]/2])
cylinder(h=OLED_Pilot_Hole_Size[1]+0.01,d=OLED_Pilot_Hole_Size[0],center=true,$fn=100);

}

color("RED")
hull()
{
translate([0,0,oled_Standoff_height-OLED_Standoff_Size[2]])
cylinder(h=0.01,d1=OLED_Standoff_Size[1],d2=OLED_Standoff_Size[1],center=true,$fn=100);

//延伸底座
rotate([-OLED_Roate[0],-OLED_Roate[1],-OLED_Roate[2]])
translate([OLED_Standoff_Base_Offset[0],OLED_Standoff_Base_Offset[1],-OLED_Standoff_Base_Offset[2]/2])
cylinder(h=0.01,d1=OLED_Standoff_Size[3],d2=OLED_Standoff_Size[1],center=true,$fn=100);

}
}



module OLDE_Standoff_SS(OLED_Standoff_Size,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset)
{
//Square Standoff
difference()
{
union()
{
translate([0,0,oled_Standoff_height-OLED_Standoff_Size[2]/2])
cube([OLED_Standoff_Size[0],OLED_Standoff_Size[1],OLED_Standoff_Size[2]],center=true);

}

translate([0,0,oled_Standoff_height-1])
cylinder(h=OLED_Pilot_Hole_Size[1],d=OLED_Pilot_Hole_Size[0],center=true,$fn=100);

}

color("RED")
hull()
{
translate([0,0,oled_Standoff_height-OLED_Standoff_Size[2]])
cube([OLED_Standoff_Size[0],OLED_Standoff_Size[1],0.01],center=true);

//延伸底座
rotate([-OLED_Roate[0],-OLED_Roate[1],-OLED_Roate[2]])
translate([OLED_Standoff_Base_Offset[0],OLED_Standoff_Base_Offset[1],-OLED_Standoff_Base_Offset[2]/2])
cube([OLED_Standoff_Size[3],OLED_Standoff_Size[4],0.01],center=true);
}
}
    
module OLED_Socket_Hole()
{
        translate([-(2.54*5)/2,-2,0]) 
            cube([2.54*5,5,oled_base_height]);
}

translate([0,15,0])
cubeRC([45,40,2],rc_size=2,center=true,cube_base=true,cube_top=false);
//module cubeRC(size,rc_size=2,center=false,cube_base=true,cube_top=false) {

OLED_Socket([15,0,0]);
//OLED_Socket_Hole();
