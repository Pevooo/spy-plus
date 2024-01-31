Alfred = Class{__includes = Player}


function Alfred:init(params)
    self.super = Player(params)
    self.spy = false
    self.sentinel = true
    self.type = 'Alfred'
    self.buttons = self.super.buttons
    self.info = {"Alfred protects someone each round", "and he is not a spy", params.place}
    self.powerup = 100


    self.protect_selector = NumberSelector('Protect', 1, WINDOW_HEIGHT / 2 + 20, nil, nil)
    self.protect_button = Button({x = WINDOW_WIDTH / 2 - 80, y = WINDOW_HEIGHT / 2 + 100, w = 160, h = 60, text = 'Choose', texture = gTextures['button'],
        onClick = function()
            for i, p in ipairs(self.state.players) do
                if p.code == self.protect_selector.val then
                    p.alfred_effect = true
                end
            end

            self.protect_button.x = -200
            self.protect_button.y = -200
            self.protect_selector.y = -200
        end,

    })
end


function Alfred:update(dt)
    for i, b in ipairs(self.buttons) do
        b:update(dt)
    end

    self.protect_selector:update(dt)
    self.protect_button:update(dt)
end


function Alfred:render()
    love.graphics.print("Player " .. tostring(self.code), WINDOW_WIDTH / 2 - (#tostring(self.code) + 7) * 4, 60)
    for i, b in ipairs(self.buttons) do
        b:render()
    end

    self.protect_selector:render()
    self.protect_button:render()
end
