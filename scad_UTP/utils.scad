include <parameters.scad>
include <default_layout.scad>
include <layout.scad>
include <stabilizer_spacing.scad>


// Determine whether to invert the layout
switch_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_switch_layout, false))
    : set_defaults(base_switch_layout, false);
plate_layout_final = [
    for (group = base_plate_layout)
        invert_layout_flag
            ? invert_layout(set_defaults(group, ["switch"]))
            : set_defaults(group, ["switch"])
];
mcu_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_mcu_layout))
    : set_defaults(base_mcu_layout);
trrs_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_trrs_layout))
    : set_defaults(base_trrs_layout);
stab_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_stab_layout))
    : set_defaults(base_stab_layout, 2u);
standoff_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_standoff_layout, standoff_config_default))
    : set_defaults(base_standoff_layout, standoff_config_default);
via_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_via_layout, via_shape))
    : set_defaults(base_via_layout, via_shape);
ec11_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_ec11_layout))
    : set_defaults(base_ec11_layout);
evqwgd001_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_evqwgd001_layout))
    : set_defaults(base_evqwgd001_layout);
microswitch_layout_final = invert_layout_flag
    ? invert_layout(set_defaults(base_microswitch_layout))
    : set_defaults(base_microswitch_layout);

// Moves the flat part to the top if layout is row-staggered so column wires
// can be routed. PCB should be printed upside down in this case.
border_z_offset =
    layout_type == "column"
    ? -1
    : layout_type == "row"
        ? 1
        : assert(false, "layout_type parameter is invalid");

// Tweaks to make wire channels connect properly depending on the key alignment
row_cutout_length =
    layout_type == "column"
//    ? h_unit+1
    ? 1000
    : layout_type == "row"
        ? 1000
        : assert(false, "layout_type parameter is invalid");

col_cutout_length =
    layout_type == "column"
    ? 1000
    : layout_type == "row"
        ? 1000
        : assert(false, "layout_type parameter is invalid");

switch_rotation =
    switch_orientation == "south"
    ? 0
    : switch_orientation == "north"
        ? 180
        : assert(false, "switch_orientation is invalid");

// Useful for manipulating layout elements
function slice(array, bounds, extra_data_override="") = [
    let(
        lower = bounds[0] >= 0 ? bounds[0] : max(len(array)+bounds[0], 0),
        upper = bounds[1] > 0 ? min(bounds[1], len(array)) : len(array)+bounds[1],
        step = len(bounds) == 3 ? bounds[2] : 1
    )
    for (i = [lower:step:upper-1])
       (len(array[i]) >= 2 && extra_data_override != "")
            ? [array[i][0], array[i][1], extra_data_override, array[i][3]]
            : array[i]
];

function set_defaults(layout, extra_data_default=[]) = [
    for (item = layout)
        let(
            location = len(item[0]) == 3
                ? item[0]
                : len(item[0]) == 2
                    ? [item[0][0],item[0][1],[0,0,0]]
                    : [item[0][0],1,[0,0,0]],
            borders = len(item) >= 2
                ? item[1]
                : [1,1,1,1],
            extra_data = len(item) == 3
                ? item[2]
                : extra_data_default
        )
        [
            location,
            borders,
            extra_data
        ]
];

function invert_borders(borders, invert=true) =
    invert
        ? [borders[0], borders[1], borders[3], borders[2]]
        : borders;

function invert_layout(layout) = [
    for (item = layout)
        let(
            location = item[0],
            borders = item[1],
            extra_data = item[2]
        )
        [
            [
                [-location[0][0]-location[1], location[0][1]],
                location[1],
                [-location[2][0], -location[2][1], location[2][2]],
            ],
            invert_borders(borders),
            extra_data
        ]
];

module layout_pattern(layout) {
    union() {
        for (item = layout) {
            location = item[0];
            $borders = item[1];
            $extra_data = item[2];

            switch_offset = (location[1]-1)/2;  // Coordinate offset based on key shape

            translate([location[2][1]*h_unit,-location[2][2]*v_unit,0]) {
                rotate([0,0,location[2][0]]) {
                    translate([(location[0][0]-location[2][1]+switch_offset)*h_unit,
                               (location[2][2]-location[0][1])*v_unit,
                               0]) {
                        children();
                    }
                }
            }
        }
    }
}

module border(base_size, borders, thickness, h_unit=1, v_unit=1) {
    linear_extrude(thickness, center=true)
        border_footprint(base_size, borders, h_unit, v_unit);
}

module border_footprint(base_size, borders, h_unit=1, v_unit=1) {
    translate([
        h_unit/2 * (borders[3] - borders[2]),
        v_unit/2 * (borders[0] - borders[1]),
        0
    ]) {
        square([
            base_size[0]+h_unit*(borders[2]+borders[3])+0.001,
            base_size[1]+v_unit*(borders[0]+borders[1])+0.001
        ], center=true);
    }
}


// 曲面倒角
module chamfer(length,width,height) {
    $fn=40;
    translate([-length/2,-width/2,height/2]) {
        rotate([0,90.0]) {
            resize([height,width,length]) {
            difference(){
            cube([2,2,10]);
            cylinder(h=10*2,r=2,center=true);
            }
            }
        }
    }
}

//直角三角形
module right_triangle(length, width, height,rx=0,ry=0,rz=0) {

    points = [
        [0, 0],
        [length, 0],
        [0, height]
    ];
    translate([-length/2,-width/2,-height/2]) {
    rotate([90+rx,0+ry,0+rz]) {
    linear_extrude(width,center=true) {
        polygon(points);
    }
    }
}
}

