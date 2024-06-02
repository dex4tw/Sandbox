-- iceify tool server
local localPlayer = owner
local Iceify = Instance.new("Tool", localPlayer.Backpack)
Iceify.Name = "Iceify"
Iceify.ToolTip = "Tool that makes stuff ice or something"
Iceify.RequiresHandle = false

if game:GetService("ReplicatedStorage"):FindFirstChild("Iceify") then
    game:GetService("ReplicatedStorage").Iceify:Destroy()
end
local Folder = Instance.new("Folder", game:GetService("ReplicatedStorage"))
Folder.Name = "Iceify"
local Hit = Instance.new("RemoteEvent", game:GetService("ReplicatedStorage").Iceify)
Hit.Name = "Hit"

Hit.OnServerEvent:Connect(function(plr, pos, target)
    print(plr, pos, target)
    for i=0,10 do
        task.spawn(function()
            local Ice = Instance.new("Part", workspace)
            Ice.Name = "Ice"
            Ice.Material = Enum.Material.Ice
            Ice.Color = Color3.fromRGB(133, 197, 226)
            Ice.Size = Vector3.new(math.random(2, 9) / 10, math.random(2, 9) / 10, math.random(2, 9) / 10)
            Ice.CFrame = CFrame.new(pos):ToWorldSpace(CFrame.new(math.random(-6,6),3,math.random(-6,6)))
            target.Material = Enum.Material.Ice
            target.Color = Color3.fromRGB(133, 197, 226)
            wait(3)
            for i=0,11 do
                Ice.Transparency = Ice.Transparency + .1
                target.Transparency = target.Transparency + .1
                wait(.01)
            end
            target:Destroy()
            Ice:Destroy()
        end)
    end
end)