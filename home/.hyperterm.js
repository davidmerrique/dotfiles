module.exports = {
  config: {
    fontSize: 18,
    fontFamily: '"Operator Mono", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    shell: 'zsh',
    cursorShape: 'BEAM',
    visor: {
      hotkey: 'Control+`',
      position: 'top'
    },
  },
  plugins: [
    'hyperlinks',
    'hyperterm-visor',
    'hyperterm-title',
    'hyperterm-snazzy',
    'hyperterm-final-say'
  ],
  localPlugins: []
};
