//Keycap List
//鍵帽清單

/*
    ==============================
	Keycaps size 鍵帽尺寸 [x,y,z]
	==============================
	Choc V1 (Kailh) 17.7x16.7x5.2
    Choc V1 (Fabis) 16.4x15.5x5.2
	MX              18x18x8

    如果沒設定鍵帽模型,則顯示此尺寸的方塊
*/

kcs_choc_v1=[17.7,16.7,5.2];
kcs_choc_v1_fabis=[16.4,15.5,5.2];
kcs_mx=[18,18,8];

/*
    ==============================
	Keycap Model 鍵帽模型
	==============================
    
    kc_KeycapName =[stl_file_path,[translate],[rotate]]
    
    => kc_鍵帽名稱 =[存放路徑,[位置],[旋轉]]
    請把鍵帽設定到正中央,高度0的位置，要設定到Stem的頂端，也就是鍵帽插入到底的位置
    
*/


//-== Choc V1 Stem ==-

//AndyChiu
kc_M02CF_T1= ["../stl_UTP/Keycaps/Choc/AndyChiu/02-CF-T1-01.stl",[0,0,-0.7],[0,0,0]];
kc_M02CF_T2= ["../stl_UTP/Keycaps/Choc/AndyChiu/02-CF-T2-01.stl",[0,0,-0.7],[0,0,0]];

kc_M05CN4= ["../stl_UTP/Keycaps/Choc/AndyChiu/05_circle_M_N4(HB)-0610_center.stl"
            ,[0,0,-0.5],[0,0,0]];

kc_M05L2016= ["../stl_UTP/Keycaps/Choc/AndyChiu/05-20x16.stl",[0,0,-0.35],[0,0,0]];
kc_M05C1616= ["../stl_UTP/Keycaps/Choc/AndyChiu/05-16x16.stl",[0,0,-0.45],[0,0,0]];

kc_M05C2018_1= ["../stl_UTP/Keycaps/Choc/AndyChiu/05_1010-20x18.stl",[0,0,-0.8],[0,0,0]];
kc_M05C2018_2= ["../stl_UTP/Keycaps/Choc/AndyChiu/05_1210-20x18.stl",[0,0,-0.8],[0,0,0]];

/*
Fabis Keycap
https://t.me/fabis_manuform
https://www.youtube.com/@AlexanderSmirnovXYZ
*/

kc_fabis= ["../stl_UTP/Keycaps/Choc/Fabis/Fabis_Choc_Keycaps_SingleCap.stl"
            ,[0,0,-2.8],[90,0,180]];
kc_fabisMod= ["../stl_UTP/Keycaps/Choc/Fabis/fabis_short.stl"
              ,[0,0,-0.8],[0,0,0]];
kc_fabisModH= ["../stl_UTP/Keycaps/Choc/Fabis/fabis_short(home).stl"
               ,[0,0,-0.8],[0,0,180]];

//FredMF
//https://www.printables.com/model/38531-kailh-choc-keycap/files

kc_FMF_1U= ["../stl_UTP/Keycaps/Choc/FredMF/cap.stl",[0,0,-0.8],[0,0,0]];
kc_FMF_1UH= ["../stl_UTP/Keycaps/Choc/FredMF/cap_tactile.stl",[0,0,-0.7],[0,0,0]];
kc_FMF_2U= ["../stl_UTP/Keycaps/Choc/FredMF/cap_wide.stl",[0,0,-0.8],[0,0,0]];

//KLP-Lame
//Choc Stem + Choc Size
//https://github.com/braindefender/KLP-Lame-Keycaps

//Normal
kc_KLP_CN= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Normal.stl",[0,0,-2.7],[0,0,0]];
kc_KLP_CH= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Normal_Homing.stl",[0,0,-2.5],[0,0,0]];
kc_KLP_CT1= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Normal_Tilted.stl",[0,0,-2.2],[0,0,0]];
kc_KLP_CT2= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Normal_Tilted.stl",[0,0,-2.2],[0,0,180]];


//Saddle
kc_KLP_CSN= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Saddle.stl",[0,0,-2.7],[0,0,0]];
kc_KLP_CSH= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Saddle_Homing.stl",[0,0,-2.7],[0,0,0]];
kc_KLP_CST1= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Saddle_Tilted.stl",[0,0,-2.2],[0,0,0]];
kc_KLP_CST2= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Saddle_Tilted.stl",[0,0,-2.2],[0,0,180]];
//Thumb
kc_KLP_CTH= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Thumb.stl",[0,0,-2.7],[0,0,0]];

//Choc Stem + MX Size

//Normal
kc_KLP_MN= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Normal.stl",[0,0,-2.7],[0,0,0]];
kc_KLP_MH= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Normal_Homing.stl",[0,0,-2.7],[0,0,0]];
kc_KLP_MT1= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Normal_Tilted.stl",[0,0,-2.2],[0,0,0]];
kc_KLP_MT2= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Normal_Tilted.stl",[0,0,-2.2],[0,0,180]];


//Saddle
kc_KLP_MSN= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Saddle.stl",[0,0,-2.7],[0,0,0]];
kc_KLP_MSH= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Saddle_Homing.stl",[0,0,-2.7],[0,0,0]];
kc_KLP_MST1= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Saddle_Tilted.stl",[0,0,-2.2],[0,0,0]];
kc_KLP_MST2= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Saddle_Tilted.stl",[0,0,-2.2],[0,0,180]];

//Thumb
kc_KLP_MTH= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Thumb.stl",[0,0,-2.7],[0,0,0]];


//-== MX Stem ==-

//Cherry
//https://github.com/ConstantinoSchillebeeckx/cherry-mx-keycaps

kc_Cherry_1U_R1= ["../stl_UTP/Keycaps/MX/Cherry/1x1 R1.stl",[0,0,-3.6],[90,0,0]];
kc_Cherry_1U_R2= ["../stl_UTP/Keycaps/MX/Cherry/1x1 R2.stl",[0,0,-3.6],[90,0,0]];
kc_Cherry_1U_R3= ["../stl_UTP/Keycaps/MX/Cherry/1x1 R3.stl",[0,0,-3.6],[90,0,0]];
kc_Cherry_1U_R4= ["../stl_UTP/Keycaps/MX/Cherry/1x1 R4.stl",[0,0,-3.6],[90,0,0]];

//Other
//GEM
//https://www.printables.com/model/399607-complete-cherry-mx-stem-keycap-set-optimized-for-3

kc_GEM_1U= ["../stl_UTP/Keycaps/MX/GEM/1U_blank.3mf",[0,0,-4.6],[180+70,0,0]];


module keycapStyleTEST(keycapStyle)
{
translate(keycapStyle[1]) rotate(keycapStyle[2])
import(keycapStyle[0]);
}

//TEST 檢視與設定鍵帽上軸後壓到底的位置
//difference()
//{
//translate([0,0,0]) keycapStyleTEST(kc_GEM_1U);
//translate([-20,0,-20]) cube(40);
//}
//
