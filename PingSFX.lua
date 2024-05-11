-- assuming the game has the 'owner' keyword
local localPlayer = owner
local Character = localPlayer.Character

local Tool = Instance.new("Tool", localPlayer.Backpack)
Tool.RequiresHandle = false
Tool.Name = "Ping"
Tool.Activated:Connect(function()
    local Ping = Instance.new("Sound", workspace)
    Ping.SoundId = "rbxassetid://7383525713"
    Ping.Volume = 9e9
    Ping:Play()
    Ping.Ended:Connect(function()
        Ping:Destroy()
    end)
end)