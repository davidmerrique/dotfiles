const backgroundColor = 'rgba(0,0,0,0.6)';
const foregroundColor = '#eff0eb';
const red = '#ff5c57';
const green = '#5af78e';
const yellow = '#f3f99d';
const blue = '#57c7ff';
const magenta = '#ff6ac1';
const cyan = '#9aedfe';
const white = '#f1f1f0';
const lightBlack = '#686868';

const colors = {
  black: backgroundColor,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
  lightBlack,
  lightRed: red,
  lightGreen: green,
  lightYellow: yellow,
  lightBlue: blue,
  lightMagenta: magenta,
  lightCyan: cyan,
  lightWhite: foregroundColor
};

module.exports.onWindow = browserWindow => browserWindow.setVibrancy('ultra-dark');

module.exports.decorateConfig = (cfg) => {
  const config = Object.assign({}, cfg, {
    colors,
    backgroundColor,
    foregroundColor,
    borderColor: '#222430',
    cursorColor: '#97979b',
    fontSize: 18,
    fontFamily: '"Fira Code", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace'
  });
  return config;
}