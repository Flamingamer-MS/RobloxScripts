local door = script.Parent
local TweenService = game:GetService("TweenService")

local opened = false
local debounce = false

local closedCFrame = door.CFrame
local openCFrame = door.CFrame * CFrame.new(0, 0, -5)

local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local openTween = TweenService:Create(door, tweenInfo, {CFrame = openCFrame})
local closeTween = TweenService:Create(door, tweenInfo, {CFrame = closedCFrame})

door.Touched:Connect(function(hit)
	if debounce or opened then return end

	local character = hit.Parent
	if not character then return end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		debounce = true
		opened = true
		
		openTween:Play()
		openTween.Completed:Wait()

		task.wait(3)

		closeTween:Play()
		closeTween.Completed:Wait()

		opened = false
		debounce = false
	end
end)