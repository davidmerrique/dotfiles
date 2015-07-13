-- Disable animation
hs.window.animationDuration = 0

-- Shortcuts
local nudgeKey = {'alt', 'ctrl'}
local yankKey = {'alt', 'ctrl', 'shift'}
local pushKey = {'ctrl', 'alt', 'cmd'}
local pushShiftKey = {'shift', 'alt', 'cmd'}

-- Move a window a number of pixels x and y
function nudge(xpos, ypos)
 local win = hs.window.focusedWindow()
 local f = win:frame()
 f.x = f.x + xpos
 f.y = f.y + ypos
 win:setFrame(f)
end

-- Resize a window
function yank(xpixels, ypixels)
 local win = hs.window.focusedWindow()
 local f = win:frame()

 f.w = f.w + xpixels
 f.h = f.h + ypixels
 win:setFrame(f)
end

-- Resize window
function push(x, y, w, h)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  x = x / 100
  y = y / 100
  w = w / 100
  h = h / 100

  -- Add a margin
  x = x + 0.01
  y = y + 0.01
  w = w - 0.02
  h = h - 0.02

  f.x = max.x + (max.w * x)
  f.y = max.y + (max.h * y)
  f.w = max.w * w
  f.h = max.h * h
  win:setFrame(f)
end

-- Movement
hs.hotkey.bind(nudgeKey, 'down', function() nudge(0, 100) end) -- down
hs.hotkey.bind(nudgeKey, 'up', function() nudge(0, -100) end) -- up
hs.hotkey.bind(nudgeKey, 'right', function() nudge(100, 0) end) -- right
hs.hotkey.bind(nudgeKey, 'left', function() nudge(-100, 0) end) -- left

-- Resize
hs.hotkey.bind(yankKey, 'up', function() yank(0, -100) end) -- yank bottom up
hs.hotkey.bind(yankKey, 'down', function() yank(0, 100) end) -- yank bottom down
hs.hotkey.bind(yankKey, 'right', function() yank(100, 0) end) -- yank right side right
hs.hotkey.bind(yankKey, 'left', function() yank(-100, 0) end) -- yank right side left

-- Push to screen edge
hs.hotkey.bind(pushKey, 'left', function() push(0, 0, 50, 100) end) -- left side
hs.hotkey.bind(pushKey, 'right', function() push(50, 0, 50, 100) end) -- right side
hs.hotkey.bind(pushKey, 'up', function() push(0, 0, 100, 50) end) -- top half
hs.hotkey.bind(pushKey, 'down', function() push(0, 50, 100, 50) end) -- bottom half

-- Push to corner
hs.hotkey.bind(pushShiftKey, 'up', function() push(0, 0, 50, 50) end) -- top left
hs.hotkey.bind(pushShiftKey, 'right', function() push(50, 0, 50, 50) end) -- top right
hs.hotkey.bind(pushShiftKey, 'down', function() push(50, 50, 50, 50) end) -- bottom right
hs.hotkey.bind(pushShiftKey, 'left', function() push(0, 50, 50, 50) end) -- bottom left

-- Center window
hs.hotkey.bind(pushKey, 'c', function() push(14, 7, 72, 85) end)

-- Fullscreen
hs.hotkey.bind(pushKey, 'f', function() push(0, 0, 100, 100) end)

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
