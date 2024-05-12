local part = Instance.new("Part")
part.Size = Vector3.new(5, 6, 5)
part.Position = Vector3.new(4500, 4500, 0)
part.Anchored = true
part.CanCollide = true
part.CastShadow = false

local highlight = Instance.new("Highlight", part)
highlight.DepthMode = Enum.HighlightDepthMode.Occluded
highlight.FillTransparency = 0
highlight.OutlineColor = Color3.new(1, 1, 1)
highlight.FillColor = Color3.new(0, 0, 0)

local mesh = Instance.new("SpecialMesh")
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxassetid://12756704717"
mesh.TextureId = "rbxassetid://60484593"
mesh.Offset = Vector3.new(0, 0, 0)
mesh.Scale = Vector3.new(0, 0, 0)
mesh.VertexColor = Vector3.new(9e9, 9e9, 9e9)
mesh.Parent = part
part.Parent = workspace

local function checkPartsInArea()
    local region = Region3.new(part.Position - part.Size / 2, part.Position + part.Size / 2)
    local partsInRegion = workspace:FindPartsInRegion3(region, nil, math.huge)
    for _, foundPart in ipairs(partsInRegion) do
        if foundPart ~= part then
            print("Found part:", foundPart.Name)
        end
    end
end

while wait() do
    mesh.Scale = mesh.Scale + Vector3.new(0.0675, 0.0675, 0.0675)
    checkPartsInArea()
end
