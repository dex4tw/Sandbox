local sphereRadius = 10
local sphereResolution = 1
local function isInsideSphere(position, radius)
    return position.magnitude < radius
end
for x = -sphereRadius, sphereRadius, sphereResolution do
    for y = -sphereRadius, sphereRadius, sphereResolution do
        for z = -sphereRadius, sphereRadius, sphereResolution do
            local position = Vector3.new(x, y, z)
            if isInsideSphere(position, sphereRadius) then
                -- Create a part at this position
                local part = Instance.new("Part")
                part.Size = Vector3.new(sphereRadius, sphereRadius, sphereRadius)
                part.Position = position
                part.Anchored = true
                part.Parent = game.Workspace
            end
        end
    end
end
