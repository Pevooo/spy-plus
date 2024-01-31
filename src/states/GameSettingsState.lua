GameSettingsState = Class{__includes = BaseState}




function GameSettingsState:enter(params)
    self.num_players_selector = NumberSelector('Number Of Players', 3, 100)
    self.num_spies_selector = NumberSelector('Number Of Spies', 1, 160, self.num_players_selector)
    self.start_button = Button({
        text = "Start Game",
        x = WINDOW_WIDTH / 2 - 80,
        y = WINDOW_HEIGHT - 100,
        w = 160,
        h = 60,
        tween = false,
        texture = gTextures['button'],
        onClick = function()
            gStateMachine:change('name', {
                players = self.num_players_selector.val,
                spies = self.num_spies_selector.val
            })
        end
    })
    self.help_button = Button({
        text = "Help",
        x = WINDOW_WIDTH / 2 - 80,
        y = WINDOW_HEIGHT - 180,
        w = 160,
        h = 60,
        tween = false,
        texture = gTextures['button'],
        onClick = function()
            gStateMachine:change('help', {})
        end
    })

    if love.audio.getVolume() == 1 then
        sound_on = true
        self.btX = "Sound ON"
    else
        sound_on = false
        self.btX = "Sound OFF"
    end



    self.sound_button = Button({
        text = self.btX,
        x = WINDOW_WIDTH / 2 - 80,
        y = WINDOW_HEIGHT - 260,
        w = 160,
        h = 60,
        tween = false,
        texture = gTextures['button'],
        onClick = function()
            if sound_on then
                self.sound_button.text = "Sound OFF"
                love.audio.setVolume(0.0)
            else
                self.sound_button.text = "Sound ON"
                love.audio.setVolume(1.0)
            end
            sound_on = not sound_on
        end        
    })
end

function GameSettingsState:update(dt)
    self.sound_button:update(dt)
    self.help_button:update(dt)
    self.num_players_selector:update(dt)
    self.num_spies_selector:update(dt)
    self.start_button:update(dt)
end

function GameSettingsState:render()
    self.sound_button:render()
    self.help_button:render()
    self.num_players_selector:render()
    self.num_spies_selector:render()
    self.start_button:render()
end