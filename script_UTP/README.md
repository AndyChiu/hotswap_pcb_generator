# KLE檔案轉換腳本 (KLE Conversion Script)

### 系統需求
需要安裝node.js v14以上版本

### 安裝方式 Install Dependencies

Windows:
```
install.bat
```
PS: 如有出現 npm 程式有更新，可以依照說明，使用 npm audit fix 來更新 npm

非Windows系統，請於命令列執行:
```
npm install
cd node_modules\@ijprest
npm install
cd ..\..\
```

### 執行腳本 Run script

#### 產生layout.scad:
預設為輸入檔名為 `layout.json`，輸出檔名為 `scad/layout.scad`，可以依照需求手動指定輸入與輸出檔名:
```
npm start -- <layout json file> <optional output filename>
```
#### 產生 .csv 檔案:
預設為輸入檔名為 `layout.json`，輸出檔名為原本檔名加上".csv"結尾，可以依照需求手動輸入layout檔名:
```
node Convert2csv.js <layout json file>
```

### 注意

如果輸出檔案已存在，將會覆蓋檔案，不會另外提醒，如已存在檔案，請先改檔名或者搬移到其他地方，然後再執行腳本。
