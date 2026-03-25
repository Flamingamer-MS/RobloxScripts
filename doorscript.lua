local trigger = script.Parent
local doorModel = trigger.Parent
local hinge = doorModel:FindFirstChildWhichIsA("HingeConstraint", true)

local isOpen = false
local busy = false

if not hinge then
	warn("No HingeConstraint found!")
	return
end

trigger.Touched:Connect(function(hit)
	if busy then return end
	
	local character = hit.Parent
	if not character then return end
	
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end
	
	busy = true
	
	if not isOpen then
		isOpen = true
		hinge.TargetAngle = 90
	else
		isOpen = false
		hinge.TargetAngle = 0
	end
	
	task.wait(1)
	busy = false
end)