var margin = 20

S.cfga({
  'defaultToCurrentScreen': true,
  'secondsBetweenRepeat': 0.1,
  'checkDefaultsOnLoad': true,
  'focusCheckWidthMax': 3000
})

// Create Operations
var topLeft = S.operation('move', {
  'x': 'screenOriginX+' + margin,
  'y': 'screenOriginY+' + margin,
  'width': 'screenSizeX/2-' + margin * 1.5,
  'height': 'screenSizeY/2-' + margin * 1.5
})

var topRight = S.operation('move', {
  'x': 'screenOriginX+screenSizeX/2+' + margin / 2,
  'y': 'screenOriginY+' + margin,
  'width': 'screenSizeX/2-' + margin * 1.5,
  'height': 'screenSizeY/2-' + margin * 1.5
})

var bottomRight = S.operation('move', {
  'x': 'screenOriginX+screenSizeX/2+' + margin / 2,
  'y': 'screenOriginY+screenSizeY/2+' + margin / 2,
  'width': 'screenSizeX/2-' + margin * 1.5,
  'height': 'screenSizeY/2-' + margin * 1.5
})

var bottomLeft = S.operation('move', {
  'x': 'screenOriginX+' + margin,
  'y': 'screenOriginY+screenSizeY/2+' + margin / 2,
  'width': 'screenSizeX/2-' + margin * 1.5,
  'height': 'screenSizeY/2-' + margin * 1.5
})

var pushRight = S.operation('move', {
  'x': 'screenOriginX+screenSizeX/2+' + margin / 2,
  'y': 'screenOriginY+' + margin,
  'width': 'screenSizeX/2-' + margin * 1.5,
  'height': 'screenSizeY-' + margin * 2
})

var pushLeft = S.operation('move', {
  'x': 'screenOriginX+' + margin,
  'y': 'screenOriginY+' + margin,
  'width': 'screenSizeX/2-' + margin * 1.5,
  'height': 'screenSizeY-' + margin * 2
})

var pushTop = S.operation('move', {
  'x': 'screenOriginX+' + margin,
  'y': 'screenOriginY+' + margin,
  'width': 'screenSizeX-' + margin * 2,
  'height': 'screenSizeY/2-' + margin * 1.5
})

var pushBottom = S.operation('move', {
  'x': 'screenOriginX+' + margin,
  'y': 'screenOriginY+screenSizeY/2+' + margin / 2,
  'width': 'screenSizeX-' + margin * 2,
  'height': 'screenSizeY/2-' + margin * 1.5
})

var fullscreen = S.operation('move', {
  'x': 'screenOriginX+' + margin,
  'y': 'screenOriginY+' + margin,
  'width': 'screenSizeX-' + margin * 2,
  'height': 'screenSizeY-' + margin * 2
})

var centered = S.operation('move', {
  'x': 'screenOriginX+350',
  'y': 'screenOriginY+130',
  'width': 'screenSizeX-700',
  'height': 'screenSizeY-260'
})

S.bind('down:shift;alt;cmd', bottomLeft)
S.bind('right:shift;alt;cmd', bottomRight)
S.bind('left:shift;alt;cmd', topLeft)
S.bind('up:shift;alt;cmd', topRight)
S.bind('left:ctrl;alt;cmd', pushLeft)
S.bind('right:ctrl;alt;cmd', pushRight)
S.bind('down:ctrl;alt;cmd', pushBottom)
S.bind('up:ctrl;alt;cmd', pushTop)
S.bind('c:ctrl;alt;cmd', centered)
S.bind('m:ctrl;alt;cmd', fullscreen)

S.bind(']:ctrl;alt;cmd', function(win) {
  var size = win.size()
  var position = win.topLeft()
  var distance = 50
  win.resize({
    'width': size.width + distance,
    'height': size.height + distance
  })
  win.move({
    'x': position.x - distance / 2,
    'y': position.y - distance / 2
  })
})

S.bind('[:ctrl;alt;cmd', function(win) {
  var size = win.size()
  var position = win.topLeft()
  var distance = 50
  win.resize({
    'width': size.width - distance,
    'height': size.height - distance
  })
  win.move({
    'x': position.x + distance / 2,
    'y': position.y + distance / 2
  })
})

S.bnda({
  'right:cmd;alt': S.op('nudge', { 'x': '+3%', 'y': '+0' }),
  'left:cmd;alt': S.op('nudge', { 'x': '-3%', 'y': '+0' }),
  'up:cmd;alt': S.op('nudge', { 'x': '+0', 'y': '-3%' }),
  'down:cmd;alt': S.op('nudge', { 'x': '+0', 'y': '+3%' }),
  'right:ctrl;alt': S.op('resize', { 'width': '+3%', 'height': '+0' }),
  'left:ctrl;alt': S.op('resize', { 'width': '-3%', 'height': '+0' }),
  'up:ctrl;alt': S.op('resize', { 'width': '+0', 'height': '-3%' }),
  'down:ctrl;alt': S.op('resize', { 'width': '+0', 'height': '+3%' })
})
