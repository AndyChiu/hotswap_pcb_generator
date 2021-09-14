const kle = require("@ijprest/kle-serial");
const fs = require("fs")
const util = require("util")


var kle_filename = process.argv[2] ?? "layout.json";
var output_filename = process.argv[3] ?? kle_filename + ".csv";

try {
    var kle_json = fs.readFileSync(kle_filename, "UTF-8");
} catch (err) {
    console.error(err);
}

var keyboard = kle.Serial.parse(kle_json);

//key.labels[4]

var formatted_keys = keyboard.keys.map(
    key => {
        return  [
        	[
            	key.x, key.y, key.width, key.height, key.x2, key.y2, key.width2, key.height2,
                key.rotation_angle, key.rotation_x, key.rotation_y,
                "&quot" + key.labels[0] + "&quot",
                "&quot" + key.labels[1] + "&quot",
                "&quot" + key.labels[2] + "&quot",
                "&quot" + key.labels[3] + "&quot",
                "&quot" + key.labels[4] + "&quot",
                "&quot" + key.labels[5] + "&quot",
                "&quot" + key.labels[6] + "&quot",
                "&quot" + key.labels[7] + "&quot",
                "&quot" + key.labels[8] + "&quot",
                "&quot" + key.labels[9] + "&quot",
                "&quot" + key.labels[10] + "&quot",
                "&quot" + key.labels[11] + "&quot"
            ]
        ];
    }
)

var file_content = "key_x, key_y, key_width, key_height, key_x2, key_y2, key_width2, key_height2, key_rotation_angle, key_rotation_x, key_rotation_y, key_labels_0, key_labels_1, key_labels_2, key_labels_3, key_labels_4, key_labels_5, key_labels_6, key_labels_7, key_labels_8, key_labels_9, key_labels_10, key_labels_11\n"
	
file_content += formatted_keys.reduce(
   (total, key) => total + key + ",\n",""
);

file_content =file_content.replace(/&quotundefined&quot/g, "")
file_content =file_content.replace(/&quot/g, "\"")
	
try {
    const data = fs.writeFileSync(output_filename, file_content);
} catch (err) {
    console.error(err);
}
