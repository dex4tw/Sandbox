local RCTEvent = Instance.new("RemoteEvent", game:GetService("ReplicatedStorage"))
RCTEvent.Name = "RCTEvent"
RCT = false
RCTEvent.OnServerEvent:Connect(function(Player, Event)
    if Player.Name == "dex4tw" then
        if Event then
            RCT = true
            while RCT do
                print("RCT Healing")
                Player.Character.Humanoid.Health = Player.Character.Humanoid.Health + .3
                wait()
            end
        else
            RCT = false
        end
    end
end)