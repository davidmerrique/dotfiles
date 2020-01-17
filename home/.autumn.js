/**
 * Welcome to Autumn!
 * Here's some sample code to get you started.
 * Click the Play button to try it out!
 */

alert('Running Autumn!');

const cmdOptCtrl: ModString[] = ['command', 'option', 'control'];
const cmdOptShift: ModString[] = ['command', 'option', 'shift'];

Hotkey.activate(cmdOptCtrl, 'f', () => {
  Window.focusedWindow().maximize();
});

Hotkey.activate(cmdOptCtrl, 'c', () => moveToPercent(0.75));
Hotkey.activate(cmdOptCtrl, 'v', () => moveToPercent(0.6));
Hotkey.activate(cmdOptCtrl, 'b', () => moveToPercent(0.5));

function moveToPercent(percent) {
  Window.focusedWindow().moveToPercentOfScreen({
    x: (1 - percent) / 2,
    y: (1 - percent) / 2,
    width: percent,
    height: percent
  });
}

function moveToUnit(x, y, width, height) {
  Window.focusedWindow().moveToPercentOfScreen({
    x,
    y,
    width,
    height
  });
}

Hotkey.activate(cmdOptCtrl, 'up', () => moveToUnit(0, 0, 1, 0.5));
Hotkey.activate(cmdOptCtrl, 'down', () => moveToUnit(0, 0.5, 1, 0.5));
Hotkey.activate(cmdOptCtrl, 'left', () => moveToUnit(0, 0, 0.5, 1));
Hotkey.activate(cmdOptCtrl, 'right', () => moveToUnit(0.5, 0, 0.5, 1));

Hotkey.activate(cmdOptShift, 'up', () => moveToUnit(0, 0, 0.5, 0.5));
Hotkey.activate(cmdOptShift, 'down', () => moveToUnit(0.5, 0.5, 0.5, 0.5));
Hotkey.activate(cmdOptShift, 'left', () => moveToUnit(0, 0.5, 0.5, 0.5));
Hotkey.activate(cmdOptShift, 'right', () => moveToUnit(0.5, 0, 0.5, 0.5));
