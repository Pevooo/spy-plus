VoteSystem = Class{}


function VoteSystem:init(state)
    self.num_players = #state.players
    self.state = state
    


    self.voters = {}
    self.votes = {}

    self.ns_values = {}
    for i, p in ipairs(self.state.players) do
        table.insert(self.ns_values, p.code)
    end
    table.sort(self.ns_values)


    self.ns = NumberSelector('Player', 1, 50, nil, self.ns_values)
    self.ns.max = self.num_players
    self.exit_button = Button({
        x = WINDOW_WIDTH / 2 - 80, y = 115, w = 160, h = 60, text = 'Vote', texture = gTextures['button'],
        onClick = function(params)
            if self:vote(self.state.cur, self.ns.val) then
                self.state.cur = self.state.cur + 1
                self.state.vs = false
                self.state.hidden = true
            end
        end
    })
end

function VoteSystem:update(dt)
    self.ns:update(dt)
    self.exit_button:update(dt)
end

function VoteSystem:vote(source, destination)
    if self.state:find(destination) then
        if self.votes[destination] then
            self.votes[destination] = self.votes[destination] + 1
        else
            self.votes[destination] = 1
        end
        
        table.insert(self.voters, source)
        self.ns.val = self.ns_values[1]
        self.ns.cur = 1
        return true
    end
    return false
end


function VoteSystem:render(type)
    self.ns:render()
    self.exit_button:render()
end


function VoteSystem:reset()
    self.voters = {}
    self.votes = {}
end