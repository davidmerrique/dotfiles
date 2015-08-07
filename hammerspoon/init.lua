-- Import
local grid = require 'hs.grid'

-- Disable animation
hs.window.animationDuration = 0

hs.grid.ui.textSize = 80

grid.GRIDWIDTH = 5
grid.GRIDHEIGHT = 4
grid.MARGINX = 15
grid.MARGINY = 15

local gw = grid.GRIDWIDTH
local gh = grid.GRIDHEIGHT

-- Shortcuts
local pushKey = {'alt', 'ctrl'}
local resizeKey = {'alt', 'ctrl', 'shift'}
local moveKey = {'ctrl', 'alt', 'cmd'}
local pushShiftKey = {'shift', 'alt', 'cmd'}

function switch(t)
  t.case = function (self,x)
    local f=self[x] or self.default
    if f then
      if type(f)=="function" then
        f(x,self)
      else
        error("case "..tostring(x).." not a function")
      end
    end
  end
  return t
end

-- Position a window in grid
function gridSet(name)
  local win = hs.window.focusedWindow()
  local screenWidth = hs.window.focusedWindow():screen():frame().w
  local percentW = (screenWidth > 1920 and 0.85 or 0.88) * gw
  local percentH = 0.92 * gh
  local centerX = gw - percentW
  local centerY = gh - percentH
  local centerW = gw - (centerX * 2)
  local centerH = gh - (centerY * 2)

  local table = {
    left = {x = 0, y = 0, w = gw/2, h = gh},
    right = {x = gw/2, y = 0, w = gw/2, h = gh},
    up = {x = 0, y = 0, w = gw, h = gh/2},
    down = {x = 0, y = gh/2, w = gw, h = gh},
    topLeft = {x = 0, y = 0, w = gw/2, h = gh/2},
    topRight = {x = gw/2, y = 0, w = gw/2, h = gh/2},
    bottomRight = {x = gw/2, y = gh/2, w = gw/2, h = gh/2},
    bottomLeft = {x = 0, y = gh/2, w = gw/2, h = gh/2},
    full = {x = 0, y = 0, w = gw, h = gh},
    center = {x = centerX, y = centerY, w = centerW, h = centerH}
  }

  if table[name] then
    if win then
      grid.set(win, table[name], win:screen())
    else
      alert.show('No focused window')
    end
  else
    alert.show('Unknown position')
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
hs.hotkey.bind(moveKey, 'left', function() gridSet('left') end)
hs.hotkey.bind(moveKey, 'right', function() gridSet('right') end)
hs.hotkey.bind(moveKey, 'up', function() gridSet('up') end)
hs.hotkey.bind(moveKey, 'down', function() gridSet('down') end)

-- Push to corner
hs.hotkey.bind(pushShiftKey, 'up', function() gridSet('topLeft') end)
hs.hotkey.bind(pushShiftKey, 'right', function() gridSet('topRight') end)
hs.hotkey.bind(pushShiftKey, 'down', function() gridSet('bottomRight') end)
hs.hotkey.bind(pushShiftKey, 'left', function() gridSet('bottomLeft') end)

-- Fullscreen
hs.hotkey.bind(moveKey, 'f', function() gridSet('full') end)

-- Center window. More complicated
hs.hotkey.bind(moveKey, 'c', function() gridSet('center') end)

-- Show the grid
hs.hotkey.bind(moveKey, 'g', hs.grid.show)

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
