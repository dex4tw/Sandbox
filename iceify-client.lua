-- iceify tool client
local localPlayer = owner
local Iceify = localPlayer.Backpack:WaitForChild("Iceify") 

Iceify.Activated:Connect(function()
    game:GetService("ReplicatedStorage").Iceify.Hit:FireServer(localPlayer:GetMouse().Hit.p, localPlayer:GetMouse().Target)
end)