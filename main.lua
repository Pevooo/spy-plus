require 'src/Dependencies'
local utf8 = require("utf8")



function love.load()

    love.keyboard.setKeyRepeat(true)
    gInputText = ''
    sound_on = true
    local width, height = love.graphics.getDimensions()
    width, height = math.min(width, height), math.max(width, height)
    love.graphics.setDefaultFilter('nearest', 'nearest')
    push:setupScreen(400, 712, width, height, {fullscreen = false})
    math.randomseed(os.time())
    love.window.setTitle('Spy+')
    gTap = False
    HIDDEN_CARD = Button({x = 10, y = 10, w = WINDOW_WIDTH - 20, h = WINDOW_HEIGHT - 20, text = 'Tap To Reveal', text_size = 'large', tween = true, edge = false})
    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['feed'] = function() return FeedState() end,
        ['game-settings'] = function() return GameSettingsState() end,
        ['play'] = function() return PlayState() end,
        ['post-round'] = function() return PostRoundState() end,
        ['post-game'] = function() return PostGameState() end,
        ['help'] = function() return HelpState() end,
        ['name'] = function() return NamesState() end
    }
    gStateMachine:change('start', {})


    
end


function love.update(dt)
    WINDOW_WIDTH, WINDOW_HEIGHT = love.graphics.getDimensions()
    gSounds['bg-sound']:play()
    Timer.update(dt)
    xMouse, yMouse = love.mouse.getPosition()
    gTime = love.timer.getTime()
    gStateMachine:update(dt)
    if love.mouse.isDown(1) then
        gTap = true
    else
        gTap = false
    end
    
    collectgarbage("collect")
end


function love.draw()


    love.graphics.push()
    love.graphics.scale(WINDOW_WIDTH / 400, WINDOW_HEIGHT / 900)
    love.graphics.draw(gTextures['background'], 0, 0) 
    love.graphics.pop()


    gStateMachine:render()

end


function love.resize(w, h)
    push:resize(w, h)
end


function love.focus(in_focus)
    if not in_focus then
        love.audio.setVolume(0)
    else
        if sound_on then
            love.audio.setVolume(1)
        end
    end
end


function love.textinput(t)
    gInputText = gInputText .. t
end


function love.keypressed(key)
    if key == "backspace" then
        local byteoffset = utf8.offset(gInputText, -1)

        if byteoffset then
            gInputText = string.sub(gInputText, 1, byteoffset - 1)
        end
    end
end