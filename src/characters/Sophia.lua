Sophia = Class{__includes = Player}


function Sophia:init(params)
    self.super = Player(params)
    self.spy = true
    self.sentinel = false
    self.type = 'Sophia'
    self.buttons = self.super.buttons
    self.info = {"Sophia has the ability to eleminate someone"}
    self.powerup = 1


    self.elem_selector = NumberSelector('Eleminate', 1, WINDOW_HEIGHT / 2 + 20, nil, nil)
    self.elem_button = Button({x = WINDOW_WIDTH / 2 - 80, y = WINDOW_HEIGHT / 2 + 100, w = 160, h = 60, text = 'Choose', texture = gTextures['button'],
        onClick = function()
            for i, p in ipairs(self.state.players) do
                if p.code == self.elem_selector.val then
                    p.sophia_effect = true
                end
            end
            
            self.elem_button.x = -200
            self.elem_button.y = -200
            self.elem_selector.y = -200
            self.powerup = 0
        end,

    })
end


function Sophia:update(dt)
    for i, b in ipairs(self.buttons) do
        b:update(dt)
    end


    if self.powerup > 0 then
        self.elem_selector:update(dt)
        self.elem_button:update(dt)
    end
end


function Sophia:render()
    love.graphics.print("Player " .. tostring(self.code), WINDOW_WIDTH / 2 - (#tostring(self.code) + 7) * 4, 60)
    for i, b in ipairs(self.buttons) do
        b:render()
    end

    if self.powerup > 0 then
        self.elem_selector:render()
        self.elem_button:render()
    end
end
