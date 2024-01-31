
NamesState = Class{__includes = BaseState}

function NamesState:enter(params)
    self.error = false
    self.max = params.players
    self.cur = 1
    self.text_input = InputTextBox(150)
    self.names = {}
    self.next_button = Button({
        x = WINDOW_WIDTH / 2 - 80, y = WINDOW_HEIGHT - 120, w = 160, h = 60, texture = gTextures['button'], text = "Next",
        onClick = function()
            if e_int_tbl(self.text_input.text, self.names) or self.text_input.text == '' then
                self.error = true
            else
                table.insert(self.names, self.text_input.text)
                self.error = false
                gInputText = ''
                self.cur = self.cur + 1
                if self.cur > self.max then
                    gStateMachine:change('feed', {
                        players = params.players,
                        spies = params.spies,
                        names = self.names
                    })
                end
            end

        end
    })
    

end

function NamesState:update(dt)
    self.text_input:update(dt)
    self.next_button:update(dt)
end


function NamesState:render()
    print_centered("Player " .. self.cur, 50)
    print_centered("Enter Name:", 110)
    if self.error then
        love.graphics.setFont(gFonts['med'])
        print_centered("Name should be unique and not empty :(", 180)
        love.graphics.setFont(gFonts['small'])
    end
    self.text_input:render()
    self.next_button:render()
end


