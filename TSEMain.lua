local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Remotes = game.ReplicatedStorage.Remotes
local Gamestart = Remotes:WaitForChild("Game_Start")
local Interact = Remotes:WaitForChild("Game_Interact")
local afkr = Remotes:WaitForChild("AFK")
local player = game:WaitForChild("Players").LocalPlayer
local tokens = player:WaitForChild("Tokens")
local delay = 600
local rows = 3

local Window = Library:NewWindow("Oxi's Trader")

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
local General = Window:NewSection("Automation")

------------------------------------------------------------------------------------------------------------------------------------------------------------
General:CreateToggle("Auto Games", function(value)
   while value == true do
      if value == true then
         local x1 = tokens.Value
         Gamestart:InvokeServer("Towers", {amount = 100})
         task.wait(3)
         for i = 1, rows do
            Interact:InvokeServer("Towers", "Click", {row = i, val = 1})
            task.wait(1)
         end
         Interact:InvokeServer("Towers", "Cashout")
         task.wait(1)
         local x2 = tokens.Value
         if x2 == x1 then
            error("No Cash out")
         elseif x2 > x1 then
            warn("Cashed out $" .. (x2 - x1))
         end
         task.wait(delay)
      end
   end
end)

General:CreateSlider("Rows", 1, 8, 3, false, function(value)
   rows = value
end)

General:CreateSlider("Delay (sec)", 1, 650, 600, false, function(value)
   delay = value
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
local Misc = Window:NewSection("Misc")

------------------------------------------------------------------------------------------------------------------------------------------------------------
Misc:CreateToggle("Anti Afk", function(value)
   if value ~= true then
      value = true
   elseif value == true then
      if afkr ~= nil then
         afkr:Destroy()
      end
      local vu = game:GetService("VirtualUser")
      game:GetService("Players").LocalPlayer:WaitForChild("Idled"):connect(function()
	      vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	      task.wait()
	      vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
         warn("Saved AFK Kick")
      end)
   end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
local Test = Window:NewSection("Test")

local xx = 1
local yy = 1
------------------------------------------------------------------------------------------------------------------------------------------------------------
Test:CreateButton("Test Tower", function()
   Interact:InvokeServer("Towers", "Click", {row = yy, val = xx})
end)

Test:CreateButton("Start Tower Game", function()
   Gamestart:InvokeServer("Towers", {amount = 100})
end)

Test:CreateButton("Cash Out", function()
   local x1 = tokens.Value
   Interact:InvokeServer("Towers", "Cashout")
   task.wait(1)
   local x2 = tokens.Value
         if x2 == x1 then
            error("No Cash out")
         elseif x2 > x1 then
            warn("Cashed out $" .. (x2 - x1))
         end
end)

Test:CreateSlider("Tower", 1, 3, 1, false, function(value)
   
   xx = value
end)

Test:CreateSlider("Row", 1, 8, 1, false, function(value)
   
   yy = value
end)























--[[

General:CreateButton("Button", function()
   print("HI")
end)

General:CreateTextbox("TextBox", function(text)
   print(text)
end)

General:CreateToggle("Auto Ez", function(value)
   print(value)
end)

General:CreateDropdown("DropDown", {"Hello", "World", "Hello World"}, 2, function(text)
   print(text)
end)

General:CreateSlider("Slider", 0, 100, 15, false, function(value)
   print(value)
end)

General:CreateColorPicker("Picker", Color3.new(255, 255, 255), function(value)
   print(value)
end)

]]