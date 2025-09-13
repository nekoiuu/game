local module = {
    Configuration = {
        currentCoin = 50

    }
}
local dataStoreService = game:GetService("DataStoreService")
local playerCoin = dataStoreService:GetDataStore("PlayerCoin","Coin")

function module.setData(userId:number,data)
    local success, errorMessage = pcall(function()
        playerCoin:SetAsync(userId,data)
    end)
    if errorMessage then warn(errorMessage) end
    print(success)
end
function module.updateData(userId:number,data)
    local success,newData = pcall(function()
        return playerCoin:UpdateAsync(userId,data)        
    end)
    if not success and not data then warn("error updateData") end
    return newData
end
function module.getData(userId:number)
    local success,data = pcall(function()
        return playerCoin:GetAsync(userId)
    end)
    if not data then warn("error getData") end
    return data
end
return module