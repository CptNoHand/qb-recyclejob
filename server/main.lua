local ItemTable = {
    "metalscrap",
    "plastic",
    "copper",
    "iron",
    "aluminum",
    "steel",
    "glass",
}

RegisterServerEvent("qb-recycle:server:getItem")
AddEventHandler("qb-recycle:server:getItem", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for i = 1, math.random(1, 5), 1 do
        local randItem = ItemTable[math.random(1, #ItemTable)]
        local amount = math.random(2, 6)
        Player.Functions.AddItem(randItem, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
        Citizen.Wait(500)
    end

    local chance = math.random(1, 100)
    if chance < 6 then
        Player.Functions.AddItem("acetone", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["acetone"], "add")
    end

    local Luck = math.random(1, 10)
    local Odd = math.random(1, 10)
    if Luck == Odd then
        local random = math.random(1, 3)
        Player.Functions.AddItem("rubber", random)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rubber"], 'add')
    end
end)
