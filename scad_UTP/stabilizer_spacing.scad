include <parameters.scad>

// Stabilizer spacing for common key sizes, measured center-to-center
// Format is [key_size, left_offset, right_offset, switch_offset=0]
// Key size is measured in units, offsets are measured in mm from center
// 常用鍵大小的穩定器間距，中心到中心測量
// 格式為[key_size, left_offset, right_offset, switch_offset=0]
// 鍵大小以單位為單位，偏移量以距離中心的毫米為單位

2u = [2, 5/8*unit_stb, 5/8*unit_stb];  // [11.938, 11.938], 1.25u total spacing
2_25u = [2.25, 5/8*unit_stb, 5/8*unit_stb];
2_5u = [2.5, 5/8*unit_stb, 5/8*unit_stb];
2_75u = [2.75, 5/8*unit_stb, 5/8*unit_stb];
3u = [3, 1*unit_stb, 1*unit_stb];  // [19.05, 19.05], 2u total spacing
6u = [6, 2.5*unit_stb, 2.5*unit_stb];  // [47.625, 47.625], 5u total spacing
6u_offset = [6, 3*unit_stb, 2*unit_stb, 0.5*unit_stb];  // [57.15, 38.1], 5u total spacing
6_25u = [6.25, 2.625*unit_stb, 2.625*unit_stb];  // [49.8475, 49.8475], 5.25u total spacing
6_25u_offset = [6.25, 3.25*unit_stb, 2*unit_stb, 0.625*unit_stb];  // [61.9125, 38.1], 5.25u total spacing
6_25u_narrow = [6.25, 40, 40];  // 80mm total spacing
7u = [7, 3*unit_stb, 3*unit_stb];  // [57.15, 57.15]

