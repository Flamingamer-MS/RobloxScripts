local trigger = script.Parent
local door = trigger.Parent:FindFirstChild("d1") -- change this if your door part has a different name
local TweenService = game:GetService("TweenService")

local isOpen = false

local closedCFrame = door.CFrame
local openCFrame = closedCFrame * CFrame.new(-4, 0, 0) -- slides sideways relative to door

local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local openTween = TweenService:Create(door, tweenInfo, {CFrame = openCFrame})
local closeTween = TweenService:Create(door, tweenInfo, {CFrame = closedCFrame})

trigger.Touched:Connect(function(hit)
	local humanoid = hit.Parent:FindFirstChildOfClass("Humanoid")
	if humanoid and not isOpen then
		isOpen = true

		openTween:Play()
		openTween.Completed:Wait()

		task.wait(3)

		closeTween:Play()
		closeTween.Completed:Wait()

		isOpen = false
	end
end)