-- collision.fun, barebones
-- literally the basics to it

local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local char = player.Character or player.CharacterAdded:Wait()
task.wait()
local tools = {}

for _,v in ipairs(backpack:GetChildren()) do
	if v:IsA("Tool") then
		table.insert(tools, v)
		v.Parent = char
	end
end
task.wait()
char:BreakJoints()

for _,v in ipairs(tools) do
	v.Parent = backpack
end
task.wait()
for _,v in ipairs(tools) do
	v.Parent = char
end
