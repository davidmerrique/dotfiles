module.exports = {
  config: {
    fontSize: 18,
    fontFamily: '"Operator Mono", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    termCSS: `
      body {
        font-feature-settings: "liga" 0;
      }
    `,
    shell: 'zsh',
    cursorShape: 'BEAM',
    summonShortcut: 'Control+`'
  },
  plugins: [
    'hyperterm-title',
    'hyperterm-snazzy',
    'hyperterm-summon',
    'hyperline'
  ],
  localPlugins: []
};
