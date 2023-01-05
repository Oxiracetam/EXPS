local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Remotes = game.ReplicatedStorage.Remotes
local Tower = Remotes:WaitForChild("Game_Start")
local Interact = Remotes:WaitForChild("Game_Interact")
local afkr = Remotes:WaitForChild("AFK")
local delay = 0
local rows = 0

local Window = Library:NewWindow("Oxi's Trader")
local General = Window:NewSection("Automation")

General:CreateToggle("Anti Afk", function(value)
   if value ~= true then
      value = true
   elseif value == true then
      if afkr ~= nil then
         afkr:Destroy()
      end
      local vu = game:GetService("VirtualUser")
      game:GetService("Players").LocalPlayer.Idled:connect(function()
	      vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	      task.wait()
	      vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
         warn("Saved AFK Kick")
      end)
   end
end)

General:CreateToggle("Auto Games", function(value)
   while value == true do
      if value == true then
         Tower:InvokeServer("Towers", {amount = 100})
         task.wait(3)
         for i = 1, rows do
            Interact:InvokeServer("Towers", "Click", {row = i, val = 1})
            task.wait(1)
         end
         Interact:InvokeServer("Towers", "Cashout")
         print("Attempted Cashed Out!")
         task.wait(delay)
      end
   end
end)

General:CreateSlider("Rows", 1, 8, 4, false, function(value)
   rows = value
end)

General:CreateSlider("Delay (sec)", 1, 650, 600, false, function(value)
   delay = value
end)








--[[

KillingCheats:CreateButton("Button", function()
   print("HI")
end)

KillingCheats:CreateTextbox("TextBox", function(text)
   print(text)
end)

KillingCheats:CreateToggle("Auto Ez", function(value)
   print(value)
end)

KillingCheats:CreateDropdown("DropDown", {"Hello", "World", "Hello World"}, 2, function(text)
   print(text)
end)

KillingCheats:CreateSlider("Slider", 0, 100, 15, false, function(value)
   print(value)
end)

KillingCheats:CreateColorPicker("Picker", Color3.new(255, 255, 255), function(value)
   print(value)
end)

]]