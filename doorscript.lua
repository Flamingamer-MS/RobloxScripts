local trigger = script.Parent
local model = trigger.Parent
local TweenService = game:GetService("TweenService")

local leftDoor = model:FindFirstChild("d1")
local rightDoor = model:FindFirstChild("d2")

if not leftDoor or not rightDoor then
	warn("Couldn't find d1 and d2!")
	return
end

local isOpen = false
local busy = false

local OPEN_ANGLE = math.rad(35)

-- Save original positions
local leftClosed = leftDoor.CFrame
local rightClosed = rightDoor.CFrame

-- Pivot from opposite outer edges
local leftHingeOffset = CFrame.new(-leftDoor.Size.X / 2, 0, 0)
local rightHingeOffset = CFrame.new(rightDoor.Size.X / 2, 0, 0)

-- Make both doors swing away from the center
local leftOpen = leftClosed * leftHingeOffset * CFrame.Angles(0, -OPEN_ANGLE, 0) * leftHingeOffset:Inverse()
local rightOpen = rightClosed * rightHingeOffset * CFrame.Angles(0, OPEN_ANGLE, 0) * rightHingeOffset:Inverse()

local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

local leftOpenTween = TweenService:Create(leftDoor, tweenInfo, {CFrame = leftOpen})
local leftCloseTween = TweenService:Create(leftDoor, tweenInfo, {CFrame = leftClosed})

local rightOpenTween = TweenService:Create(rightDoor, tweenInfo, {CFrame = rightOpen})
local rightCloseTween = TweenService:Create(rightDoor, tweenInfo, {CFrame = rightClosed})

trigger.Touched:Connect(function(hit)
	if busy or isOpen then return end

	local character = hit.Parent
	if not character then return end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	busy = true
	isOpen = true

	leftOpenTween:Play()
	rightOpenTween:Play()

	task.wait(2.5)

	leftCloseTween:Play()
	rightCloseTween:Play()

	task.wait(1)
	isOpen = false
	busy = false
end)