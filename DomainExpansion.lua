-- Domain Expansion
-- ~@dex4tw https://discord.gg/subdomain

-- Variables & Functions
local localPlayer = owner
local Character = localPlayer.Character
local Caught = {}
local Whitelist = {}
local Catch = false
local TweenService = game:GetService("TweenService")

-- Tool
local Tool = Instance.new("Tool", localPlayer.Backpack)
Tool.Name = "Domain Expansion"
Tool.ToolTip = "@dex4tw was here | Bad Domain Expansion"
Tool.RequiresHandle = false

Tool.Activated:Connect(function()
    -- Create Domain
    local Domain = Instance.new("Part", Character)
    Domain.CanCollide = false
    Domain.Anchored = true
    Domain.Color = Color3.fromRGB(0,0,0)
    Domain.Parent = workspace
    Domain.CFrame = Character["HumanoidRootPart"].CFrame
    Domain.Massless = true
    Domain.Shape = Enum.PartType.Ball
    Domain.Transparency = 0
    Domain.Size = Vector3.new(1,1,1)
    Domain.Material = Enum.Material.Neon
    Domain.Reflectance = 0
    Domain.CastShadow = false
    local Baseplate = Instance.new("Part", workspace)
    Baseplate.Anchored = true
    Baseplate.Transparency = 1
    Baseplate.Size = Vector3.new(5000,5,5000)
    Baseplate.CFrame = CFrame.new(0,4990,0)
    local Sphere = Instance.new("Part")
    Sphere.Parent = workspace
    Sphere.Size = Vector3.new(5, 6, 5)
    Sphere.CFrame = CFrame.new(0,4990,0)
    Sphere.Anchored = true
    Sphere.CanCollide = true
    Sphere.CastShadow = false
    local Highlight = Instance.new("Highlight", Sphere)
    Highlight.DepthMode = Enum.HighlightDepthMode.Occluded 
    Highlight.Adornee = Sphere
    Highlight.FillTransparency = 0
    Highlight.FillColor = Color3.new(0,0,0)
    Highlight.OutlineColor = Color3.new(0,0,0)
    local Mesh = Instance.new("SpecialMesh")
    Mesh.MeshType = Enum.MeshType.FileMesh
    Mesh.MeshId = "rbxassetid://12756704717"
    Mesh.TextureId = "rbxassetid://60484593"
    Mesh.Offset = Vector3.new(0, 0, 0)
    Mesh.Scale = Vector3.new(15,15,15)
    Mesh.VertexColor = Vector3.new(0,0,0)
    Mesh.Parent = Sphere
    local Highlight = Instance.new("Highlight", Domain)
    Highlight.DepthMode = Enum.HighlightDepthMode.Occluded 
    Highlight.Adornee = Domain
    Highlight.FillTransparency = 0
    Highlight.FillColor = Color3.new(255,255,255)
    Highlight.OutlineColor = Color3.new(255,255,255)

    -- SFX
    local SFX = Instance.new("Sound", localPlayer.Character)
    SFX.SoundId = "rbxassetid://6667923288"
    SFX.Volume = 1
    SFX:Play()

    -- Domain Logic
    wait(2)
    Catch = true
    local TP = Domain.Touched:Connect(function(Object)
        if Object.Parent:FindFirstChild("Humanoid") and Catch then
            local Player = game:GetService("Players")[Object.Parent.Name]
            if not table.find(Whitelist, Player.Name) then
                table.insert(Caught, Player.Name..":"..tostring(Player.Character.HumanoidRootPart.CFrame))
                table.insert(Whitelist, Player.Name)
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(0,5000,0)
            end
        end
    end)

    -- Expand Domain
    for i=0,100 do
        Domain.Size = Domain.Size * 1.05
        wait()
    end
    wait(2)
    Catch = false
    Domain.CanCollide = true
    local targetColor = Color3.new(0,0,0)
    local tweenInfo = TweenInfo.new(
        1,
        Enum.EasingStyle.Linear,
        Enum.EasingDirection.InOut,
        0,
        false
    )
    local fillTween = TweenService:Create(Highlight, tweenInfo, {
        FillColor = targetColor,
        OutlineColor = targetColor
    })
    fillTween:Play()

    -- Remove Domain
    wait(10)
    Domain.CanCollide = false
    for i = 0,11 do
        Domain.Transparency = Domain.Transparency + .1
        wait(.01)
    end
    Domain:Destroy()
    Baseplate:Destroy()
    Sphere:Destroy()
    TP:Disconnect()
    SFX:Destroy()
    for i,value in pairs(Caught) do
        local Name = string.split(value, ":")[1]
        local Position = string.split(value, ":")[2]
        local components = {}
        for component in Position:gmatch("[^,]+") do
            table.insert(components, tonumber(component))
        end
        local Position = Vector3.new(components[1], components[2], components[3])
        game:GetService("Players")[Name].Character.HumanoidRootPart.CFrame = CFrame.new(Position)
    end
end)