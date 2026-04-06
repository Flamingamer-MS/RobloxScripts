local Lighting = game:GetService("Lighting")

-- CONFIGURATION
local minutesPerSecond = 0.1 -- How many game minutes pass every real second
local startTime = 8          -- The game starts at 8:00 AM

Lighting.ClockTime = startTime

-- THE LOOP
while true do
	-- Increment the time
	Lighting.ClockTime = Lighting.ClockTime + (minutesPerSecond / 60)
	
	-- Wait a tiny bit before updating again (makes it smooth)
	task.wait(1/30) 
end
