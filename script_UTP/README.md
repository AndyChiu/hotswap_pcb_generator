# KLE Conversion Script

### Prerequisites
This script requires node.js 14+ to be installed on your system.

### Install Dependencies
```
npm install
```

### Run script
Defaults to using `layout.json` and outputs to `scad/layout.scad`:
```
npm start -- <layout json file> <optional output filename>
```

### Tips

The script currently doesn't support keys that are not 1u in height. If you need a vertical key, make it as a horizontal key and rotate it 90 degrees.

### Troubleshooting

When running `npm start` for the first time, you may get this error:
```
Error: Cannot find module '.../hotswap_pcb_generator/script/node_modules/@ijprest/kle-serial/dist/index.js'. Please verify that the package.json has a valid "main" entry
```
If you see this, run `npm install` from inside the `kle-serial` directory. Tracking this issue [here](https://github.com/50an6xy06r6n/hotswap_pcb_generator/issues/1).