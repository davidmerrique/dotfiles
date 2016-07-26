module.exports = {
  config: {
    fontSize: 18,
    fontFamily: '"Operator Mono", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    visor: {
      hotkey: 'Control+`',
      position: 'top'
    },
    shell: 'zsh'
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