local door = script.Parent
local tweenService = game:GetService("TweenService")

local isOpen = false

local closedPosition = door.Position
local openPosition = door.Position + Vector3.new(0, 0, -5)

local tweenInfo = TweenInfo.new(1)
local openTween = tweenService:Create(door, tweenInfo, {Position = openPosition})
local closeTween = tweenService:Create(door, tweenInfo, {Position = closedPosition})

door.Touched:Connect(function(hit)
    local humanoid = hit.Parent:FindFirstChild("Humanoid")

    if humanoid and not isOpen then
        isOpen = true
        openTween:Play()

        task.wait(3)
        closeTween:Play()
        isOpen = false
    end
end)
