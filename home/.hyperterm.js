module.exports = {
  config: {
    fontSize: 18,
    fontFamily: '"Operator Mono", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    visor: {
      hotkey: 'Control+`',
      position: 'top'
    },
  },
  plugins: [
    'hyperlinks',
    'hyperterm-visor',
    'hyperterm-dracula'
  ],
  localPlugins: []
};
