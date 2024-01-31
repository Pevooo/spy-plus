PostGameState = Class{__includes = BaseState}



function PostGameState:enter(params)
    self.players = params.players

    self.displayMode = 0
    for i, p in ipairs(self.players) do
        if p.spy and p.type ~= "Alfred" then
            self.displayMode = 1
        end
    end

    self.end_button = Button({
        x = WINDOW_WIDTH / 2 - 80, y = WINDOW_HEIGHT / 2 + 30, w = 160, h = 60, text = 'Play Again', texture = gTextures['button'],
        onClick = function()
            math.randomseed(os.time())
            gStateMachine:change('game-settings', {})
        end
    })

end

function PostGameState:update(dt)
    self.end_button:update()
end

function PostGameState:render()

    self.end_button:render()
    love.graphics.setFont(gFonts['med'])
    if self.displayMode == 1 then
        print_centered("Spies Have Won!!!!!", WINDOW_HEIGHT / 2)
    else
        print_centered("Innocents Have Won!!!!", WINDOW_HEIGHT / 2)
    end
    love.graphics.setFont(gFonts['small'])
end