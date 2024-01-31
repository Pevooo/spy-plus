
PlayState = Class{__includes = BaseState}

function PlayState:enter(params)
    self.players = params.players
    self.voting_system = VoteSystem(self)
    self.hidden = true
    self.vs = false
    self.cur = 1
    
    self.names = {}
    for i, p in pairs(self.players) do
        table.insert(self.names, p.code)
    end

    
    self:init_effects()

    self.spies = self:spies()

end

function PlayState:update(dt)
    if love.mouse.isDown(1) and not gTap and self.hidden then
        self.hidden = false
        self.vs = false
        gTap = true
    end

    if not self.hidden and not self.vs then
        self.players[self.cur]:update(dt)
    end

    if self.vs then
        self.voting_system:update(dt)
    end

    if self.cur > #self.players then
        gStateMachine:change('post-round', {
            voting_system = self.voting_system,
            players = self.players
        })
    end
end

function PlayState:destroy(code)
    for k, obj in ipairs(self.game) do
        if obj.code == code then
            table.remove(self.game, k)
        end
    end
end

function PlayState:find(code)
    for k, obj in ipairs(self.players) do
        if obj.code == code then
            return true
        end
    end
    return false
end


function PlayState:spies()
    tbl = {}
    for k, p in ipairs(self.players) do
        if p.spy then
            table.insert(tbl, p)
        end
    end
    return tbl
end


function PlayState:render()
    if self.hidden then
        print_centered('Player ' .. tostring(self.players[self.cur].code), 60)
        HIDDEN_CARD:render()
    elseif self.vs then
        self.voting_system:render()
    else
        self.players[self.cur]:render()
    end

    

end


function PlayState:init_effects()

    -- Modifying Button Parameters
    for i, p in pairs(self.players) do

        p.state = self
        p.alfred_effect = false
        p.sophia_effect = false
        if p.type == 'Alfred' then
            p.protect_selector.values = self.voting_system.ns_values
            p.protect_selector.val = self.voting_system.ns_values[1]
        end

        if p.type == 'Sophia' then
            p.elem_selector.values = self.voting_system.ns_values
            p.elem_selector.val = self.voting_system.ns_values[1]
        end

        for k, b in pairs(p.buttons) do
            b.fparams = self
        end

    end


end


function PlayState:get_ask_sequence()

    local names_cpy = copy(self.names)

    names_cpy = shuffle(names_cpy)


    local ask_sequence = {}

    for i = 1, (#names_cpy) - 1 do
        ask_sequence[names_cpy[i]] = names_cpy[i + 1]
    end
    ask_sequence[#names_cpy] = names_cpy[1]
    return ask_sequence

end