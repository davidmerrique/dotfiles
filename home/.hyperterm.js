module.exports = {
  config: {
    fontSize: 18,
    fontFamily: '"Operator Mono", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    termCSS: `
      body {
        font-feature-settings: "liga" 0;
      }
      .cursor-node {
        transition: opacity 0.3s ease-in-out;
      }
    `,
    shell: 'zsh',
    cursorShape: 'BEAM',
    summonShortcut: 'Control+`'
  },
  plugins: [
    'hyperlinks',
    'hyperterm-title',
    'hyperterm-snazzy',
    'hyperterm-summon'
  ],
  localPlugins: []
};
