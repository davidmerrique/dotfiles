module.exports = {
  config: {
    shell: 'zsh',
    cursorShape: 'BEAM',
    copyOnSelect: true,
    summonShortcut: 'Control+`'
  },
  plugins: [
    'hypercwd',
    'hyperterm-title',
    'hyperterm-summon'
  ],
  localPlugins: [
    'vibrancy'
  ]
};
