local trigger = script.Parent
local door = trigger.Parent:FindFirstChild("d1") -- change to your real door part name
local TweenService = game:GetService("TweenService")

if not door then
	warn("Door part not found!")
	return
end

local isOpen = false
local busy = false

local hingeOffset = CFrame.new(-door.Size.X/2, 0, 0) -- hinge on left side
local closedCFrame = door.CFrame
local openCFrame = closedCFrame * hingeOffset * CFrame.Angles(0, math.rad(35), 0) * hingeOffset:Inverse()

local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local openTween = TweenService:Create(door, tweenInfo, {CFrame = openCFrame})
local closeTween = TweenService:Create(door, tweenInfo, {CFrame = closedCFrame})

trigger.Touched:Connect(function(hit)
	if busy then return end

	local character = hit.Parent
	if not character then return end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	busy = true

	if not isOpen then
		isOpen = true
		openTween:Play()
		openTween.Completed:Wait()

		task.wait(2)

		closeTween:Play()
		closeTween.Completed:Wait()

		isOpen = false
	end

	task.wait(0.2)
	busy = false
end)