function OpenUI()
    local playerPed = PlayerId()
    local playerName = GetPlayerName(playerPed)
    local iframe = '<iframe src="file://' ..  "ui.html" .. '" style="width:100%; height:100%; position: absolute; top:0; left:0; border:0;"></iframe'
    
    SendNUIMessage({
        openUi = true,
        playerName = playerName,
        iframe = iframe
    })
    
    SetNuiFocus(true, true)
end

function CloseUI()
    SendNUIMessage({
        closeUi = true
    })
    
    SetNuiFocus(false, false)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsControlJustReleased(0, 177) then
            CloseUI()
        end
    end
end)

RegisterCommand("openui", function()
    OpenUI()
end, false)

RegisterCommand("closeui", function()
    CloseUI()
end, false)

-- Additional functions based on your requirements
