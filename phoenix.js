var mash = ['cmd', 'alt', 'ctrl']
var mashShift = ['shift', 'alt', 'cmd']
var margin = 20

function moveWindow (win, callback) {
  var frame = win.screen().frameWithoutDockOrMenu()
  if (callback) {
    callback(frame)
  }
  win.setFrame(frame)
}

function moveFocusedWindowOn (key, modifiers, callback) {
  api.bind(key, modifiers, function () {
    moveWindow(Window.focusedWindow(), callback)
  })
}

function moveToScreen (win, screen) {
  if (!screen) {
    return
  }

  var frame = win.frame()
  var oldScreenRect = win.screen().frameWithoutDockOrMenu()
  var newScreenRect = screen.frameWithoutDockOrMenu()

  var xRatio = newScreenRect.width / oldScreenRect.width
  var yRatio = newScreenRect.height / oldScreenRect.height

  win.setFrame({
    x: (Math.round(frame.x - oldScreenRect.x) * xRatio) + newScreenRect.x,
    y: (Math.round(frame.y - oldScreenRect.y) * yRatio) + newScreenRect.y,
    width: Math.round(frame.width * xRatio),
    height: Math.round(frame.height * yRatio)
  })
}

// Split Screen Actions
moveFocusedWindowOn('up', mash, function (frame) {
  frame.x += margin
  frame.y += margin
  frame.width -= margin * 2
  frame.height = (frame.height / 2) - margin * 1.5
})
moveFocusedWindowOn('down', mash, function (frame) {
  frame.x += margin
  frame.y += (frame.height / 2) + margin / 2
  frame.width -= margin * 2
  frame.height = (frame.height / 2) - margin * 1.5
})
moveFocusedWindowOn('left', mash, function (frame) {
  frame.x += margin
  frame.y += margin
  frame.width = (frame.width / 2) - margin * 1.5
  frame.height -= margin * 2
})
moveFocusedWindowOn('right', mash, function (frame) {
  frame.x += (frame.width / 2) + margin / 2
  frame.y += margin
  frame.width = (frame.width / 2) - margin * 1.5
  frame.height -= margin * 2
})

// Quarter Screen (Quadrant) Actions
moveFocusedWindowOn('right', mashShift, function (frame) {
  frame.x += frame.width / 2 + margin / 2
  frame.y += margin
  frame.width = (frame.width / 2) - margin * 1.5
  frame.height = (frame.height / 2) - margin * 1.5
})
moveFocusedWindowOn('left', mashShift, function (frame) {
  frame.x += margin
  frame.y += (frame.height / 2) + margin / 2
  frame.width = (frame.width / 2) - margin * 1.5
  frame.height = (frame.height / 2) - margin * 1.5
})
moveFocusedWindowOn('up', mashShift, function (frame) {
  frame.x += margin
  frame.y += margin
  frame.width = (frame.width / 2) - margin * 1.5
  frame.height = (frame.height / 2) - margin * 1.5
})
moveFocusedWindowOn('down', mashShift, function (frame) {
  frame.x += frame.width / 2 + margin / 2
  frame.y += frame.height / 2 + margin / 2
  frame.width = (frame.width / 2) - margin * 1.5
  frame.height = (frame.height / 2) - margin * 1.5
})

// Other Actions
moveFocusedWindowOn('m', mash, function (frame) {
  frame.width -= margin * 2
  frame.height -= margin * 2
  frame.x += margin
  frame.y += margin
})
moveFocusedWindowOn('c', mash, function (frame) {
  frame.width *= 0.75
  frame.height *= 0.75
  frame.x += frame.width * 0.15
  frame.y += frame.height * 0.15
})

api.bind('right', ['ctrl', 'alt'], function () {
  var win = Window.focusedWindow()
  moveToScreen(win, win.screen().nextScreen())
})

api.bind('left', ['ctrl', 'alt'], function () {
  var win = Window.focusedWindow()
  moveToScreen(win, win.screen().previousScreen())
})
