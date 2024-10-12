ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('V-FrakInvite:sendInvite')
AddEventHandler('V-FrakInvite:sendInvite', function(inviterName, job, recID, title, text, accept, cancel)
    local src = source -- Get the player who triggered the event
    local closestPlayer, closestDistance = GetClosestPlayer(src) -- Get the closest player

    -- Check if there is a valid closest player and that it's not the inviter
    if closestPlayer ~= -1 and closestDistance <= 3.0 and closestDistance ~= 0.0 then
        -- Send NUI to the closest player
        TriggerClientEvent('V-FrakInvite:openNUI', closestPlayer, {
            inviter = inviterName,   -- The name of the player sending the invite
            job = job,               -- The job of the inviter
            recID = recID,           -- The recipient ID for the invite
            title = title,           -- The title of the NUI message
            text = text,             -- The text content of the NUI message
            accept = accept,         -- The text for the accept button
            cancel = cancel          -- The text for the decline button
        })

    else
        return
    end
end)

function GetClosestPlayer(src)
    local players = ESX.GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerCoords = GetEntityCoords(GetPlayerPed(src))

    for _, playerId in ipairs(players) do
        if playerId ~= src then
            local targetCoords = GetEntityCoords(GetPlayerPed(playerId))
            local distance = #(playerCoords - targetCoords)

            if closestDistance == -1 or closestDistance > distance or closestDistance == 0.0 then
                closestDistance = distance
                closestPlayer = playerId
            end
        end
    end

    return closestPlayer, closestDistance
end


RegisterNetEvent('V-FrakInvite:Decline')
AddEventHandler('V-FrakInvite:Decline', function(data)
    TriggerClientEvent("ShutdownNUI", source)
    TriggerClientEvent("notify", source, "warning", "FRAKTION", "Du hast die Einladung abgelehnt!", 2500)
end)

RegisterNetEvent('V-FrakInvite:Accept')
AddEventHandler('V-FrakInvite:Accept', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        xPlayer.setJob(data.job, 1)
        TriggerClientEvent("V-FrakInvite:ShutdownNUI", source)
        TriggerClientEvent("notify", source, "warning", "FRAKTION", "Du hast die Einladung angenommen!", 2500)
    end
end)


