module.exports = {
  config: {
    shell: 'zsh',
    cursorShape: 'BEAM',
    copyOnSelect: true,
    colors: {},
    summonShortcut: 'Control+`',
    hyperlinks: {
      defaultBrowser: true
    }
  },
  plugins: [
    'hypercwd',
    'hyperlinks',
    'hyperterm-summon',
    'hyper-statusline',
    'hyperterm-paste',
  ],
  localPlugins: [
    'vibrancy'
  ]
};
