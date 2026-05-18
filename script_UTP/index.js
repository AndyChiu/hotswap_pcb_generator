if (process.argv.length <= 2) {
    console.log(`
使用說明 (Usage):
    node index.js <KLE JSON File name> [Specify Label ID]

範例:
    node index.js layout_xxx.json
    node index.js layout_ooo.json 0
    `);

    process.exit(0);
}

//----------------------------------------------

const kle = require("@ijprest/kle-serial");
const fs = require("fs")
const util = require("util")
const path = require('path');

const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const roundTo = (n, d) => Math.round((n + Number.EPSILON) * 10**d) / 10**d;

var kle_filename = process.argv[2] ?? "layout.json";
var use_label_id = process.argv[3] ?? "";

const mainName = path.basename(kle_filename, path.extname(kle_filename));

var output_filename = process.argv[4] ?? "../scad_UTP/layout_" + mainName + ".scad";


var layouts_filename =       "../scad_UTP/layouts.scad";
var paramDefault_filename =  "../scad_UTP/parameter_default.scad";
var params_filename =        "../scad_UTP/parameters.scad";

try {
    var kle_json = fs.readFileSync(kle_filename, "UTF-8");
} catch (err) {
    console.error(err);
}

var keyboard = kle.Serial.parse(kle_json);

//key.labels[4]
//,"&quot" + key.labels[4] + "&quot"
//"//" + key.labels[4] + " " + 

var formatted_keys = keyboard.keys.map(
    key => {
        
        let key_width =  roundTo(key.width,2);
        let key_height = roundTo(key.height,2);
        let key_width2 =  roundTo(key.width2,2);
        let key_height2 = roundTo(key.height2,2);
        
        let key_stepped = roundTo(key.stepped,2);
        let key_nub = roundTo(key.nub,2);
        
        let key_x =  roundTo(key.x,4);
        let key_y =  roundTo(key.y,4);
        let key_rotation_angle =  roundTo(key.rotation_angle,4);
        let key_rotation_x =  roundTo(key.rotation_x,4);
        let key_rotation_y =  roundTo(key.rotation_y,4);

        //let side_borderW = roundTo(((key_width-1)/2),4);
        //let side_borderH = roundTo(((key_height-1)/2),4);

        let side_borderU = roundTo(((key_height-1)/2),4);
        let side_borderD = roundTo(((key_height-1)/2),4);
        let side_borderL = roundTo(((key_width-1)/2),4);
        let side_borderR = roundTo(((key_width-1)/2),4);
		
		let key_cap="";
		let kc_stab="";
		
		if (key_width == 1.25 && key_width2 == 1.25 && key_height == 1) {
			key_cap="kc_LP_1_25U";
		} else if (key_width == 1.25 && key_width2 == 1.75 && key_height == 1 && key_stepped== true) {
			key_cap="kc_LP_CapsLock";
			side_borderR=side_borderR+0.5;
		} else if (key_width == 1.25 && key_width2 == 1.75 && key_height == 1) {
			key_cap="kc_LP_1_75UCL";
			side_borderR=side_borderR+0.5;
		} else if (key_width == 1.5 && key_width2 == 2.25 && key_height == 2 && key_height2 == 1) {
			key_cap="kc_LP_BigAssEnter";
			kc_stab="stab_2u"
			side_borderL=side_borderL+0.75;
		} else if (key_width == 1.25 && key_width2 == 1.5 && key_height == 2 && key_height2 == 1) {
			key_cap="kc_LP_ISO105Enter";
			kc_stab="stab_2u"
			side_borderL=side_borderL+0.75;
		} else if (key_width == 1.5 && key_height == 1) {
			key_cap="kc_LP_1_5U";
		} else if (key_width == 1 && key_height == 1.5) {
			key_cap="kc_LP_1_5UL";
		} else if (key_width == 1.75 && key_height == 1) {
			key_cap="kc_LP_1_75U";
		} else if (key_width == 2 && key_height == 1) {
			key_cap="kc_LP_2U";
			kc_stab="stab_2u"
		} else if (key_width == 1 && key_height == 2) {
			key_cap="kc_LP_2UL";
			kc_stab="stab_2u"
		} else if (key_width == 2.25 && key_height == 1) {
			key_cap="kc_LP_2_25U";
			kc_stab="stab_2_25u"
		} else if (key_width == 2.5 && key_height == 1) {
			key_cap="kc_LP_2_5U";
			kc_stab="stab_2_5u"
		} else if (key_width == 2.75 && key_height == 1) {
			key_cap="kc_LP_2_75U";
			kc_stab="stab_2_75u"
		} else if (key_width == 3 && key_height == 1) {
			key_cap="kc_LP_3U";
			kc_stab="stab_3u"
		} else if (key_width == 6 && key_height == 1) {
			key_cap="kc_LP_6U";
			kc_stab="stab_6u"
		} else if (key_width == 6.25 && key_height == 1) {
			key_cap="kc_LP_6_25U";
			kc_stab="stab_6_25u"
		} else if (key_width == 7 && key_height == 1) {
			key_cap="kc_LP_7U";
			kc_stab="stab_7u"
		} else if (key_width == 1 && key_height == 1 && key_nub==true) {
			key_cap="kc_LP_1UHB";
		} else {
			key_cap="kc_LP_1U";
		}
		
		if (kc_stab!=="") { kc_stab= "," + kc_stab }

		let key_label="";
		let key_label2="";

		if (use_label_id=="") {
			
			for (let i = 0; i < 12; i++) {
			    let val = key.labels[i];
			    if (val) {
			        key_label=key_label + ' ' + val;
			    }
			}
		} else {
			if (key.labels[use_label_id] != undefined) {
				key_label=key.labels[use_label_id];
			}
		}
		
		key_label2 = key_label.replace(/["]/g, "''"); 

	       	return  ["//" + key_label + "aaaaa",
            [
                [
                	key_x, 
                	side_borderU ? key_y + side_borderU : key_y,
                
                ],
                [
                	key_width,
                	key_height
                ],
                [-key_rotation_angle, key_rotation_x, key_rotation_y,
                ]
            ],
            [
                side_borderU ? "1+" + side_borderU.toString() + "*unit*mm" : 1,
                side_borderD ? "1+" + side_borderD.toString() + "*unit*mm" : 1,
                side_borderL ? "1+" + side_borderL.toString() + "*unit*mm" : 1,
                side_borderR ? "1+" + side_borderR.toString() + "*unit*mm" : 1,
            ],
            ["[false,switch_type,[&quotN&quot,0,0,0,1,2,2,&quotC&quot,0,0],&quot" + key_label2 ] + "&quot," + key_cap + kc_stab + "]"
        ];
    }
)

var file_content =
`include <parameters.scad>
include <stabilizer_spacing.scad>
`

file_content += "\n" + "/* kle_filename: " + kle_filename + " */" + "\n\n"
	
file_content +=
`
/* [Layout Values] */
/* Layout Format (each key):
    [
        [                                       // Location Data
            [x_location, y_location],
            [key_size_width, key_size_height],
            [rotation, rotation_x, rotation_y],
        ],
        [                                       // Borders
            top_border,
            bottom_border,
            left_border,
            right_border
        ],
        extra_data,                            // Extra data (depending on component type)
    ]
*/

/*   Keyswitch Layout
     (extra_data = [
                        rotate_column, 
                        switch_type,
                        [switch angle and height data]
                        keycap legend,
                        keycap type
                   ]
                   
     [switch angle and height data] = srp,rx,ry,h,w,bx,by,bod,offset_x,offset_y
     
     srp(switch rotation position 軸翻轉位置): LU,L,LD,U,N,D,RU,R,RD
                                    LU=Left-Up, RD=Right-Down,N=none,..etc.
     rx(X-axis angle): default 0
     ry(Y-axis angle): default 0
     h(Increase height): default 0
     w{wall thickness}: default 1
     bx((X-axis Base size): default 2
     by((y-axis Base size): default 2

     bod(Base Offset direction 基底偏移方向): C,U,D,L,R,LU,LD,RU,RD
                                 C=Center, LU=Left-Up, RD=Right-Down,..etc.
     offset_x(3D-shaped): default 0
     offset_y(3D-shaped): default 0
     
     keycap type: Please refer to parameters_keycaps.scad
*/
`
file_content += formatted_keys.reduce(
   (total, key) => total + "  " + JSON.stringify(key).replace(/"/g, "") + ",\n",
    "base_switch_layout = [\n"
);

file_content =file_content.replace(/&quot/g, "\"")
file_content =file_content.replace(/aaaaa,/g, "\n")

file_content +=
`];

// MCU Position(s)
base_mcu_layout = [];

// TRRS Position(s)
base_trrs_layout = [];

// Stabilizer layout
//     (extra_data = [key_size, left_offset, right_offset, switch_offset=0])
//     (see stabilizer_spacing.scad for presets)
base_stab_layout = [];

// Via layout
//     (extra_data = [via_width, via_length])
base_via_layout = [];

// Plate Layout (if different than PCB)
//     (extra_data = component_type)
base_plate_layout = [];

// Whether to only use base_plate_layout to generate the plate footprint
use_plate_layout_only = false;

// Standoff layout
//     (extra_data = [standoff_integration_override, standoff_attachment_override])
base_standoff_layout = [];

// EC11 Position(s)
base_ec11_layout = [];

// EVQWGD001 Position(s)
base_evqwgd001_layout = [];

//Microswitch (Reset button)
base_microswitch_layout = [];

// Whether to flip the layout
invert_layout_flag = false;

// Whether the layout is staggered-row or staggered-column
layout_type = "column";  // [column, row]


/* 
   ======================================================
   == PCB keyboardization design /PCB 鍵盤化設計 ========
   ======================================================
*/   

/* Unit size setting / 軸體大小設定

    When designing the PCB keyboardization, what unit_size, h_unit_size 
    and v_unit_size value used. If the <parameters.scad> 
    unit size changes, it can be automatically scaled accordingly.

    PCB 鍵盤化設計時，使用的軸體大小(unit_size, h_unit_size, v_unit_size)
    如<parameters.scad>軸體大小設定有變更時時，讓設計可以跟著縮放
*/
base_pcb_layout_unit_size= 18;
base_pcb_layout_h_unit_size= 18;
base_pcb_layout_v_unit_size= 17;

/* Color marking / 顏色標記

   The location can be marked to make it easier to identify the location during design.
   可以標記位置，讓設計時，較為容易辨識位置
   
    For color codes, please refer to the following link:
    顏色代碼可以參考以下連結:
    https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Transformations#color

    Common colors:
    常用顏色:
    
    Red,Orange,Yellow,Green,Blue,Indigo,Purple
    Pink,Coral,LightYellow,LightGreen,LightBlue,SlateBlue,Violet

*/

base_pcb_layout_outer=[
/* PCB layout outer / PCB板外框位置
    Hull all location by group
    [
    [[x_location, y_location,z_location],circle size,"Color code","Index text"],
    [[x_location, y_location,z_location],circle size,"Color code","Index text"],
    ],
    [
    [[x_location, y_location,z_location],circle size,"Color code","Index text"],
    [[x_location, y_location,z_location],circle size,"Color code","Index text"],
    ],
*/

];

//PCB edge frame setting 
//PCB 邊緣框設定
base_pcb_layout_outer_EdgeFrame_size_x = 8;
base_pcb_layout_outer_EdgeFrame_size_y = 4;
base_pcb_layout_outer_EdgeFrame_hight = 5;

base_pcb_layout_Rubber_Pads=[
/* Concave surface for self-adhesive rubber pads
   圓形自黏膠墊凹槽
    [[location],[cylinder],"Color","Text"],
    =[[ x, y, z ],[diameter,height],"Color code","Index text"],
*/
];

base_pcb_layout_IDC_Hole=[
/* IDC interface opening and dig deep
   IDC 接口 開口與挖深主板 
    [[location],[rotate],[cube],"Color"],
    =[[ x, y, z ],[r_x, r_y, r_x],[c_x, c_y, c_z],"Color code"],
*/
];

base_pcb_layout_IDC=[
/* IDC interface location / IDC 放置位置
    [[translate],[rotate],[cube],"Color"],
    =[[ x, y, z ],[r_x, r_y, r_x],"Show Color"],
*/
];

base_pcb_layout_Cable_Hole=[
/* The interconnecting holes of the raised shaft seat of the PCB board can be used to process the circuit through the bottom through-hole
   挖PCB板的凸起軸座的互通孔道，可用於將線路由底部穿孔的方式處理
    [[location],[rotate],[cube],"Color"],
    [[translate],[rotate],"'color",["Type",[extra data]],"text"],
    "Type"="cylinder" or "cube"
    [extra data] depete type
    =[[ x, y, z ],[r_x, r_y, r_x],"Color code",["cylinder",[c_h, c_r]],"text],
*/

];

base_pcb_layout_Raised_Text=[
/* Write raised text content on the PCB board / 在PCB板上寫上凸起文字內容

    [[location],[rotate],linear_extrude_size,[text_value,text_font,text_size]]
    =[[x, y, z],[r_x, r_y, r_z],LE_size,[text,font,size],"Show Color"]
*/
];

base_pcb_layout_Indented_Text=[
/* Write recessed text content on the PCB board / 在PCB板上寫上內凹文字內容   
    [[location],[rotate],linear_extrude_size,[text_value,text_font,text_size]]
    =[[x, y, z],[r_x, r_y, r_z],LE_size,[text,font,size],"Show Color"]
*/
];

/*
    The dimensions of the virtual key switch and keycaps are used to check whether they interfere with each other key.
    虛擬軸體與鍵帽的尺寸，用來檢查是否會相互干擾

*/

//Switch size 軸體尺寸
//ref: parameters_switchs.scad
VKeySwitch_Size=[KeySwitch[0],KeySwitch[1]];

//Keycaps size 鍵帽尺寸
//ref: parameters_keycaps.scad
VKeycap_Size=kcs_choc_v1;

//Keycaps color and alpha 鍵帽顏色與透明度
VKeycap_Color="DarkKhaki";
VKeycap_Alpha =0.8;

//OLED 相關設定

oled_config = [
/*
    OLED mount configuration settings
    OLED座組態設定
    可以設定多組用於多螢幕情境
*/
 [ // config 0

    //OLED base height
    //基座整體高度
    //oled_base_height=
    10-pcb_thickness,
    
    //OLED Standoff 支撐柱
    //支架高度
    //oled_Standoff_height=
    10-pcb_thickness+2.7,
    
    //OLED Standoff Size (SS) [width1,depth1,height1,width2,depth2]
    //OLED支柱尺寸1(SS方形設定) [第一層長,第一層寬,第一層高度,第二層長,第二層寬]
    //OLED_Standoff_Size_SS=
    [4,4,4,10,10],
    
    //OLED Standoff Size (CS) [width1,width2,height,width3]
    //OLED支柱尺寸2(CS圓柱形設定) [第一層頂部直徑,第一層底部直徑,第一層高度,第二層底部直徑]
    //OLED_Standoff_Size_CS=
    [4,5,3,10],

    //OLED Standoff Base Offset [x,y,z]
    //OLED 支架底部偏移值 [x,y,z]
    //支架如果因傾斜角度拉大而高度變高，z值也要跟著調整
    //OLED_Standoff_Base_Offset_
    // (LU, RU,
    // ,LD, RD)=
    [-6,6,15], [ 6,6,15],
    [ 0,0,10], [ 0,0,10],

    //Pilot_Hole_Size
    //螺絲孔尺寸
    //OLED_Pilot_Hole_Size=[Diameter,Depth]=
    [1.7, 3],
    
    //OLED Standoff type
    //支撐類型 "none","CS","SS"
    //base_pcb_layout_OLED_Standoff_Type=
    "CS",
 ],

];

// OLED Position(s)
//extra_data = [OLED Type,[OLED_Cfg],[RX,RY,RZ],"Color"]
base_OLED_layout = [

];

`;

try {
    const data = saveFile(output_filename, file_content);

} catch (err) {
    console.error(err);
}

async function saveFile(targetName, content) {
    // 1. 檢查檔案是否存在
    const ext = path.extname(targetName);
    const base = path.basename(targetName, ext);
    const folderPath = path.dirname(targetName);
    const NewName = `${base}${ext}`;

    if (fs.existsSync(targetName)) {
        console.log("\n警示：檔案 '${targetName}' 已經存在。\nWarning: File '${targetName}' already exists.");
        
        const answer = await askQuestion("\n請選擇處理方式：(1) 重新命名舊檔案並儲存新檔 (2) 直接覆蓋 [1/2]: \nPlease select an option: (1) Rename existing file and save new one, (2) Overwrite existing file [1/2]:");

        if (answer === '1') {
            // 2. 取得舊檔案的最後修改時間
            const stats = fs.statSync(targetName);
            const mtime = stats.mtime;

            // 格式化時間：例如 20260415_161030
            const timestamp = mtime.getFullYear() +
                String(mtime.getMonth() + 1).padStart(2, '0') +
                String(mtime.getDate()).padStart(2, '0') + "_" +
                String(mtime.getHours()).padStart(2, '0') +
                String(mtime.getMinutes()).padStart(2, '0') +
                String(mtime.getSeconds()).padStart(2, '0');

            // 3. 組合新舊名稱
            const oldFileNewName = `${base}_${timestamp}${ext}`;
            const oldFileFullPath = path.join(folderPath, oldFileNewName);

			dataToAppend = '//include <' + oldFileNewName + '>\n'; 
			
            // 4. 執行更名
            fs.renameSync(targetName, oldFileFullPath);
            console.log("\n已將舊檔案更名為: ${oldFileNewName}\nOld file renamed to: ${oldFileNewName}");
	    } else if (answer === '2') {
            console.log("\n模式：覆蓋現有檔案。\nMode: Overwrite existing file.");
            dataToAppend='';
		} else {
    		console.log("\n非1或2，取消處理!\nInvalid input (not 1 or 2). Operation cancelled!");
    		process.exit(0)
        }
    } else {
        dataToAppend = '//include <' + NewName + '>\n'; 
    }

    // 5. 寫入新檔案
    fs.writeFileSync(targetName, content, 'utf8');
    console.log(`\n成功儲存檔案：${targetName}\nSuccessfully saved file: ${targetName}`);
    
    if (dataToAppend != '') {
 		// 6. 將檔名增加到清單檔案內
		// 我們只存「檔名」而不是「完整路徑」，這樣清單比較簡潔

	    try {
	        // 確保清單檔所在的目錄存在
	        const logDir = path.dirname(layouts_filename);
	        if (!fs.existsSync(logDir)) fs.mkdirSync(logDir, { recursive: true });

	        // 追加寫入
	        fs.appendFileSync(layouts_filename, dataToAppend, 'utf8');
	        console.log("\n已新增 layout：${layouts_filename}至清單\nAdded layout '${layouts_filename}' to the list.");
	        console.log("\n請編輯 layouts.scad 檔案，將需使用的layout列出使用。\nPlease edit layouts.scad and select the layout you want to use."); 
	    } catch (error) {
	        console.error("\n寫入清單失敗:\nFailed to write to the list:", error);
	    }
	    

		const answer2 = await askQuestion("\n是否建立新的參數檔案？[Y/N] \nCreate a new parameter file? [Y/N]");

        if (answer2.toUpperCase() === "Y") {

            const paramNew_filename = "parameter_" + mainName + ".scad";
			
			try {
			    fs.copyFileSync(paramDefault_filename, "../scad_UTP/" + paramNew_filename, fs.constants.COPYFILE_EXCL);
				dataToAppend2 = '//include <' + paramNew_filename + '>\n'; 
			} catch (err) {
			    if (err.code === 'EEXIST') {
			        console.error("\n錯誤：目標檔案: " + paramNew_filename + " 已存在，不執行拷貝。\nError: Target file '${paramNew_filename}' already exists. Skipping copy.");
			    }
			    dataToAppend2 = "";
			}

		} else {
    		console.log("\n不建立新參數檔\nSkipping creation of new parameter file");
    		process.exit(0)
        }

	    if (dataToAppend2 != '') {


		    try {
		        // 追加寫入
		        fs.appendFileSync(params_filename, dataToAppend2, 'utf8');
		        console.log("\n已新增參數檔案：${params_filename}到 params 清單。\nAdded parameter file: '${layouts_filename}' to the list.");
		        console.log("\n請編輯參數清單檔案(parameters.scad)，並選擇所需的參數檔案。\nPlease edit parameters.scad and select the params file you want to use."); 
		    } catch (error) {
		        console.error("\n寫入清單失敗:\nFailed to write to the list:", error);
		    }
		}

    }

    rl.close();
}

// 輔助函式：讓 readline 支援 Promise (可以使用 await)
function askQuestion(query) {
    return new Promise(resolve => rl.question(query, resolve));
}


/**
 * 將檔名存入清單的函式
 * @param {string} newFileName - 剛產生的檔案名稱
 */
function recordFileName(newFileName) {
    try {
        // 確保清單檔案所在的資料夾存在
        const dir = path.dirname(layouts_filename);
        if (!fs.existsSync(dir)) {
            fs.mkdirSync(dir, { recursive: true });
        }

        // 使用 appendFileSync 將檔名追加到檔案末尾
        // \n 確保下一個檔名會從新的一行開始
        fs.appendFileSync(layouts_filename, newFileName + '\n', 'utf8');
        
        console.log("\n[成功] 檔名 '${newFileName}' 已記錄至清單。\n[Success] Recorded '${newFileName}' to the list");
    } catch (err) {
        console.error("\n紀錄清單時發生錯誤：\Error recording list:", err);
    }
}

