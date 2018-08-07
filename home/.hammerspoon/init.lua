-- Spoons
-- hs.loadSpoon('Seal')

-- spoon.Seal:loadPlugins({
--   'apps',
--   'calc',
--   'screencapture'
-- })

-- spoon.Seal:bindHotkeys({
--   show = {{'alt', 'cmd'}, 'b'}
-- })

-- spoon.Seal:start()

-- Disable animation
hs.window.animationDuration = 0

-- Set up grid
local gw = 8
local gh = 8

hs.grid.setGrid(gw .. 'x' .. gh)
hs.grid.setMargins({w = 10, h = 10})
hs.grid.ui.textSize = 16

-- Shortcuts
local pushKey = {'alt', 'ctrl'}
local resizeKey = {'alt', 'ctrl', 'shift'}
local moveKey = {'ctrl', 'alt', 'cmd'}
local pushShiftKey = {'shift', 'alt', 'cmd'}

-- move while snapping size to grid
local moves = {
  up = hs.grid.pushWindowUp,
  down = hs.grid.pushWindowDown,
  left = hs.grid.pushWindowLeft,
  right = hs.grid.pushWindowRight,
}

for direction, mover in pairs(moves) do
  hs.hotkey.bind(pushKey, direction, mover)
end

-- resize while keeping top-left anchored
local resizes = {
  up = hs.grid.resizeWindowShorter,
  down = hs.grid.resizeWindowTaller,
  left = hs.grid.resizeWindowThinner,
  right = hs.grid.resizeWindowWider
}

for direction, resizer in pairs(resizes) do
  hs.hotkey.bind(resizeKey, direction, resizer)
end

-- Push to screen edge
local SIDES = {
  up = {x = 0, y = 0, w = gw, h = gh/2},
  down = {x = 0, y = gh/2, w = gw, h = gh/2},
  left = {x = 0, y = 0, w = gw/2, h = gh},
  right = {x = gw/2, y = 0, w = gw/2, h = gh}
}

for direction, geom in pairs(SIDES) do
  hs.hotkey.bind(moveKey, direction, function()
    hs.grid.set(hs.window.focusedWindow(), geom)
  end)
end

-- Push to corner
local CORNERS = {
  topLeft = {
    direction = 'up',
    geom = {x = 0, y = 0, w = gw/2, h = gh/2}
  },
  topRight = {
    direction = 'right',
    geom = {x = gw/2, y = 0, w = gw/2, h = gh/2}
  },
  bottomRight = {
    direction = 'down',
    geom = {x = gw/2, y = gh/2, w = gw/2, h = gh/2}
  },
  bottomLeft = {
    direction = 'left',
    geom = {x = 0, y = gh/2, w = gw/2, h = gh/2}
  }
}

for corner, obj in pairs(CORNERS) do
  hs.hotkey.bind(pushShiftKey, obj.direction, function()
    hs.grid.set(hs.window.focusedWindow(), obj.geom)
  end)
end

-- Fullscreen
hs.hotkey.bind(moveKey, 'f', function()
  hs.grid.set(hs.window.focusedWindow(), {x = 0, y = 0, w = gw, h = gh})
end)

-- Center window
hs.hotkey.bind(moveKey, 'c', function()
  local screenWidth = hs.window.focusedWindow():screen():frame().w
  local percentW = (screenWidth > 1920 and 0.85 or 0.88) * gw
  local percentH = 0.9 * gh
  local centerX = gw - percentW
  local centerY = gh - percentH
  local centerW = gw - (centerX * 2)
  local centerH = gh - (centerY * 2)
  hs.grid.set(hs.window.focusedWindow(), {x = centerX, y = centerY, w = centerW, h = centerH})
end)

-- Center window small
hs.hotkey.bind(moveKey, 'v', function()
  local screenWidth = hs.window.focusedWindow():screen():frame().w
  local percentW = (screenWidth > 1920 and 0.77 or 0.80) * gw
  local percentH = 0.83 * gh
  local centerX = gw - percentW
  local centerY = gh - percentH
  local centerW = gw - (centerX * 2)
  local centerH = gh - (centerY * 2)
  hs.grid.set(hs.window.focusedWindow(), {x = centerX, y = centerY, w = centerW, h = centerH})
end)

-- Center window smaller!
hs.hotkey.bind(moveKey, 'b', function()
  local screenWidth = hs.window.focusedWindow():screen():frame().w
  local percentW = (screenWidth > 1920 and 0.7 or 0.80) * gw
  local percentH = 0.75 * gh
  local centerX = gw - percentW
  local centerY = gh - percentH
  local centerW = gw - (centerX * 2)
  local centerH = gh - (centerY * 2)
  hs.grid.set(hs.window.focusedWindow(), {x = centerX, y = centerY, w = centerW, h = centerH})
end)

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
