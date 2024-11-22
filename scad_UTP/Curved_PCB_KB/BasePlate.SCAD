include <..\mcu.scad>
include <..\parameters.scad>
include <..\IDC\IDC_Holder.scad>
include <..\parameters_mcu_RP2040_Zero.scad>

//3D印表機公差
//sc=52.5/52.1;
sc=1;

//==================================
//板子類型: 幾U、鍵帽尺寸、基座類型、左右手
//==================================
//include <BasePlate_3U_13MM_MType_Left.scad>
//include <BasePlate_3U_13MM_MType_Right.scad>

//include <BasePlate_3U_16MM_MType_Left.scad>
//include <BasePlate_3U_16MM_MType_Right.scad>

//===========================

//include <BasePlate_3U_11.3MM_LType_Left.scad>
//include <BasePlate_3U_11.3MM_LType_Right.scad>

//include <BasePlate_3U_16MM_LType_Left.scad>
//include <BasePlate_3U_16MM_LType_Right.scad>

//include <BasePlate_3U_18MM_LType_Left.scad>
//include <BasePlate_3U_18MM_LType_Right.scad>

//===========================

include <BasePlate2_3U_18MM_LType_Left.scad>
//include <BasePlate2_3U_18MM_LType_Right.scad>

//==================================
//位置資訊
//==================================
//include <BasePlate_POS_01.scad>
include <BasePlate_POS_02.scad>


//MCU擺放位置
MCU_UseIn= "R"; //"L","R","LR",""

//IDC擺放位置
IDC_UseIn= "LR"; //"L","R","LR",""

//3U區 延伸基座牆厚
3U_FT=1.2;
3U_FTW=3U_FT+1.5;

3U_FT2=2.2;
3U_FTW2=3U_FT2+1.5;


//3U區 底板切除長度
3U_CW=45;

//左右鏡射參數
//iSW =
//    LR == "L"
//        ? 1
//    : LR == "R"
//        ? -1
//    : assert(false, "LR is invalid");
    
iSW2 =
    LR == "L"
        ? 0
    : LR == "R"
        ? 180
    : assert(false, "LR is invalid");

iSW2a =
    LR == "L"
        ? 0
    : LR == "R"
        ? 1
    : assert(false, "LR is invalid");

iSW2b =
    LR == "L"
        ? 1
    : LR == "R"
        ? 0
    : assert(false, "LR is invalid");
        
     
echo ("iSW=",iSW);
echo ("iSW2=",iSW2);
 

iSW5 =
    ML == "L"
        ? 1
    : ML == "M"
        ? 0
    : assert(false, "ML is invalid");
iSW6 =
    ML == "L"
        ? 10
    : ML == "M"
        ? 0
    : assert(false, "ML is invalid");
    
 echo ("iSW6=",iSW6);

//基本厚度
BaseT=0.8;

//3U區 底座
3UB_W=3U_W+BaseT*2;
3UB_D=3U_D+BaseT*2;
3UB_H=3;
3UB_H2=1.5;

//高度偏移
//A 小指
iOffsetCA1=7;

//S 無名指
iOffsetCA2=5;

//D 中指
iOffsetCA3=0;

//F 食指
iOffsetCA4=0;

//G
iOffsetCA5=0;

//Tenting 座的高度
TBC_H = 50;

module rotate_p(a, orig) {
    translate(orig)
    rotate(a)
    translate(-orig)
    children();
}


module 3U_BASES(v_angle=0,h_angle=0,sh=0,sh2=0,iOffsetZ=0)
{
    //v_angle 垂直角度
    //h_angle 水平角度
    //sh 支撐高度微調
    //iOffsetZ 支撐架水平高度調整
iSW3 =
    h_angle > 0
        ? 1
    : h_angle < 0
        ? -1
    : h_angle == 0
        ? -1
    : assert(false, "v_angle is invalid");


    difference(){
    
        union() {
            //底板
            translate([0,0,3UB_H/2]){
            cube([3UB_D,3UB_W,3UB_H],center=true);
            }
            //支撐框架加高
            //height = d * tan(angle);
            height = (3U_W-3U_FT) * tan(5);
            translate([0,(3U_W-3U_FT2)/2,(height+sh2)/2+iOffsetZ/2]){
            cube([3UB_D,3U_FTW2,height+sh2+iOffsetZ],center=true);
            }

            translate([0,-1*(3U_W-3U_FT)/2-iSW5,(height+sh)/2+iOffsetZ/2]){
            cube([3UB_D,3U_FTW,height+sh+iOffsetZ],center=true);
            }

            //支撐框架
            rotate_p([v_angle,h_angle,0],[iSW3*3U_D/2,-1*(3U_W-3U_FT)/2,3UB_H*2/2+iOffsetZ])
            union() {

            translate([0,-1*(3U_W-3U_FT)/2-iSW5,3UB_H*2/2+iOffsetZ/2]){
            cube([3UB_D,3U_FTW,3UB_H*2+iOffsetZ],center=true);
            }

            translate([0,(3U_W-3U_FT2)/2,3UB_H2*2/2+iOffsetZ/2]){
            cube([3UB_D,3U_FTW2,3UB_H2*2+iOffsetZ],center=true);
            }
            }
        }

        //支撐框架內部挖洞
        rotate_p([v_angle,h_angle,0],[iSW3*3U_D/2,-1*(3U_W-3U_FT)/2,3UB_H*2/2+iOffsetZ])
        union() {

        translate([0,-1*(3U_W-3U_FT-iSW6)/2,3U_H/2+iOffsetZ]){
        cube([3U_D,3U_FT+iSW6,3U_H],center=true);
        }

        translate([0,-1*(3U_W-3U_FT-iSW6)/2-iSW5,3U_H/2+2+iOffsetZ]){
        cube([3U_D,3U_FT+iSW6,3U_H],center=true);
        }

        translate([3U_D/2-5,-1*(3U_W-3U_FT-iSW6+3)/2-iSW5,3U_H/2+2+iOffsetZ]){
        cube([2,3U_FT+iSW6,3U_H],center=true);
        }

        translate([0,(3U_W-3U_FT2-1)/2,3U_H/2+iOffsetZ]){
        cube([3U_D,3U_FT2+1,3U_H],center=true);
        }

        }

        //底板中央挖洞
        translate([0,0,3U_H/2]){
        cube([3U_D,3U_CW,3U_H],center=true);
        }
        translate([0,-1.5,3U_H/2]){
        cube([3U_D-4,3U_CW+1,3U_H],center=true);
        }
        //削平底部
        translate([0,0,-3UB_H/2]){
        cube([3UB_D,3UB_W,3UB_H],center=true);
        }

}
}

module 3U_BASE_T2(Thickness)
{
    cube([unit2,unit1+1,Thickness],center=true);
}


//生成底板時,每個COL的上下兩端圓版
module 3U_BASE_POS()
{
    translate([0,-3UB_W/2+3UB_D/3,0]){
    circle(3UB_D/2+5);
    }
    translate([0,3UB_W/2-3UB_D/3,0]){
    circle(3UB_D/2+5);
    }
}

//底板要簍空的地方
module 3U_BASE_CUT()
{
translate([0,0,3UB_H/2]){
cube([3UB_D,3UB_W,3UB_H],center=true);
}
}

module BASE_BOARD()
{

linear_extrude(height = 2){
hull($fn=200) {
    translate([COL1[0]*unit,(iSW*COL1[1])*unit-iOffsetCA1*iSW,0]){
       rotate(iSW*COL1[2]){
        3U_BASE_POS();
    }
    }

    translate([COL2[0]*unit,(iSW*COL2[1])*unit-iOffsetCA2*iSW,0]){
        rotate(iSW*COL2[2]){
        3U_BASE_POS();
    }}

    translate([COL3[0]*unit,(iSW*COL3[1])*unit-iOffsetCA3*iSW,0]){
        rotate(iSW*COL3[2]){
        3U_BASE_POS();
    }}

    translate([COL4[0]*unit,(iSW*COL4[1])*unit-iOffsetCA4*iSW,0]){
        rotate(iSW*COL4[2]){
        3U_BASE_POS();
    }}
 
    translate([COL5[0]*unit,(iSW*COL5[1])*unit-iOffsetCA5*iSW,0]){
        rotate(iSW*COL5[2]){
        3U_BASE_POS();
        }
    }
   //MCU與IDC放置空間 
   translate([SPC1[0]*unit,(iSW*SPC1[1])*unit,0]){
        rotate(iSW*SPC1[2]){
        3U_BASE_POS();
        }
    }
    
    
    }
    }

    linear_extrude(height = 2){
    hull($fn=200) {
        translate([TH1[0]*unit,iSW*TH1[1]*unit+th_offset2,0]){
            circle(unit/2+10);
        }

        translate([TH2[0]*unit,iSW*TH2[1]*unit+th_offset2,0]){
            circle(unit/2+10);
        }

        translate([TH3[0]*unit,iSW*TH3[1]*unit+th_offset2,0]){
            circle(unit/2+10);
        }
        
    }
    }
    
    
}


//全部組合
module Create_BASE_BOARD()
{
 
    //主底板+簍空
    difference(){
        //主要底板
        translate([0*unit,0*unit,0]){
            rotate(-0){
            BASE_BOARD();
            }   
    }

    //A (COL1)
    translate([COL1[0]*unit,iSW*COL1[1]*unit-iOffsetCA1*iSW,0]){
    //rotate(a=-1.23, v=[2.5415*unit,4.1315*unit,0]){
        rotate(iSW*COL1[2]){
            3U_BASE_CUT();
        }
    }
    //S (COL2)
    translate([COL2[0]*unit,iSW*COL2[1]*unit-iOffsetCA2*iSW,0]){
    //rotate(a=-4.99, v=[3.6575*unit,3.7929*unit,0]){
        rotate(iSW*COL2[2]){
            3U_BASE_CUT();
        }
    }

    //D (COL3)
    translate([COL3[0]*unit,iSW*COL3[1]*unit-iOffsetCA3*iSW,0]){
    //rotate(a=-11.24, v=[4.8192*unit,3.9583*unit,0]){
        rotate(iSW*COL3[2]){
            3U_BASE_CUT();
        }
    }
    //F (COL4)
    translate([COL4[0]*unit,iSW*COL4[1]*unit-iOffsetCA4*iSW,0]){
    //rotate(a=-12.26, v=[5.816*unit,4.3215*unit,0]){
        rotate(iSW*COL4[2]){
            3U_BASE_CUT();
        }
    }
    //G (COL5)
    translate([COL5[0]*unit,iSW*COL5[1]*unit-iOffsetCA5*iSW,0]){
    //rotate(a=-14.11, v=[6.8249*unit,4.7294*unit,0]){
        rotate(iSW*COL5[2]){
            3U_BASE_CUT();
        }
    }
    
    //TH 拇指區
    TH3();
}

//M/L型底板用的母座
//A (COL1)
translate([COL1[0]*unit,iSW*COL1[1]*unit-iOffsetCA1*iSW,0]){
//rotate(a=-1.23, v=[2.5415*unit,4.1315*unit,0]){
    rotate(iSW*COL1[2]+iSW2){
    3U_BASES(2,-iSW*12,0.8,0.8,0);
}
}
//S (COL2)
translate([COL2[0]*unit,iSW*COL2[1]*unit-iOffsetCA2*iSW,0]){
//rotate(a=-4.99, v=[3.6575*unit,3.7929*unit,0]){
        rotate(iSW*COL2[2]+iSW2){
    3U_BASES(2.5,-iSW*6,0,0,2);;
}
}

//D (COL3)
translate([COL3[0]*unit,iSW*COL3[1]*unit-iOffsetCA3*iSW,0]){
//rotate(a=-11.24, v=[4.8192*unit,3.9583*unit,0]){
rotate(iSW*COL3[2]+iSW2){
    3U_BASES(0,-iSW*3);
}
}
//F (COL4)
translate([COL4[0]*unit,iSW*COL4[1]*unit-iOffsetCA4*iSW,0]){
//rotate(a=-12.26, v=[5.816*unit,4.3215*unit,0]){
rotate(iSW*COL4[2]+iSW2){
    3U_BASES(2.5,iSW*-5,0,0,1);
}
}
//G (COL5)
translate([COL5[0]*unit,iSW*COL5[1]*unit-iOffsetCA5*iSW,0]){
//rotate(a=-14.11, v=[6.8249*unit,4.7294*unit,0]){
rotate(iSW*COL5[2]+iSW2){
    3U_BASES(5,iSW*-7,0,1.5,2);
}
}
//TH 拇指區
TH_BASE();

}

//3鍵拇指區母座凹槽
module TH3(Thickness=4){
    
        //Shift
    translate([TH1[0]*unit,iSW*TH1[1]*unit+th_offset,Thickness/2]){
    //rotate(a=-14.11, v=[6.8249*unit,4.7294*unit,0]){
    rotate(iSW*TH1[2]+iSW2){
        3U_BASE_T2(Thickness);
    }
    }

    //Backspace
    translate([TH2[0]*unit,iSW*TH2[1]*unit+th_offset,Thickness/2]){
    //rotate(a=-14.11, v=[6.8249*unit,4.7294*unit,0]){
    rotate(iSW*TH2[2]+iSW2){
        3U_BASE_T2(Thickness);
    }
    }

    //Alt
    translate([TH3[0]*unit,iSW*TH3[1]*unit+th_offset,Thickness/2]){
    //rotate(a=-14.11, v=[6.8249*unit,4.7294*unit,0]){
    rotate(iSW*TH3[2]+iSW2){
        3U_BASE_T2(Thickness);
        
        }
    }
}


//拇指區基座
module TH_BASE()
{

difference(){
    union()
{
    //內側母座
    //高9
    translate([TH1[0]*unit-unit/2-1,iSW*TH1[1]*unit+iSW*unit/4-iSW*1+th_offset-1,9/2]){
    //rotate(a=-14.11, v=[6.8249*unit,4.7294*unit,0]){
    rotate(iSW*TH1[2]+iSW2){
        cube([4,unit1+4,9],center=true);
    }
    }

    //高14
//    translate([5.4121*unit-unit/2-1,iSW*-6.1165*unit+iSW*unit/4-iSW*1+th_offset,14/2]){
//    //rotate(a=-14.11, v=[6.8249*unit,4.7294*unit,0]){
//    rotate(iSW*-21.41+iSW2){
//        cube([4,unit1+4,14],center=true);
//    }
//    }
//    
    
    //高24
//    translate([5.4121*unit-unit/2+1,iSW*-6.1165*unit+iSW*unit/4-iSW*1-iSW*th_offset-iSW*0.5,24/2]){
//    //rotate(a=-14.11, v=[6.8249*unit,4.7294*unit,0]){
//    rotate(iSW*-21.41+iSW2){
//        cube([8,unit1+4,24],center=true);
//    }
//    }
    
    //外側母座
    translate([TH3[0]*unit+unit/2-1,iSW*TH3[1]*unit-iSW*unit/2+iSW*2+th_offset+1,6/2]){
    //rotate(a=-14.11, v=[6.8249*unit,4.7294*unit,0]){
    rotate(iSW*TH3[2]+iSW2){
        cube([6,unit1+4,6],center=true);
        
        }
    }
}  
    
//母座上建立固定凹槽
//iSW*10
    //
    rotate_p([iSW*10,0,0],[(TH3[0])*unit,iSW*(TH3[1]-0.8)*unit+th_offset,2]){
        TH3(8);  
      }  

//高14用
//iSW*15
//    //
//    rotate_p([iSW*15,0,0],[(7.2504)*unit,iSW*(-7.2777-0.8)*unit+th_offset,2]){
//        #TH3(8);  
//      } 
      
//Backspace
//    translate([6.3906*unit,iSW*-6.6073*unit+th_offset,Thickness/2
//24用
// translate([0,0,2])
//    rotate_p([iSW*0,25,iSW*2],[(7.2504)*unit+unit/2,iSW*(-7.2777)*unit+th_offset-unit/2,10/2]){
//                #TH3(10);  
//      }  

  

}

    }
    


    
module 3U_BASE_POS24(iOffset)
{
    translate([0,-1*iSW*(-3UB_W/2+3UB_D/3-3),-TBC_H+2]){
    cylinder(TBC_H,3UB_D/2+5+iOffset/2,3UB_D/2+5+iOffset);
    }
    translate([0,-1*iSW*(3UB_W/2-3UB_D/3+14),-TBC_H+2]){
    cylinder(TBC_H,3UB_D/2+5+iOffset/2,3UB_D/2+5+iOffset);
    }
    translate([25,-1*iSW*(-20),-TBC_H/2]){
        rotate([0,0,-1*iSW*10])
    cube([40,8+iOffset,TBC_H],true);
    }  
    translate([-32,-1*iSW*(-25),-TBC_H/2]){
        rotate([0,0,-1*iSW*(-5)])
    cube([45,8+iOffset,TBC_H],true);
    } 
    translate([16.3,-1*iSW*(30),-TBC_H/2]){
        rotate([0,0,-1*iSW*(10.5)])
    cube([35,8+iOffset,TBC_H],true);
    }  
    translate([-25,-1*iSW*(26),-TBC_H/2]){
        rotate([0,0,-1*iSW*(2)])
    cube([50,8+iOffset,TBC_H],true);
    } 
}
module 3U_BASE_POS25(iOffset)
{
    translate([1,-1*iSW*(-3UB_W/2+3UB_D/3-3),-TBC_H+2]){
    cylinder(TBC_H,3UB_D/2+5+iOffset/2,3UB_D/2+5+iOffset);
    }
    translate([3,-1*iSW*(0),-TBC_H/2]){
        rotate([0,0,-1*iSW*(0)])
        cube([8+iOffset,50,TBC_H],true);
    }   
}

module 3U_BASE_POS22(iOffset)
{
    translate([0,0,-TBC_H+2]){
    cylinder(TBC_H,3UB_D/2+12+iOffset/2,3UB_D/2+12+iOffset);
    }

}

module 3U_BASE_POS21(iOffset)
{
    translate([0,-3UB_W/2+3UB_D/3,-TBC_H+2]){
    cylinder(TBC_H,3UB_D/2+7+iOffset/2,3UB_D/2+7+iOffset);
    }
    translate([0,3UB_W/2-3UB_D/3,-TBC_H+2]){
    cylinder(TBC_H,3UB_D/2+7+iOffset/2,3UB_D/2+7+iOffset);
    }
    translate([-3,0,-TBC_H/2]){
    cube([8+iOffset,40,TBC_H],true);
    }    
}


module tenting_columns(iOffset,$fn=200){
    translate([2.0415*unit,(iSW*-3.6315)*unit,0]){
       rotate(iSW*-1.23){
        3U_BASE_POS21(iOffset);
    }
    }

    translate([5.316*unit,(iSW*-3.8215)*unit,0]){
        rotate(iSW*-12.26){
        3U_BASE_POS24(iOffset);
    }}
    
   translate([8*unit,(iSW*-5)*unit,0]){
        rotate(iSW*-14.11){
        3U_BASE_POS25(iOffset);
        }
    }
    
    translate([7.25041*unit,iSW*-7.2777*unit+th_offset2,0]){
        3U_BASE_POS22(iOffset);
        }
        
//  去除中央牆面
//    translate([2.0415*unit+49-25,(iSW*-3.6315)*unit+3,-(150/2)]){
//       rotate(iSW*-8    ){
//        #cube([52,51,150],true);
           
//    translate([0,0,-(150)]){
//           #linear_extrude(height = 150){
//    hull($fn=200) {
//        
//    translate([2.0415*unit+3,(iSW*-3.631)*unit+25*iSW,0]){
//       rotate(iSW*-1.23){
//        circle(5);
//    }
//    }
//    translate([2.0415*unit+3,(iSW*-3.631)*unit+(25-35)*iSW,0]){
//       rotate(iSW*-1.23){
//        circle(5);
//    }
//    }
//    translate([5.316*unit+5,(iSW*-3.8215)*unit+(20)*iSW,0]){
//        rotate(iSW*-12.26){
//        circle(5);
//    }}
//    translate([5.316*unit-4,(iSW*-3.8215)*unit-(24)*iSW,0]){
//        rotate(iSW*-12.26){
//        circle(5);
//    }}    
//   translate([8*unit+3,(iSW*-5)*unit+(20)*iSW,0]){
//        rotate(iSW*-14.11){
//        circle(5);
//        }
//    }
//    
//    translate([7.25041*unit+5,iSW*-7.2777*unit+(19)*iSW,0]){
//        circle(5);
//        }
//        
//    }
//    }
//    
//}  
    
//    }
//    }
          

}

//mcu_pos_x=155.1+iSW2b*-15.5;
//mcu_pos_y=-62-iSW2b*-9;
//mcu_pos_r=iSW*-14.11+iSW2;

mcu_pos_x=mcu_pos_x_Offset;  // + mcu_width*iSW2a;
mcu_pos_y=mcu_pos_y_Offset;  // - (mcu_length/4)*iSW2a;
mcu_pos_r=iSW*mcu_pos_r_Offset+iSW2;

module Put_MCU()
{
    
    translate([mcu_pos_x,(iSW*mcu_pos_y),2]){
    rotate(mcu_pos_r){
    translate([-mcu_width*iSW2a,0,0]){
        mcu([-3,-3,-2,-2]);
    }
    }
    }
}

module Cut_MCU()
{
//    echo ("mcu_width=",mcu_width);
//    echo ("mcu_length=",mcu_length);
    translate([(mcu_pos_x),(iSW*(mcu_pos_y)),-2]){
    rotate(mcu_pos_r){
    translate([(-mcu_width)*iSW2a+0.5,-mcu_length-3,0]){
        #cube([mcu_width,mcu_length,5]);
        }
    }
    }
}

//idc_pos_x=154+iSW2b*-6.8;
//idc_pos_y=-105.5+iSW2b*-16.5;
//idc_pos_r=iSW*(-14.11+90-8)-iSW2;

idc_pos_x=idc_pos_x_Offset;
idc_pos_y=idc_pos_y_Offset;
idc_pos_r=iSW*(idc_pos_r_Offset)-iSW2;

module Put_IDC_Port()
{
    
        translate([idc_pos_x,(iSW*idc_pos_y),1]){
        rotate(idc_pos_r){
        translate([-IDC_W*iSW2a,0,0]){
            IDC_Port();
            }
        }
    }
    }
    
module Create_Tenting_Base()
{
    difference() {
        Tenting_Base(0,0);
        Tenting_Base(-3,-1);
        BASE_BOARD();
    }
    }

module Tenting_Base(iOffset,iOffset2)
{
difference() {
    tenting_columns(iOffset);
        
    
//    translate([0,0,-2]){
//        BASE_BOARD();
//        }

//    Tile: 6 / Tenting: 6    
    translate([75,-1*iSW*80,-11.5-(50/2)+4-iOffset]){
        rotate_p([-1*iSW*6,6,0],[75,-1*iSW*80,-11.5-(50/2)]){
        cube ([150,140,50],true);
        }
    }
//    Tile: 8 / Tenting: 20        
//    translate([75-10,-1*iSW*80,-11.5-(50/2)+-27-iOffset]){
//        rotate_p([-1*iSW*8,20,0],[75,-1*iSW*80,-11.5-(50/2)]){
//        cube ([150,140,50],true);
//        }
//    }
//    Tile: 8 / Tenting: 35        
//    translate([100-100,-1*iSW*80,-11.5-(50/2)+-98-iOffset2]){
//        rotate_p([-1*iSW*8,35,0],[100,-1*iSW*80,-11.5-(120/2)]){
//        cube ([220,150,120],true);
//        }
//    }    
//    Tile: 8 / Tenting: 45        
//    translate([100-124,-1*iSW*80,-11.5-(50/2)+-103-iOffset2]){
//        rotate_p([-1*iSW*8,45,0],[100,-1*iSW*80,-11.5-(100/2)]){
//        cube ([220,150,100],true);
//        }
//    }
//    
}

}


//=======建立主板==============
module Do_Create_BASE_BOARD() {
    
     //主底板+簍空
     difference(){

        Create_BASE_BOARD();
             
        //將主要底板底部削平
        translate([0*unit,0*unit,-2]){
            rotate(-0){
            #BASE_BOARD();
            }
            }
                    

        //看是否MCU座需要一起產生
        //預設是右側有MCU座，左側沒有
        //可修改 MCU_UseIn 值
        //這邊會裁切一個空間給MCU座
        if (MCU_UseIn==LR){ 
            Cut_MCU();
        } else if (MCU_UseIn=="LR"){
            Cut_MCU();
        }  

    }

    //看是否MCU座需要一起產生
    //預設是右側有MCU座，左側沒有
    //可修改 MCU_UseIn 值
    //這邊會放上MCU座
    if (MCU_UseIn==LR){ 
        Put_MCU();
    } else if (MCU_UseIn=="LR"){
        Put_MCU();
    }

    //看是否IDC座需要一起產生
    //可修改 IDC_UseIn 值

    if (IDC_UseIn==LR){ 
        Put_IDC_Port();
    } else if (IDC_UseIn=="LR"){
        Put_IDC_Port();
    }


}

//=======建立Tenting==============
module Do_Create_Tenting_Base() {
//    difference(){
    Create_Tenting_Base();
//    BASE_BOARD();
//}
//    3U_BASES(5,3,1);
//    translate([(3U_D+4),0,0]) {3U_BASES(2.5,2,0);}
//    translate([(3U_D+4)*2,0,0]){3U_BASES();}
//    translate([(3U_D+4)*3,0,0]){3U_BASES(2.5,-3,0);}
//    translate([(3U_D+4)*4,0,0]) {3U_BASES(5,-5,1.5);}

}

//=======執行==============
Do_Create_BASE_BOARD();
//Do_Create_Tenting_Base();