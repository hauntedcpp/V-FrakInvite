ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('V-FrakInvite:openNUI')
AddEventHandler('V-FrakInvite:openNUI', function(data)
    SetNuiFocus(true, true) -- Set focus to NUI
    SendNUIMessage({
        action = "open", -- Action to open the NUI
        inviter = data.inviter, -- Pass the inviter's name
        job = data.job, -- Pass the job
        recID = data.recID, -- Pass the recruitment ID
        title = data.title, -- Pass the title
        text = data.text, -- Pass the text
        accept = data.accept, -- Pass the accept button text
        cancel = data.cancel -- Pass the decline button text
    })
end)



RegisterNetEvent("V-FrakInvite:ShutdownNUI")
AddEventHandler("V-FrakInvite:ShutdownNUI", function()
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close"
    })
end)


RegisterNUICallback('decline', function(data, cb)
    TriggerServerEvent('V-FrakInvite:Decline', data)
    SetNuiFocus(false, false)
    cb('ok')
end)


RegisterNUICallback('accept', function(data, cb)
    TriggerServerEvent('V-FrakInvite:Accept', data)
    SetNuiFocus(false, false)
    cb('ok')
end)


RegisterNUICallback('CloseNUI', function(cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close"
    })
end)