local Lighting = game:GetService("Lighting")

-- SETTINGS
local CYCLE_LENGTH = 120 -- How many real-life seconds a full day lasts
local START_TIME = 8     -- What time the game starts (8 AM)

Lighting.ClockTime = START_TIME

-- The logic: 24 hours / length of cycle = how much to move per second
local waitTime = 1/30 -- Update 30 times a second for smoothness
local increment = (24 / CYCLE_LENGTH) * waitTime

while true do
	Lighting.ClockTime = Lighting.ClockTime + increment
	
	-- Optional: Print time to console to test (remove when done)
	-- print("Current Time: " .. Lighting.TimeOfDay)
	
	task.wait(waitTime)
end
