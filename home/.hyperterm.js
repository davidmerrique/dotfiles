module.exports = {
  config: {
    fontSize: 18,
    fontFamily: '"Operator Mono", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
    termCSS: `
      .cursor-node {
        transition: opacity 0.3s ease-in-out;
      }
    `,
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
      unique: true
    }
  },
  plugins: [
    'hyperlinks',
    // 'hyperterm-visor',
    'hyperterm-overlay',
    'hyperterm-title',
    'hyperterm-snazzy',
    'hyperterm-blink',
    'hyperterm-final-say'
  ],
  localPlugins: []
};
