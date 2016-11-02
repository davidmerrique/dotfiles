const backgroundColor = '#252526';
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

module.exports = {
  config: {
    colors,
    backgroundColor,
    foregroundColor,
    borderColor: '#222430',
    cursorColor: '#97979b',
    fontSize: 18,
    fontFamily: '"Fira Code", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    termCSS: `
      x-screen x-row {
        font-variant-ligatures: initial;
      }
    `,
    shell: 'zsh',
    cursorShape: 'BEAM',
    copyOnSelect: true,
    summonShortcut: 'Control+`',
    hyperClean: {
      hideFirstTabBorder: true
    }
  },
  plugins: [
    'hypercwd',
    'hyperclean',
    'hyperterm-title',
    'hyperterm-summon'
  ],
  localPlugins: []
};