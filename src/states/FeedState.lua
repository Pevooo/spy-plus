
FeedState = Class{__includes = BaseState}

function FeedState:enter(params)
    self.players = {}
    self.place = PLACES[math.random(#PLACES)]
    self.names = params.names
    self.num_spies = params.spies

    self.__chosen_spies = copy(VOTE_SYS_SUPPORT_SPIES)


    for i = 1, params.spies do
        table.insert(self.players, self:getSpy())
        self.players[i].code = i
    end


    for i = params.spies + 1, params.players do
        local num = math.random(10)
        if num == 1 then
            table.insert(self.players, Alfred({place = self.place}))
        else
            table.insert(self.players, Innocent({place = self.place}))
        end
    end

    self.players = shuffle(self.players)
    for i, p in ipairs(self.players) do
        p.code = self.names[i]
    end


    self.hidden = true
    self.cur = 1

end

function FeedState:update(dt)
    if love.mouse.isDown(1) and not gTap then
        gSounds['button']:play()
        if not self.hidden then
            self.cur = self.cur + 1
        end
        self.hidden = not self.hidden
    end

    if self.cur > #self.players then
        gStateMachine:change('play', {players = self.players})
    end
end


function FeedState:render()
    if self.hidden then
        HIDDEN_CARD:render()
    else
        love.graphics.setFont(gFonts['med'])
        print_centered("Player " ..self.players[self.cur].code, 90)
        print_centered("You are " ..self.players[self.cur].type, 120)
        for k, p in ipairs(self.players[self.cur].info) do
            print_centered(self.players[self.cur].info[k], 160 + (k - 1) * 30)
        end
        love.graphics.setFont(gFonts['small'])
        
    end
end


function FeedState:getSpy()

    -- Only one Spy
    if self.num_spies == 1 then
       local num = math.random(#VOTE_SYS_INDEPENDENT_SPIES)
       if num == 1 then return Sara()
       elseif num == 2 then return Sophia()
       elseif num == 3 then return Default()
       end
    end

    if #self.__chosen_spies == 0 then
        self.__chosen_spies = copy(VOTE_SYS_SUPPORT_SPIES)
    end


    self.__chosen_spies = shuffle(self.__chosen_spies)

    local spy = self.__chosen_spies[1]
    table.remove(self.__chosen_spies, 1)


    if spy == 'Sara' then
        return Sara()
    elseif spy == 'Ethan' then
        return Ethan()
    elseif spy == 'Sophia' then
        return Sophia()
    elseif spy == 'Default' then
        return Default()
    end


end


