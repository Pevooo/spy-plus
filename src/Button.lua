Button = Class{}


function Button:init(params)
    self.onClick = params.onClick or function() end
    self.x = params.x 
    self.y = params.y
    self.w = params.w
    self.h = params.h
    self.text = params.text or ""
    self.fparams = params.fparams
    self.texture = params.texture or nil
    self.text_size = params.text_size or 'small'
    if params.edge == nil then
        self.edge = true
    else
        self.edge = false
    end

    self.btC = {r = 1, g = 1, b = 1}

    -- Tweening
    self.tween = params.tween or false
    if self.tween then
        repeat_animation(1.5, self.btC)
    end
end


function Button:update(dt)
    if love.mouse.isDown(1) and collides(self.x, self.y, self.w, self.h, xMouse, yMouse) and not gTap then
        gTap = true
        self.onClick(self.fparams)
        gSounds['button']:play()
    end

end


function Button:render()
    if self.texture then
        love.graphics.draw(self.texture, self.x, self.y)
    elseif self.edge then
        love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
    end

    love.graphics.setFont(gFonts[self.text_size])
    love.graphics.setColor(self.btC.r, self.btC.g, self.btC.b)
    print_centered(self.text, self.y + self.h / 2 - 8)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(gFonts['small'])

end
