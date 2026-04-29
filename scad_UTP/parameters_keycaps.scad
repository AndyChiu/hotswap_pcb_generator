//Keycap List
//鍵帽清單

//The dimensions of the virtual keycaps are used to check whether they interfere with each other key.
//虛擬鍵帽的尺寸，用來檢查是否會相互干擾

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
    
    kc_KeycapName =[stl_file_path,[translate],[rotate],[mirror],TEXT_POS(Height)]
    
    => kc_鍵帽名稱 =[存放路徑,[位置],[旋轉],文字顯示位置(高度)]
    請把鍵帽設定到正中央,高度0的位置，要設定到Stem的頂端，也就是鍵帽插入到底的位置
    
*/


/*
-== Choc V1 Stem ==-
AndyChiu
*/
//kc_M02CF_T1,kc_M02CF_T2,kc_M05CN4,kc_M05L2016,kc_M05C1616,kc_M05C2018_1,kc_M05C2018_2

kc_M02CF_T1= ["../stl_UTP/Keycaps/Choc/AndyChiu/02-CF-T1-01.stl",[0,0,-0.7],[0,0,0],[0,0,0],2.55];
kc_M02CF_T2= ["../stl_UTP/Keycaps/Choc/AndyChiu/02-CF-T2-01.stl",[0,0,-0.7],[0,0,0],[0,0,0],2.55];

kc_M05CN4= ["../stl_UTP/Keycaps/Choc/AndyChiu/05_circle_M_N4(HB)-0610_center.stl"
            ,[0,0,-0.5],[0,0,0],[0,0,0],2.55];

kc_M05L2016= ["../stl_UTP/Keycaps/Choc/AndyChiu/05-20x16.stl",[0,0,-0.35],[0,0,0],[0,0,0],2.55];
kc_M05C1616= ["../stl_UTP/Keycaps/Choc/AndyChiu/05-16x16.stl",[0,0,-0.45],[0,0,0],[0,0,0],2.55];

kc_M05C2018_1= ["../stl_UTP/Keycaps/Choc/AndyChiu/05_1010-20x18.stl",[0,0,-0.8],[0,0,0],[0,0,0],4];
kc_M05C2018_2= ["../stl_UTP/Keycaps/Choc/AndyChiu/05_1210-20x18.stl",[0,0,-0.8],[0,0,0],[0,0,0],4];


/*
Fabis Keycap
https://t.me/fabis_manuform
https://www.youtube.com/@AlexanderSmirnovXYZ
*/
//kc_fabis,kc_fabisMod,kc_fabisModH

kc_fabis= ["../stl_UTP/Keycaps/Choc/Fabis/Fabis_Choc_Keycaps_SingleCap.stl"
            ,[0,0,-2.8],[90,0,180],[0,0,0],2.55];
kc_fabisMod= ["../stl_UTP/Keycaps/Choc/Fabis/fabis_short.stl"
              ,[0,0,-0.8],[0,0,0],[0,0,0],1.55];
kc_fabisModH= ["../stl_UTP/Keycaps/Choc/Fabis/fabis_short(home).stl"
               ,[0,0,-0.8],[0,0,180],[0,0,0],1.55];

//FredMF
//https://www.printables.com/model/38531-kailh-choc-keycap/files
//kc_FMF_1U,kc_FMF_1UH,kc_FMF_2U

kc_FMF_1U= ["../stl_UTP/Keycaps/Choc/FredMF/cap.stl",[0,0,-0.8],[0,0,0],[0,0,0],2];
kc_FMF_1UH= ["../stl_UTP/Keycaps/Choc/FredMF/cap_tactile.stl",[0,0,-0.7],[0,0,0],[0,0,0],2];
kc_FMF_2U= ["../stl_UTP/Keycaps/Choc/FredMF/cap_wide.stl",[0,0,-0.8],[0,0,0],[0,0,0],2];

//KLP-Lame
//https://github.com/braindefender/KLP-Lame-Keycaps

//Choc Stem + Choc Size

//kc_KLP_CN,kc_KLP_CH,kc_KLP_CT1,kc_KLP_CT2
//kc_KLP_CSN,kc_KLP_CSH,kc_KLP_CST1,kc_KLP_CST2,kc_KLP_CTH

//Normal
kc_KLP_CN= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Normal.stl",[0,0,-2.7],[0,0,0],[0,0,0],3];
kc_KLP_CH= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Normal_Homing.stl",[0,0,-2.5],[0,0,0],[0,0,0],3];
kc_KLP_CT1= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Normal_Tilted.stl",[0,0,-2.2],[0,0,0],[0,0,0],5];
kc_KLP_CT2= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Normal_Tilted.stl",[0,0,-2.2],[0,0,180],[0,0,0],5];

//Saddle
kc_KLP_CSN= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Saddle.stl",[0,0,-2.7],[0,0,0],[0,0,0],2.5];
kc_KLP_CSH= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Saddle_Homing.stl",[0,0,-2.7],[0,0,0],[0,0,0],2.5];
kc_KLP_CST1= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Saddle_Tilted.stl",[0,0,-2.2],[0,0,0],[0,0,0],5];
kc_KLP_CST2= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Saddle_Tilted.stl",[0,0,-2.2],[0,0,180],[0,0,0],5];
//Thumb
kc_KLP_CTH= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + Choc Size/Choc_Stem_Choc_Size_Thumb.stl",[0,0,-2.7],[0,0,0],[0,0,0],2.5];

//Choc Stem + MX Size

//kc_KLP_MN,kc_KLP_MH,kc_KLP_MT1,kc_KLP_MT2
//kc_KLP_MSN,kc_KLP_MSH,kc_KLP_MST1,kc_KLP_MST2,kc_KLP_MTH

//Normal
kc_KLP_MN= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Normal.stl",[0,0,-2.7],[0,0,0],[0,0,0],3];
kc_KLP_MH= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Normal_Homing.stl",[0,0,-2.7],[0,0,0],[0,0,0],3];
kc_KLP_MT1= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Normal_Tilted.stl",[0,0,-2.2],[0,0,0],[0,0,0],5];
kc_KLP_MT2= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Normal_Tilted.stl",[0,0,-2.2],[0,0,180],[0,0,0],5];

//Saddle
kc_KLP_MSN= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Saddle.stl",[0,0,-2.7],[0,0,0],[0,0,0],2.5];
kc_KLP_MSH= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Saddle_Homing.stl",[0,0,-2.7],[0,0,0],[0,0,0],2.5];
kc_KLP_MST1= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Saddle_Tilted.stl",[0,0,-2.2],[0,0,0],[0,0,0],5];
kc_KLP_MST2= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Saddle_Tilted.stl",[0,0,-2.2],[0,0,180],[0,0,0],5];

//Thumb
kc_KLP_MTH= ["../stl_UTP/Keycaps/Choc/KLP-Lame/Choc Stem + MX Size/Choc_Stem_MX_Size_Thumb.stl",[0,0,-2.7],[0,0,0],[0,0,0],2.5];

//-== MX Stem ==-

//Cherry
//https://github.com/ConstantinoSchillebeeckx/cherry-mx-keycaps

//kc_Cherry_1U_R1,kc_Cherry_1U_R2,kc_Cherry_1U_R3,kc_Cherry_1U_R4

kc_Cherry_1U_R1= ["../stl_UTP/Keycaps/MX/Cherry/1x1 R1.stl",[0,0,-3.6],[90,0,0],[0,0,0],5.3];
kc_Cherry_1U_R2= ["../stl_UTP/Keycaps/MX/Cherry/1x1 R2.stl",[0,0,-3.6],[90,0,0],[0,0,0],4.8];
kc_Cherry_1U_R3= ["../stl_UTP/Keycaps/MX/Cherry/1x1 R3.stl",[0,0,-3.6],[90,0,0],[0,0,0],5];
kc_Cherry_1U_R4= ["../stl_UTP/Keycaps/MX/Cherry/1x1 R4.stl",[0,0,-3.6],[90,0,0],[0,0,0],6.8];

//Other
//GEM
//https://www.printables.com/model/399607-complete-cherry-mx-stem-keycap-set-optimized-for-3

//kc_GEM_1U

kc_GEM_1U= ["../stl_UTP/Keycaps/MX/GEM/1U_blank.3mf",[0,0,-4.6],[180+70,0,0],[0,0,0],3];

//Andy Chiu
//Low Profile

//kc_LP_1U,kc_LP_1UHB,kc_LP_1_25U,kc_LP_1_5U,kc_LP_1_5UL,kc_LP_1_75U,kc_LP_1_75UCL
//kc_LP_2U,kc_LP_2UL,kc_LP_2_25U,kc_LP_2_75U,kc_LP_3U
//kc_LP_6U,kc_LP_6_25U,kc_LP_7U
//kc_LP_BigAssEnter,kc_LP_CapsLock,kc_LP_ISO105Enter

kc_LP_1U= ["../stl_UTP/Keycaps/MX/LP/LP_1U.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_1UHB= ["../stl_UTP/Keycaps/MX/LP/LP_1UHB.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_1_25U= ["../stl_UTP/Keycaps/MX/LP/LP_1.25U.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_1_5U= ["../stl_UTP/Keycaps/MX/LP/LP_1.5U.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_1_5UL= ["../stl_UTP/Keycaps/MX/LP/LP_1.5UL.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_1_75U= ["../stl_UTP/Keycaps/MX/LP/LP_1.75U.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_1_75UCL= ["../stl_UTP/Keycaps/MX/LP/LP_1.75U.stl",[8.9-4,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_2U= ["../stl_UTP/Keycaps/MX/LP/LP_2U.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_2UL= ["../stl_UTP/Keycaps/MX/LP/LP_2UL.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_2_25U= ["../stl_UTP/Keycaps/MX/LP/LP_2.25U.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_2_5U= ["../stl_UTP/Keycaps/MX/LP/LP_2.5U.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_2_75U= ["../stl_UTP/Keycaps/MX/LP/LP_2.75U.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_3U= ["../stl_UTP/Keycaps/MX/LP/LP_3U.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_6U= ["../stl_UTP/Keycaps/MX/LP/LP_6U.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_6_25U= ["../stl_UTP/Keycaps/MX/LP/LP_6.25U.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_7U= ["../stl_UTP/Keycaps/MX/LP/LP_7U.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_BigAssEnter= ["../stl_UTP/Keycaps/MX/LP/LP_BigAssEnter.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_CapsLock= ["../stl_UTP/Keycaps/MX/LP/LP_CapsLock.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];
kc_LP_ISO105Enter= ["../stl_UTP/Keycaps/MX/LP/LP_ISO105Enter.stl",[0,0,-3.6],[0,0,0],[0,0,0],2];

//SWELL
//https://github.com/dohn-joh/swell-keycaps

//kc_SWELL_1U_TOP,kc_SWELL_1U_TOP_TITLTED_L,kc_SWELL_1U_TOP_TITLTED_R
//kc_SWELL_1_25U_TOP_TITLTED_L,kc_SWELL_1_25U_TOP_TITLTED_R
//kc_SWELL_1U_HOME,kc_SWELL_1U_HOME_HB,kc_SWELL_1U_HOME_TITLTED_L,kc_SWELL_1U_HOME_TITLTED_R
//kc_SWELL_1_25U_HOME_TITLTED_L,kc_SWELL_1_25U_HOME_TITLTED_R


kc_SWELL_1U_TOP= ["../stl_UTP/Keycaps/MX/SWELL/top_1u.stl",[0,0,0],[0,0,0],[0,0,0],3];
kc_SWELL_1U_TOP_TITLTED_L= ["../stl_UTP/Keycaps/MX/SWELL/top_tilted_1u.stl",[0,0,0],[0,0,0],[1,0,0],5];
kc_SWELL_1U_TOP_TITLTED_R= ["../stl_UTP/Keycaps/MX/SWELL/top_tilted_1u.stl",[0,0,0],[0,0,0],[0,0,0],5];

kc_SWELL_1_25U_TOP_TITLTED_L= ["../stl_UTP/Keycaps/MX/SWELL/top_tilted_1.25u_L.stl",[0,0,0],[0,0,0],[0,0,0],3];
kc_SWELL_1_25U_TOP_TITLTED_R= ["../stl_UTP/Keycaps/MX/SWELL/top_tilted_1.25u_L.stl",[0,0,0],[0,0,0],[1,0,0],3];

kc_SWELL_1U_HOME= ["../stl_UTP/Keycaps/MX/SWELL/home_1u.stl",[0,0,0],[0,0,0],[0,0,0],2];

kc_SWELL_1U_HOME_HB= ["../stl_UTP/Keycaps/MX/SWELL/home_1u_homing_bar.stl",[0,0,0],[0,0,0],[0,0,0],2];

kc_SWELL_1U_HOME_TITLTED_L= ["../stl_UTP/Keycaps/MX/SWELL/home_tilted_1u.stl",[0,0,0],[0,0,0],[1,0,0],4.5];
kc_SWELL_1U_HOME_TITLTED_R= ["../stl_UTP/Keycaps/MX/SWELL/home_tilted_1u.stl",[0,0,0],[0,0,0],[0,0,0],4.5];

kc_SWELL_1_25U_HOME_TITLTED_L= ["../stl_UTP/Keycaps/MX/SWELL/home_tilted_1.25u.stl",[0,0,0],[0,0,0],[1,0,0],2.5];
kc_SWELL_1_25U_HOME_TITLTED_R= ["../stl_UTP/Keycaps/MX/SWELL/home_tilted_1.25u.stl",[0,0,0],[0,0,0],[0,0,0],2.5];

//kc_SWELL_1U_BOTTOM,kc_SWELL_1U_BOTTOM_TITLTED_L,kc_SWELL_1U_BOTTOM_TITLTED_R
//kc_SWELL_1U_CONVEX_UNIFORM,kc_SWELL_1_25U_CONVEX_UNIFORM,kc_SWELL_1U_CONVEX_OLD
//kc_SWELL_1U_LEVER_L,kc_SWELL_1U_LEVER_R

kc_SWELL_1U_BOTTOM= ["../stl_UTP/Keycaps/MX/SWELL/bottom_1u.stl",[0,0,0],[0,0,0],[0,0,0],4];
kc_SWELL_1U_BOTTOM_TITLTED_L= ["../stl_UTP/Keycaps/MX/SWELL/bottom_tilted_1u.stl",[0,0,0],[0,0,0],[0,0,0],6];
kc_SWELL_1U_BOTTOM_TITLTED_R= ["../stl_UTP/Keycaps/MX/SWELL/bottom_tilted_1u.stl",[0,0,0],[0,0,0],[1,0,0],6];


kc_SWELL_1U_CONVEX_UNIFORM= ["../stl_UTP/Keycaps/MX/SWELL/convex_1u_uniform.stl",[0,0,0],[0,0,0],[0,0,0],3];
kc_SWELL_1_25U_CONVEX_UNIFORM= ["../stl_UTP/Keycaps/MX/SWELL/convex_1.25u_uniform.stl",[0,0,0],[0,0,0],[0,0,0],3];

kc_SWELL_1U_CONVEX_OLD= ["../stl_UTP/Keycaps/MX/SWELL/convex_1u_old.stl",[0,0,0],[0,0,0],[0,0,0],2.5];

kc_SWELL_1U_LEVER_L= ["../stl_UTP/Keycaps/MX/SWELL/lever_keycap_1u.stl",[0,0,1.8],[0,0,0],[0,0,0],3];
kc_SWELL_1U_LEVER_R= ["../stl_UTP/Keycaps/MX/SWELL/lever_keycap_1u.stl",[0,0,1.8],[0,0,0],[1,0,0],3];





module keycapStyleTEST(keycapStyle)
{
%translate(keycapStyle[1]) rotate(keycapStyle[2]) mirror(keycapStyle[3])
import(keycapStyle[0]);

keycapLegend="ESC ESC";
 
base_pcb_layout_ShowKeycapLegend_H=keycapStyle[4];
translate([0,0,base_pcb_layout_ShowKeycapLegend_H])     
color("Black") %text(keycapLegend,size=3,halign="center",valign="center");
}

//TEST 檢視與設定鍵帽上軸後壓到底的位置
//kc_M02CF_T1,kc_M02CF_T2,kc_M05CN4,kc_M05L2016,kc_M05C1616,kc_M05C2018_1,kc_M05C2018_2
//kc_fabis,kc_fabisMod,kc_fabisModH
//kc_FMF_1U,kc_FMF_1UH,kc_FMF_2U
//kc_fabis,kc_fabisMod,kc_fabisModH
//kc_KLP_CN,kc_KLP_CH,kc_KLP_CT1,kc_KLP_CT2
//kc_KLP_CSN,kc_KLP_CSH,kc_KLP_CST1,kc_KLP_CST2,kc_KLP_CTH
//kc_KLP_MSN,kc_KLP_MSH,kc_KLP_MST1,kc_KLP_MST2,kc_KLP_MTH
//kc_Cherry_1U_R1,kc_Cherry_1U_R2,kc_Cherry_1U_R3,kc_Cherry_1U_R4
//kc_GEM_1U
//kc_LP_1U,kc_LP_1UHB,kc_LP_1_25U,kc_LP_1_5U,kc_LP_1_5UL,kc_LP_1_75U,kc_LP_1_75UCL
//kc_LP_2U,kc_LP_2UL,kc_LP_2_25U,kc_LP_2_75U,kc_LP_3U
//kc_LP_6U,kc_LP_6_25U,kc_LP_7U
//kc_LP_BigAssEnter,kc_LP_CapsLock,kc_LP_ISO105Enter

//kc_SWELL_1U_TOP,kc_SWELL_1U_TOP_TITLTED_L,kc_SWELL_1U_TOP_TITLTED_R
//kc_SWELL_1_25U_TOP_TITLTED_L,kc_SWELL_1_25U_TOP_TITLTED_R
//kc_SWELL_1U_HOME,kc_SWELL_1U_HOME_HB,kc_SWELL_1U_HOME_TITLTED_L,kc_SWELL_1U_HOME_TITLTED_R
//kc_SWELL_1_25U_HOME_TITLTED_L,kc_SWELL_1_25U_HOME_TITLTED_R

//kc_SWELL_1U_BOTTOM,kc_SWELL_1U_BOTTOM_TITLTED_L,kc_SWELL_1U_BOTTOM_TITLTED_R
//kc_SWELL_1U_CONVEX_UNIFORM,kc_SWELL_1_25U_CONVEX_UNIFORM,kc_SWELL_1U_CONVEX_OLD
//kc_SWELL_1U_LEVER_L,kc_SWELL_1U_LEVER_R

//difference()
//{
//translate([0,0,0]) keycapStyleTEST(kc_SWELL_1_25U_CONVEX_UNIFORM);
//translate([-20,0,-20]) cube(40);
//}
