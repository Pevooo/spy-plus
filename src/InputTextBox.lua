InputTextBox = Class{}

function InputTextBox:init(y)
    self.y = y
    self.x = WINDOW_WIDTH / 2 - 80
    self.w = 160
    self.h = 30
    self.text = ''
    self.ac_text = false
end


function InputTextBox:update(dt)
    if collides(self.x, self.y, self.w, self.h, xMouse, yMouse) and love.mouse.isDown(1) then
        love.keyboard.setTextInput(true)
        self.ac_text = true
    elseif love.mouse.isDown(1) then
        love.keyboard.setTextInput(false)
        self.ac_text = false
    end
    self.text = gInputText

end

function InputTextBox:render()
    love.graphics.rectangle('line', WINDOW_WIDTH / 2 - 80, self.y, 160, 30)
    print_centered(gInputText, self.y + 10)
end