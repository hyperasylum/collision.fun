-- [[
-- collision.fun
-- ]]

local player = game.Players.LocalPlayer
local backpack = player.Backpack
local char = player.Character or player.CharacterAdded:Wait()
local root = char:FindFirstChild("HumanoidRootPart")
local hum = char:FindFirstChildOfClass("Humanoid")

local SPRAY_DUPE=true
local DUPE_AMOUNT=30
local PERMADEATH=true

if SPRAY_DUPE and root and hum then
	local h = workspace:FindFirstChild("Handle", true)
	if not h then return end

	h.CanCollide = false
	h.Transparency = 1

	local c = 0
	while c < DUPE_AMOUNT do
		h.CFrame = root.CFrame
		task.wait(.05)
		local s = char:FindFirstChild("Spray")
		if s then
			s.Parent = workspace
			task.wait()
			local h2 = s:FindFirstChild("Handle")
			if h2 then
				h2.CanCollide = false
				h2.Massless = true
			end
			c = c + 1
			if c % 5 == 0 then task.wait() end
		end
	end

	local pickups = {}
	for _,v in ipairs(workspace:GetChildren()) do
		if v:IsA("Tool") and v.Name == "Spray" then
			local h3 = v:FindFirstChild("Handle")
			if h3 then
				h3.CanCollide = false
				h3.Massless = true
			end
			table.insert(pickups, v)
		end
	end

	if #pickups > 0 then
		task.wait(.05)
		for _,v in ipairs(pickups) do
			if v:FindFirstChild("Handle") then
				v.Handle.CFrame = root.CFrame
			end
		end
		task.wait(.05)
		for _,v in ipairs(pickups) do
			v.Parent = char
		end
	end
end

for _,x in ipairs(char:GetChildren()) do
	if x:IsA("Tool") then
		x.Parent = backpack
	end
end

if PERMADEATH then
	replicatesignal(player.ConnectDiedSignalBackend)
	task.wait(game.Players.RespawnTime + .35)
	char:BreakJoints()
end

task.wait()

local tools = {}
local has = false

for _,v in ipairs(backpack:GetChildren()) do
	if v:IsA("Tool") and v.Name ~= "Foil" then
		table.insert(tools, v)
		v.Parent = char
		if v.Name == "Spray" then has = true end
	end
end

task.wait(.5)
char:BreakJoints()
task.wait(.5)
for _,v in ipairs(tools) do v.Parent = backpack end
task.wait()
for _,v in ipairs(tools) do v.Parent = char end
