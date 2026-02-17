
/*
https://es.aliexpress.com/item/1005006365845676.html
 I2C OLED Display Module 0.91 Inch I2C SSD1306 OLED Display Module 
 White / BLUE I2C OLED Screen Driver DC 3.3V~5V for Arduino
 
Note:
Do not reverse VCC and GND. This will cause damage to the OLED display.

Pin Description:
GND: Power Ground
VCC: Power + (DC 3.3 ~5v)
SCL: Clock Line
SDA: Data Line

Specification:
Model: SH-S091
Screen size: 0.91 inch
Interface: IIC
The main chip is: SSD1306;
Operating voltage: 3.3V~5.0V power supply.
Working Temperature: -30 degrees ~ 70 degrees
Display area: 22.384 x 5.584 (mm)
Physical size: 38 x 12 (mm)
Pixel size: 0.159 x 0.159 (mm)
Pixel pitch: 0.175 x 0.175 (mm)
Interface Type: IIC Interface
*/

//OLED PCB Size [width,depth,height]
//OLED PCB 尺寸
OLED_Size=[12,38,2.8];

//OLED PCB Hole Distancia [x,y]
//OLED PCB 四個鎖孔間距
OLED_Hole_Distancia=[23.5,23.5];

//OLED PCB Hole Size 
//OLED PCB板鎖孔尺寸
OLED_Hole_Size=2.1;

//OLED PCB 位置偏移(與PIN位置)
OLED_Translate_Offset=[0,-0.7,0];

//OLED Standoff Offset [x,y]
//OLED 支架整體偏移值 [x,y]
OLED_Standoff_Offset=[0,1.4];