local dataStoreModule = require(script.Parent.Module.DataStore.DataStore)

-- create player data
game.Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder",player)
    leaderstats.Name = "leaderstats"
    local coin = Instance.new("IntValue",leaderstats)
    coin.Name = "Coin"
    --setup player data
    local playerOldData = dataStoreModule.getData(player.UserId)
    if playerOldData then
        coin.Value = playerOldData
        return
    end
    coin.Value = dataStoreModule.Configuration.currentCoin

end)
-- update player data 
game.Players.PlayerRemoving:Connect(function(player)
    local leaderstats = player.leaderstats
    local coin = leaderstats.Coin
    local newData
    repeat
        newData = dataStoreModule.setData(player.UserId,coin)
        task.wait()
    until newData
end)