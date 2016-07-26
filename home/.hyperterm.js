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
    overlay: {
      animate: false,
      alwaysOnTop: true,
      hasShadow: false,
      hideOnBlur: false,
      hideDock: false,
      hotkeys: ['Control+`'],
      resizable: true,
      position: 'top',
      primaryDisplay: true,
      startup: true,
      size: 0.4,
      tray: true,
      unique: false
    }
  },
  plugins: [
    'hyperlinks',
    // 'hyperterm-visor',
    'hyperterm-overlay',
    'hyperterm-title',
    'hyperterm-snazzy',
    'hyperterm-final-say'
  ],
  localPlugins: []
};
