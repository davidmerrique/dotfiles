#!/usr/bin/env node

'use strict';

const path = require('path');
const sharp = require('sharp');
const program = require('commander');

function list(val) {
  return val.split(' ').map(n => parseInt(n, 10));
}

program
  .usage('[options] <file ...>')
  .option('-q, --quality <n>', 'Image Quality', parseInt)
  .option('-s, --sizes <items>', 'Image Sizes to Generate', list)
  .parse(process.argv);

const file = program.args[0];
const sizes = program.sizes || [];
const quality = program.quality || 80;

if (file && sizes && sizes.length) {
  for (let size of sizes) {
    const filepath = path.resolve(file);
    const filedest = `${path.dirname(filepath)}/${path.basename(filepath, path.extname(filepath))}-${size}${path.extname(filepath)}`;
    sharp(filepath)
      .resize(size)
      .quality(quality)
      .toFile(filedest, err => {
        if (!err) {
          console.log(`Wrote ${filedest}`);
        }
      })
  }
}
