# 3D列印鍵盤熱插拔板產生器（網路線內芯線版本）

[原作者GitHub: 3D-Printable Hotswap Keyboard PCB Generator](https://github.com/50an6xy06r6n/hotswap_pcb_generator)

此專案為利用3D印表機，列印鍵盤底板、定位板、外殼..等部份來建構鍵盤，由於原作者使用22AWG電源線當主要線路，而我手邊有許多的廢棄網路線，所以就改用網路線內芯進行調整。

依照網路線內芯線的特性，修改了不少 switch.scad 的部份，主要是線材細，可以放入二極體，另外也添加了不少種類的軸體，以及MCU等額外鍵盤用零件。


### 額外特性
- 支援多種軸體：Cherry MX-style、MX Low profile、Kailh Choc V1、Choc V2、Choc Mini，Gateron KS27、Romer G、Redragon low profile。
- 單PCB可以放上多種不同軸體，layout.scad可以進行調整。
- 支援多種MCU：ProMicro、ProMicro C、Elite C、Pico RP2040、RP2040 Zero。
- 支援編碼器：EC11、EVQWGD001。
- Choc V2 矮軸可以使用MX規格的衛星軸（穩定器)。
- 支援4pin微動開關(microswitch)。
- PCB板可針對外框進行設計，讓PCB板直接當作鍵盤使用。
- Choc V1軸與MX軸有從PCB板上開啟固定架的選項可用，用於固定軸體，代替定位板的作用。

### 曲面鍵盤設計
- 方式1: [UC36系列](https://github.com/AndyChiu/UC36)中，曲面鍵盤的相關程式與檔案，可由此[查閱](scad_UTP/Curved_PCB_KB)。
- 方式2: PCB板直接可以設定軸體的角度與高度，達到曲面鍵盤的效果。

### 限制
因目前著重在Kailh Choc矮軸的使用開發，因矮軸上PCB板後高度較低，較不易被撥動掉落，所以定位板、底板、外殼、墊高都沒有跟著調整，主要是PCB主板印出來，直接裝上軸體使用，所以除了pcb.scad外，其他部份使用上可能會有點問題。

### 資料夾/檔案命名
由於對GitHub作業還不是很熟悉，且自己的改動太多，所以不好直接更動原作者的檔案，因此目前先把自己處理的檔案與資料夾，後綴都加上UTP，相關程式也有調整。

### 元件圖片

#### 軸座 (Switch base)

##### Cherry
| MX-style | MX Low profile |
| -------- | -------- | 
| ![MX](img_UTP/switch_mx.png)|![MX_Low](img_UTP/switch_mx_low.png)|

##### Kailh Choc
| Choc V1 | Choc V2 | Choc Mini |
| -------- | -------- | -------- | 
| ![choc](img_UTP/switch_choc.png)|![chocV2](img_UTP/switch_chocV2.png)|![chocMini](img_UTP/switch_chocMini.png)|

##### Other
| Gateron KS27 | Romer G | Redragon low profile |
| -------- | -------- | -------- | 
| ![ks27](img_UTP/switch_ks27.png)|![Romer G](img_UTP/switch_romer_g.png)|![redragon_low](img_UTP/redragon_low.png)|

##### 軸座含固定架
| Cherry MX-style | Kailh Choc V1 |
| -------- | -------- |
| ![switch_mx_holder](img_UTP/switch_mx_holder.png)|![switch_choc_holder](img_UTP/switch_choc_holder.png)|

##### Dactyl類型使用的1U PCB
| Kailh Choc V2  |
| -------- |
| ![switch_chocV2_1u](img_UTP/switch_chocV2_1u.png)|

#### MCU

##### ProMicro

| ProMicro|ProMicro-C|Elite-C|
| -------- | -------- | -------- |
| ![mcu_ProMicro.png](img_UTP/mcu_ProMicro.png)|![mcu_ProMicro_C.png](img_UTP/mcu_ProMicro_C.png)|![mcu_Elite_C.png](img_UTP/mcu_Elite_C.png)|

##### RP2040

| RP2040 Pico|RP2040 Zero|
| -------- |-------- |
| ![mcu_RP2040_Pico](img_UTP/mcu_RP2040_Pico.png)| ![mcu_RP2040_Zero](img_UTP/mcu_RP2040_Zero.png)|


#### 編碼器(Encoder)

|EC11|EVQWGD001|
| -------- |-------- |
|![EC11](img_UTP/EC11.png)|![EVQWGD001](img_UTP/EVQWGD001.png)|

#### 穩定器(Stabilizer)

|PCB(2u)|PCB Choc V2(2u)|Plate(2u)|
| -------- | -------- | -------- |
|![stabilizer_pcb(2u)](img_UTP/stabilizer_pcb(2u).png)|![stabilizer_pcb_ChocV2(2u)](img_UTP/stabilizer_pcb_ChocV2(2u).png)|![stabilizer_plate(2u)](img_UTP/stabilizer_plate(2u).png)|

#### TRRS
|PJ320A|PJ324M|
| -------- | -------- |
|![trrs_pj320a.png](img_UTP/trrs_pj320a.png)|![trrs_pj320a.png](img_UTP/trrs_pj324m.png)|

#### 其他
|Micro Switch|
| -------- |
|![microswitch.png](img_UTP/microswitch.png)|


### 設計
可以優先參考原作者[設計指南(Design Guide)](https://github.com/50an6xy06r6n/hotswap_pcb_generator/blob/main/guide/design_guide.md)

修改版本的前期設計請參考（撰寫中）。

### 組裝
請參閱以下Blog:

[嘗試Choc V2矮軸與拉線教學](https://ie321mx.blogspot.com/2021/09/choc-v2.html)

[關於二極體版本的補充教學](https://ie321mx.blogspot.com/2021/09/blog-post.html)

原作者的[組裝指南(Build Guide)](https://github.com/50an6xy06r6n/hotswap_pcb_generator/blob/main/guide/build_guide.md)

### 照片集
PCB板設計時，可以直接設計成曲面
![PCB KB Curve Design1](https://github.com/AndyChiu/hotswap_pcb_generator/assets/1038943/88231095-c524-4259-bd4f-2d6100bf90d0)
![PCB KB Curve Design2](https://github.com/AndyChiu/hotswap_pcb_generator/assets/1038943/6479dd1b-d6f8-4ab8-b8cf-6f1a796fc83b)

印出的PCB曲面鍵盤
![GMvE2cgXMAA4j0y](https://github.com/AndyChiu/hotswap_pcb_generator/assets/1038943/f525d89a-75df-4152-8a4d-fab229edecbf)

上軸體與鍵帽後
![GMvKBvrWIAEK0nz](https://github.com/AndyChiu/hotswap_pcb_generator/assets/1038943/d59ee837-e23f-4b93-b5f4-c3c55fd7a036)
![GMvKBzpXUAAMyPL](https://github.com/AndyChiu/hotswap_pcb_generator/assets/1038943/f2f767ab-b060-4370-8da1-856eb54d79c8)
![GMvKB7nXAAAX0QT](https://github.com/AndyChiu/hotswap_pcb_generator/assets/1038943/fbc1e343-561e-4b8e-8903-3e6760b4104f)


改良的EC11編碼器底座
![EC11 Base](https://github.com/AndyChiu/hotswap_pcb_generator/assets/1038943/c44865c3-b339-4316-93d8-a0f1fa3c9cf8)

UC2 鍵盤 Choc V1 軸體 左手
![UC2 Left Hand](img_UTP/_20210910_013504.JPG)

UC2 鍵盤 Choc V1 軸體 右手
![UC2 Right Hand](img_UTP/_20210910_013603.JPG)

EVQWGD001 編碼器
![EVQWGD001](img_UTP/_20210911_210522.JPG)

Choc V1 + V2 軸共用座
![Choc V1 + V2 Base](img_UTP/_20210911_210554.JPG)

二極體接線後的狀態
![Diode on Base](img_UTP/_20210911_211148.JPG)

二極體接線後的狀態 背面
![Diode on Base back side](img_UTP/_20210911_211209.JPG)
