pinC=3; //單排PIN數

sc=15.9/16.3;//size_calibration尺寸校準,依照自己印表機調整, 為 實際/設定值 的比例

tsb=1/sc; //底厚度
ts=1/sc; //外殼厚度
tsp=1.5/sc; //接頭卡榫長度
tst=1.5/sc; //尾端卡榫長度

fs=15/sc; //固定點長寬
djSize=2.54 / sc;

//ps=(33.5+0.3)/sc; //接頭寬度
ps=(8.1+pinC*djSize+0.5)/sc; //接頭寬度,微調避免太小
//pst=28.5/sc; //接頭尾寬度
pst=(3.1+pinC*djSize)/sc; //接頭尾寬度
fsh=19/sc; //固定點高度
pl=12+0.7/sc; //接頭長度
//IDC
//長寬 外殼厚度
IDC_W_t=1.1 / sc;
IDC_L_t=0.9 / sc;

IDC_W=IDC_W_t + ps;
IDC_L=IDC_L_t + pl;

djH=14 / sc;
djHt=djH/3;
djHt2=(djHt-djH/4)+djHt;

module IDC_Port() {
translate([0,tsp,0]) 
cube([ts,pl,fsh/2],center=false); 
translate([ts+ps,tsp,0]) 
cube([ts,pl,fsh/2],center=false); 

translate([(ps-pst)/2,pl+tsp,0]) 
cube([ts,djHt2,fsh/2],center=false);    
translate([ts+ps-(ps-pst)/2,pl+tsp,0]) 
cube([ts,djHt2,fsh/2],center=false); 

translate([0,pl+tsp+djHt2,0]) 
cube([ts,djHt+0.4,fsh/2],center=false); 
translate([ts+ps,pl+tsp+djHt2,0]) 
cube([ts,djHt+0.4,fsh/2],center=false); 

translate([0,pl+tsp,0]) 
cube([(ps-pst)/2,ts,fsh/2],center=false); 
translate([ts*2+pst+(ps-pst)/2,pl+tsp,0]) 
cube([(ps-pst)/2,ts,fsh/2],center=false); 

translate([0,(tsp-ts)+pl+djHt2,0]) 
cube([(ps-pst)/2,ts,fsh/2],center=false); 
translate([ts*2+pst+(ps-pst)/2,(tsp-ts)+pl+djHt2,0]) 
cube([(ps-pst)/2,ts,fsh/2],center=false); 

translate([ts,tsp,0]) 
cube([ps,pl,tsb],center=false); 
translate([(ps-pst)/2+ts,pl+tsp,0]) 
cube([pst,djHt2,tsb],center=false); 
translate([ts,pl+tsp+djHt2,0]) 
cube([ps,djHt+0.4,tsb],center=false); 

translate([0,0,0]) 
cube([ts*2+ps,tsp,tsb+IDC_L_t],center=false); 
translate([0,0,0]) 
cube([ts+IDC_W_t,tsp,fsh/2],center=false); 
translate([ts+ps-IDC_W_t,0,0]) 
cube([ts+IDC_W_t,tsp,fsh/2],center=false); 

translate([0,pl+tsp+djHt2+djHt+0.4,0]) 
cube([ts*2+ps,tst,tsb+IDC_L_t],center=false); 
translate([0,pl+tsp+djHt2+djHt+0.4,0]) 
cube([ts+IDC_W_t,tst,fsh/2],center=false); 
translate([ts+ps-IDC_W_t,pl+tsp+djHt2+djHt+0.4,0]) 
cube([ts+IDC_W_t,tst,fsh/2],center=false); 
}


//IDC_Port();