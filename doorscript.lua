local trigger = script.Parent
local doorModel = trigger.Parent
local hinge = doorModel:FindFirstChildWhichIsA("HingeConstraint", true)

local busy = false
local isOpen = false

if not hinge then
	warn("No HingeConstraint found!")
	return
end

local OPEN_ANGLE = 35
local CLOSED_ANGLE = 0

trigger.Touched:Connect(function(hit)
	if busy then return end

	local character = hit.Parent
	if not character then return end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	busy = true

	if isOpen then
		hinge.TargetAngle = CLOSED_ANGLE
		isOpen = false
	else
		hinge.TargetAngle = OPEN_ANGLE
		isOpen = true
	end

	task.wait(1)
	busy = false
end)