-- Testing CFrame Lerp Animating
-- ( Thanks rufus14 )

-- Variables & Functions
local Player = owner
local Character = Player.Character
Character.Animate.Enabled = false
Walking = false
Sine = 0

-- SFX
local Footstep = Instance.new("Sound", Character.Head)
Footstep.Name = "Footstep"
Footstep.SoundId = "rbxassetid://4113577407"
Footstep.Looped = true
Footstep.Volume = 0
Footstep:Play()

-- Motor6D's
local Neck = Character["Torso"].Neck
Neck.C1 = CFrame.new(0,0,0)
local leftShoulder = Character["Torso"]["Left Shoulder"]
leftShoulder.C1 = CFrame.new(0,0,0)
local rightShoulder = Character["Torso"]["Right Shoulder"]
rightShoulder.C1 = CFrame.new(0,0,0)
local leftHip = Character["Torso"]["Left Hip"]
leftHip.C1 = CFrame.new(0,0,0)
local righthip = Character["Torso"]["Right Hip"]
righthip.C1 = CFrame.new(0,0,0)
local Step = game:GetService("RunService").Stepped
if Character:findFirstChild("HumanoidRootPart") then
	if Character.HumanoidRootPart:findFirstChild("RootJoint") then
		Root = Character.HumanoidRootPart.RootJoint
		Root.C1 = CFrame.new(0,0,0)
	elseif Character.HumanoidRootPart:findFirstChild("Root Hip") then
		Root = Character.HumanoidRootPart["Root Hip"]
		Root.C1 = CFrame.new(0,0,0)
	end
else
	Character.Humanoid.Health = 0
end

-- Animation Handling
function walkAnimation(walkSpeed)
	if walkSpeed > 2 then
		Walking = true
	else
		Walking = false
	end
end
Character.Humanoid.Running:connect(walkAnimation)

while Step:wait() do
	Sine = Sine + 1
	if not Walking then
        Footstep.Volume = 0
		-- Head
		Neck.C0 = Neck.C0:lerp(CFrame.new(0,1.2,0) * CFrame.Angles(math.sin(Sine/30)/10,0,0) * CFrame.new(0,0.25,0),0.1)
		-- Legs
		righthip.C0 = righthip.C0:lerp(CFrame.new(0.5,-1-math.cos(Sine/30)/15,0) * CFrame.Angles(math.rad(10+(2*math.sin(-Sine/30))),0,-math.sin(Sine/60)/10) * CFrame.new(0,-1,0),0.1)
		leftHip.C0 = leftHip.C0:lerp(CFrame.new(-0.5,-1-math.cos(Sine/30)/15,0) * CFrame.Angles(math.rad(10+(2*math.sin(-Sine/30))),0,-math.sin(Sine/60)/10) * CFrame.new(0,-1,0),0.1)
		-- Torso
		Root.C0 = Root.C0:lerp(CFrame.new(0,math.cos(Sine/30)/15,0) * CFrame.Angles(math.rad(-10+(2*math.sin(Sine/30))),0,math.sin(Sine/60)/15),0.1)
		-- Arms
		rightShoulder.C0 = rightShoulder.C0:lerp(CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(20)+math.rad(5*math.sin(Sine/30)),0,math.rad(5*math.cos(Sine/30)/2)) * CFrame.new(0,-0.5,0),0.1)
		leftShoulder.C0 = leftShoulder.C0:lerp(CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(20)-math.rad(5*math.sin(Sine/30)),0,-math.rad(5*math.cos(Sine/30)/2)) * CFrame.new(0,-0.5,0),0.1)
	end
	if Walking then
        Footstep.Volume = .5
		leftShoulder.C0 = leftShoulder.C0:lerp(CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(100-math.cos(Sine/5)*10),0,math.rad(math.sin(Sine/10)*10)) * CFrame.new(0,-0.5,0),0.1)
		rightShoulder.C0 = rightShoulder.C0:lerp(CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(100-math.cos(Sine/5)*10),0,math.rad(math.sin(Sine/10)*10)) * CFrame.new(0,-0.5,0),0.1)
		Neck.C0 = Neck.C0:lerp(CFrame.new(0,1.2,0) * CFrame.Angles(math.rad(10+math.cos(Sine/5)*6),0,0) * CFrame.new(0,0.25,0),0.1)
		Root.C0 = Root.C0:lerp(CFrame.new(0,math.sin(Sine/5)/9,0) * CFrame.Angles(math.rad(-15),0,math.cos(Sine/10)/6),0.1)
		righthip.C0 = righthip.C0:lerp(CFrame.new(0.5,-1+math.cos(Sine/10)/3,-math.cos(Sine/10)/3) * CFrame.Angles(math.sin(Sine/10),0,0) * CFrame.new(0,-1,0),0.1)
		leftHip.C0 = leftHip.C0:lerp(CFrame.new(-0.5,-1-math.cos(Sine/10)/3,math.cos(Sine/10)/3) * CFrame.Angles(-math.sin(Sine/10),0,0) * CFrame.new(0,-1,0),0.1)
	end
end