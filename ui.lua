-- HTML file path
local htmlFile = "ui.html"

-- Function to open the UI
function OpenUI()
    local playerPed = PlayerId()
    local playerName = GetPlayerName(playerPed)
    local iframe = '<iframe src="file://' .. GetCurrentResourcePath() .. '/' .. htmlFile .. '" style="width:100%; height:100%; position: absolute; top:0; left:0; border:0;"></iframe>'
    
    SendNUIMessage({
        openUi = true,
        playerName = playerName,
        iframe = iframe
    })
    
    SetNuiFocus(true, true)
end

-- Function to close the UI
function CloseUI()
    SendNUIMessage({
        closeUi = true
    })
    
    SetNuiFocus(false, false)
end

-- Register a command handler for each button
RegisterCommand("10-3", function()
    TriggerEvent("chatMessage", "10-3", {255, 0, 0}, "On Duty.")
end, false)

RegisterCommand("10-2", function()
    TriggerEvent("chatMessage", "10-2", {255, 0, 0}, "Enroute to Job.")
end, false)

RegisterCommand("10-7", function()
    TriggerEvent("chatMessage", "10-7", {255, 0, 0}, "Arrived at Job.")
end, false)

RegisterCommand("10-0", function()
    TriggerEvent("chatMessage", "10-0", {255, 0, 0}, "Off Duty.")
end, false)

-- Open the UI when a specific command is executed
RegisterCommand("openui", function()
    OpenUI()
end, false)

-- Close the UI when a specific command is executed
RegisterCommand("closeui", function()
    CloseUI()
end, false)
