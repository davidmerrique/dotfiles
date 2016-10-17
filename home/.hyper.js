module.exports = {
  config: {
    fontSize: 18,
    fontFamily: '"Fira Code", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    backgroundColor: 'rgba(40, 42, 54, 0.8)',
    termCSS: `
      body {
        font-feature-settings: "liga" 0;
      }
    `,
    shell: 'zsh',
    cursorShape: 'BEAM',
    summonShortcut: 'Control+`',
    copyOnSelect: true
  },
  plugins: [
    'hyperterm-title',
    'hyperterm-snazzy',
    'hyperterm-summon'
  ],
  localPlugins: []
};
