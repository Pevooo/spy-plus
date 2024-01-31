StartState = Class{__includes = BaseState}



function StartState:enter(params)
    self.bgC = {r = 0.2, g = 0.2, b = 0.2}
    self.txC = {r = 1, g = 1, b = 1}

    -- Tweening
    repeat_animation(1.5, self.txC)
end

function StartState:update(dt)
    
    if love.mouse.isDown(1) and not gTap then
        gSounds['button']:play()
        gStateMachine:change('game-settings', {})
    end

    

end

function StartState:render()

    

    love.graphics.setBackgroundColor(self.bgC.r, self.bgC.r, self.bgC.r)
    love.graphics.setFont(gFonts['large'])
    
    print_centered("Spy+", WINDOW_HEIGHT / 5)
    love.graphics.setColor(self.txC.r, self.txC.g, self.txC.b, 1)
    love.graphics.setFont(gFonts['med+'])
    print_centered("Tap Anywhere to start", WINDOW_HEIGHT / 2)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(gFonts['small'])
    print_centered(VERSION, WINDOW_HEIGHT / 2 + 100)


    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(gFonts['med'])
end


function StartState:exit()
    
end