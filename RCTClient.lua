local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(Key)
    if Key.KeyCode == Enum.KeyCode.G then
        game:GetService("ReplicatedStorage")["RCTEvent"]:FireServer(true)
    end
end)
UserInputService.InputEnded:Connect(function(Key)
    if Key.KeyCode == Enum.KeyCode.G then
        game:GetService("ReplicatedStorage")["RCTEvent"]:FireServer(false)
    end
end)