Player = Class{}


function Player:init(params)
    self.code = 0
    self.state = nil
    self.alfred_effect = false
    self.sophia_effect = false
    self.buttons = {
    Button({
        x = 0, y = 0, w = WINDOW_WIDTH, h = WINDOW_HEIGHT / 4, text = 'You can Ask someone or Vote', text_size = 'med+', edge = false
    }),
    Button({
        x = 0, y = WINDOW_HEIGHT / 4, w = WINDOW_WIDTH, h = WINDOW_HEIGHT / 4, text = 'Vote', text_size = 'large',
        onClick = function(state)
            state.vs = true
        end
    }),
    Button({
        x = 0, y = 3 * WINDOW_HEIGHT / 4, w = WINDOW_WIDTH, h = WINDOW_HEIGHT / 4, text = 'Continue', text_size = 'large',
        onClick = function(state)
            state.cur = state.cur + 1
            state.hidden = true
        end
    })
    }


end


function Player:update(dt)
    for i, b in ipairs(self.buttons) do
        b:update(dt)
    end


end

function Player:render()
    print_centered("Player ".. tostring(self.code), 60)
    for i, b in ipairs(self.buttons) do
        b:render()
    end
end

