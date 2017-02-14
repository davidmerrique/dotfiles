module.exports = {
  config: {
    shell: 'zsh',
    cursorShape: 'BEAM',
    copyOnSelect: true,
    colors: {},
    summonShortcut: 'Control+`',
    hyperlinks: {
      clickAction: 'ignore',
      defaultBrowser: true
    }
  },
  plugins: [
    'hypercwd',
    'hyperlinks',
    'hyper-blink',
    'hyperterm-summon',
    'hyper-statusline',
    'hyperterm-paste',
  ],
  localPlugins: [
    'vibrancy'
  ]
};
