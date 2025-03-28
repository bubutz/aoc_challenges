const fs = require("fs");

function checkfile(file_path) {
  if (!fs.existsSync(file_path)) {
    console.error(`File "${file_path}" does not exists.`);
    process.exit(1);
  }
}

function main() {
  if (process.argv[2] === undefined) {
    console.error(`Data file not specified.`);
    process.exit(1);
  } else {
    const inputfile = process.argv[2]; // 2 is the first argv
    checkfile(inputfile);
  }
}

if (typeof module !== "undefined" && !module.parent) {
  main();
}
