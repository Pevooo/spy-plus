NumberSelector = Class{}

function NumberSelector:init(text, min, y, ref, values)
    if ref then
        self.ref = ref
        self.max = math.floor(ref.val / 2)
    else
        self.max = 100
    end
    
    self.values = values
    self.cur = 1

    
    self.val = min
    if self.values then
        self.val = self.values[1]
    end
    

    self.y = y
    self.min = min
    self.text = text

        
end


function NumberSelector:update(dt)
    if self.ref then
        self.max = math.floor(self.ref.val / 2)
        if self.val > math.floor(self.ref.val / 2) then
            self.val = math.floor(self.ref.val / 2)
        end
    end



    if love.mouse.isDown(1) and collides(WINDOW_WIDTH / 2 - 80, self.y + 25, 20, 20, xMouse, yMouse) and not gTap then
        gSounds['button']:play()
        gTap = true
        if self.values then
            if self.val > self.values[1] then
                self.val = self.values[self.cur - 1]
                self.cur = self.cur - 1
            end
        else
            if self.val > self.min then
                self.val = self.val - 1
            end
        end
    elseif love.mouse.isDown(1) and collides(WINDOW_WIDTH / 2 + 60, self.y + 25, 20, 20, xMouse, yMouse) and not gTap then
        gSounds['button']:play()
        gTap = true
        if self.values then
            if self.val < self.values[#self.values] then
                self.val = self.values[self.cur + 1]
                self.cur = self.cur + 1
            end           
        else
            if self.val < self.max then
                self.val = self.val + 1
            end
        end
    end


end

function NumberSelector:render()
    love.graphics.draw(gTextures['up-arrow'], WINDOW_WIDTH / 2 + 60, self.y + 25)
    love.graphics.draw(gTextures['down-arrow'], WINDOW_WIDTH / 2 - 80, self.y + 25)
    love.graphics.rectangle('line', WINDOW_WIDTH / 2 - 50, self.y + 25, 100, 20)
    love.graphics.setFont(gFonts['small'])
    print_centered(self.text, self.y)
    print_centered(self.val, self.y + 26)

end