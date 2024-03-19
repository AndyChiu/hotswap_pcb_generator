//杜邦線轉成IDC母頭

sc=15.9/16.3; //尺寸校準,依照自己印表機調整, 為 實際/設定值 的比例, 取得的值拿來除

//針數
pinR=2;
pinC=3;

//dupont jumpers 外殼尺寸, 長寬都2.54, 高14mm
djSize=2.54 / sc;
djH=14 / sc;
djT=0.5 / sc;
//頂針於IDC底部遮蔽的厚度
djT2=0.9 / sc;

djHolder_T=2 / sc;
djHolder_W_In = djSize*pinC+0.2;
djHolder_L_In = djSize*pinR+0.2;
djHolder_W_Out=djHolder_W_In+djHolder_T;
djHolder_L_Out=djHolder_L_In+djHolder_T;



//尾部長度 開孔長寬
djHt=djH/3;
djHolderT_W_In = djHolder_W_In-(0.5*2);
djHolderT_L_In = djHolder_L_In-(0.5*2);

//長寬 外殼厚度
IDC_W_t=1.1 / sc;
IDC_L_t=0.9 / sc;

//外部大小
//IDC_W_Out=32.8 / sc;
//IDC_L_Out=8.7 / sc;
//IDC_H_Out=8.7 -1.6 / sc;
IDC_W_Out=(7.4+djSize*pinC) / sc;
IDC_L_Out=(3.62+djSize*pinR) / sc;
IDC_H_Out=((3.62+djSize*pinR) -1.6) / sc;

//內部空間大小
IDC_W_In=IDC_W_Out-IDC_W_t*2-0.2;
IDC_L_In=IDC_L_Out-IDC_L_t*2-0.2;
IDC_W_S=IDC_W_In-djSize*pinC;
IDC_L_S=IDC_L_In-djSize*pinR;
IDC_H_In=6.6 / sc;

top_side_cut_size=4.3 / sc;
both_side_cut_size=3.2 / sc;

IDC_Bt_Cut_W=djSize*pinC-djT2*2;
IDC_Bt_Cut_L=djSize*1-djT2*2;


module Male_idc(borders=[0,0,0,0]) {
    
difference() {
cube([IDC_W_Out,IDC_L_Out,IDC_H_Out]);
    //內部空洞
    translate([(IDC_W_Out-IDC_W_In)/2,(IDC_L_Out-IDC_L_In)/2,0]) 
        cube([IDC_W_In,IDC_L_In,IDC_H_In]);
    //頂部定位缺孔
    translate([(IDC_W_Out-top_side_cut_size)/2,IDC_L_Out-IDC_L_t-0.2,0]) 
        cube([top_side_cut_size,IDC_L_t+0.2,IDC_H_In]);
    //底部開孔
    translate([(IDC_W_Out-IDC_Bt_Cut_W)/2,(IDC_L_Out-IDC_Bt_Cut_L)/2+djSize/2,IDC_H_In]) 
        cube([IDC_Bt_Cut_W,IDC_Bt_Cut_L,djH]);
    translate([(IDC_W_Out-IDC_Bt_Cut_W)/2,(IDC_L_Out-IDC_Bt_Cut_L)/2-djSize/2,IDC_H_In]) 
        cube([IDC_Bt_Cut_W,IDC_Bt_Cut_L,djH]);
    //側面開孔
    translate([IDC_W_Out-IDC_W_t-0.2,(IDC_L_Out-both_side_cut_size)/2,IDC_H_Out-IDC_H_In+1.6]) 
        #cube([IDC_W_t+0.2,both_side_cut_size,IDC_H_In-1.6]);
    translate([0,(IDC_L_Out-both_side_cut_size)/2,IDC_H_Out-IDC_H_In+1.6]) 
        #cube([IDC_W_t+0.2,both_side_cut_size,IDC_H_In-1.6]);    
    }
    
}


module DJ_Holder(borders=[0,0,0,0]) {
difference() {
cube([IDC_W_Out,IDC_L_Out,djH/3]);
    translate([(IDC_W_Out-djHolder_W_Out)/2,(IDC_L_Out-djHolder_L_Out)/2,0]) 
    cube([djHolder_W_Out,djHolder_L_Out,djH]);
}

translate([(IDC_W_Out-djHolder_W_Out)/2,(IDC_L_Out-djHolder_L_Out)/2,0])
difference() {
cube([djHolder_W_Out,djHolder_L_Out,djH]);
    //內部空洞
    translate([(djHolder_W_Out-djHolder_W_In)/2,(djHolder_L_Out-djHolder_L_In)/2,0]) 
        cube([djHolder_W_In,djHolder_L_In,djH]);
}
}

module DJ_HolderTail(borders=[0,0,0,0]) {
difference() {
cube([IDC_W_Out,IDC_L_Out,djH/3]);
translate([(IDC_W_Out-djHolder_W_Out-0.2)/2,(IDC_L_Out-djHolder_L_Out)/2,0]) 
    #cube([djHolder_W_Out+0.2,djHolder_L_Out,djH/4]);
translate([(IDC_W_Out-djHolderT_W_In)/2,(IDC_L_Out-djHolderT_L_In)/2,0]) 
        cube([djHolderT_W_In,djHolderT_L_In,djH]);
//切一半用來夾住
cube([IDC_W_Out,IDC_L_Out/2,djH/3]);

}   

    
}


translate([0,0,0])
    DJ_Holder();

translate([0,-20,0])
    DJ_HolderTail();

translate([0,-27,0])
    DJ_HolderTail();

translate([50,0,0])
    Male_idc(); 
