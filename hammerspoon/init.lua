-- Import
local grid = require 'hs.grid'

-- Disable animation
hs.window.animationDuration = 0

grid.GRIDWIDTH = 4
grid.GRIDHEIGHT = 4
grid.MARGINX = 15
grid.MARGINY = 15

local gw = grid.GRIDWIDTH
local gh = grid.GRIDHEIGHT

local goLeft = {x = 0, y = 0, w = gw/2, h = gh}
local goRight = {x = gw/2, y = 0, w = gw/2, h = gh}
local goUp = {x = 0, y = 0, w = gw, h = gh/2}
local goDown = {x = 0, y = gh/2, w = gw, h = gh}
local goTopLeft = {x = 0, y = 0, w = gw/2, h = gh/2}
local goTopRight = {x = gw/2, y = 0, w = gw/2, h = gh/2}
local goBottomRight = {x = gw/2, y = gh/2, w = gw/2, h = gh/2}
local goBottomLeft = {x = 0, y = gh/2, w = gw/2, h = gh/2}

local goFull = {x = 0, y = 0, w = gw, h = gh}

-- Shortcuts
local pushKey = {'alt', 'ctrl'}
local resizeKey = {'alt', 'ctrl', 'shift'}
local moveKey = {'ctrl', 'alt', 'cmd'}
local pushShiftKey = {'shift', 'alt', 'cmd'}

-- Position a window in grid
function gridSet(frame)
  local win = hs.window.focusedWindow()
  if win then
    grid.set(win, frame, win:screen())
  else
    alert.show('No focused window')
  end
end

-- Movement
hs.hotkey.bind(pushKey, 'down', hs.grid.pushWindowDown)
hs.hotkey.bind(pushKey, 'up', hs.grid.pushWindowUp)
hs.hotkey.bind(pushKey, 'right', hs.grid.pushWindowRight)
hs.hotkey.bind(pushKey, 'left', hs.grid.pushWindowLeft)

-- Resize
hs.hotkey.bind(resizeKey, 'up', hs.grid.resizeWindowShorter)
hs.hotkey.bind(resizeKey, 'down', hs.grid.resizeWindowTaller)
hs.hotkey.bind(resizeKey, 'right', hs.grid.resizeWindowWider)
hs.hotkey.bind(resizeKey, 'left', hs.grid.resizeWindowThinner)

-- Push to screen edge
hs.hotkey.bind(moveKey, 'left', function() gridSet(goLeft) end)
hs.hotkey.bind(moveKey, 'right', function() gridSet(goRight) end)
hs.hotkey.bind(moveKey, 'up', function() gridSet(goUp) end)
hs.hotkey.bind(moveKey, 'down', function() gridSet(goDown) end)

-- Push to corner
hs.hotkey.bind(pushShiftKey, 'up', function() gridSet(goTopLeft) end)
hs.hotkey.bind(pushShiftKey, 'right', function() gridSet(goTopRight) end)
hs.hotkey.bind(pushShiftKey, 'down', function() gridSet(goBottomRight) end)
hs.hotkey.bind(pushShiftKey, 'left', function() gridSet(goBottomLeft) end)

-- Fullscreen
hs.hotkey.bind(moveKey, 'f', function() gridSet(goFull) end)

-- Center window. More complicated
hs.hotkey.bind(moveKey, 'c', function()
  local screenWidth = hs.window.focusedWindow():screen():frame().w
  local percentW = (screenWidth > 1920 and 0.85 or 0.88) * gw
  local percentH = 0.92 * gh
  local centerX = gw - percentW
  local centerY = gh - percentH
  local centerW = gw - (centerX * 2)
  local centerH = gh - (centerY * 2)

  gridSet({x = centerX, y = centerY, w = centerW, h = centerH})
end)

-- Auto reload config
function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == '.lua' then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
hs.pathwatcher.new(os.getenv('HOME') .. '/.dotfiles/hammerspoon/', reloadConfig):start()
hs.alert.show('Config loaded')
