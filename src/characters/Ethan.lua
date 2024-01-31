Ethan = Class{__includes = Player}


function Ethan:init(params)
    self.super = Player(params)
    self.spy = true
    self.type = 'Ethan'
    self.buttons = self.super.buttons
    self.info = {"Ethan knows other Spies"}
    self.powerup = 100
    self.code = self.super.code
    self.cur = 2 * WINDOW_HEIGHT / 4 + WINDOW_HEIGHT / 8 - 4
end


function Ethan:render()
    
    
    for i, b in ipairs(self.buttons) do
        b:render()
    end

    
    print_centered("Player " .. tostring(self.code), 60)
    love.graphics.setFont(gFonts['med'])
    local sps = ''
    print_centered("Players: ", self.cur - 30)
    if self.state then
        for i, s in ipairs(self.state.spies) do
            if i ~= #self.state.spies then
                sps = sps .. s.code .. ", "
            else
                sps = sps .. s.code
            end
        end
    end

    print_centered(sps, self.cur)
    print_centered("are today's spies", self.cur + 30)
    love.graphics.setFont(gFonts['small'])

end
