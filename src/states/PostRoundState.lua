
PostRoundState = Class{__includes = BaseState}

function PostRoundState:enter(params)
    self.voting_system = params.voting_system
    self.players = params.players
    self.displaymode = 0
    self.total_votes = #params.voting_system.voters
    self.elem, self.elem_votes = argmax(self.voting_system.votes)
    self.sara = false


    self.kick = {}
    self.new_players = {}


    self:kick_players()

    if #self.new_players < 3 then
        gStateMachine:change('post-game', {
            players = self.new_players
        })
    end



    self.exit_button = Button({
        x = WINDOW_WIDTH / 2 - 80, y = WINDOW_HEIGHT / 2 - 30, w = 160, h = 60, text = 'Continue', texture = gTextures['button'],
        onClick = function()
            gStateMachine:change('play', {
                players = self.new_players
            })
        end
    })


    self.end_button = Button({
        x = WINDOW_WIDTH / 2 - 80, y = WINDOW_HEIGHT / 2 + 50, w = 160, h = 60, text = 'End Game', texture = gTextures['button'],
        onClick = function()
            gStateMachine:change('post-game', {
                players = self.new_players
            })
        end
    })
end

function PostRoundState:update(dt)

    self.exit_button:update()
    self.end_button:update()
end


function PostRoundState:render()


    love.graphics.setFont(gFonts['med'])
    if #self.kick == 0 then
        print_centered("Nobody was kicked out :(", 40)
    else
        for i, p in ipairs(self.kick) do
            print_centered("Player " .. p .. " was kicked out :)", 40 + (i - 1) * 30)
        end
    end
    love.graphics.setFont(gFonts['small'])

    self.exit_button:render()
    self.end_button:render()
end


function PostRoundState:kick_players()

    -- Not enough votes
    if (self.total_votes < #self.players / 2) or self.elem_votes == 0 or self.elem == 0 then
        for i, p in ipairs(self.players) do
            if (p.sophia_effect) and not p.alfred_effect then
                table.insert(self.kick, p.code)
            end
        end
    
    -- Enough votes
    else
        for i, p in ipairs(self.players) do
            if (p.code == self.elem or p.sophia_effect) and not p.alfred_effect then
                if p.type == 'Sara' and p.powerup > 0 then
                    p.powerup = p.powerup - 1
                else
                    table.insert(self.kick, p.code)
                end
            end
        end

    end



    -- Creating new players
    for i, p in ipairs(self.players) do
        if not e_int_tbl(p.code, self.kick) then
            table.insert(self.new_players, p)
        end
    end

end