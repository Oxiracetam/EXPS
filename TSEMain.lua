local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Oxiracetam/EXPS/main/HUD.lua'))()
local Flags = Library.Flags

local Window = Library:Window({
   Text = "Console"
})

local Tab = Window:Tab({
   Text = "Trade Simulator PWN"
})

local Section = Tab:Section({
   Text = "Auto Games"
})

local SectionR = Tab:Section({
   Text = "Miscellaneous",
   Side = "Right"
})

Section:Check({
   Text = "Auto Game",
   Callback = function(autogame)
      local Tower = game.ReplicatedStorage.Remotes:WaitForChild("Game_Start")
      local Interact = game.ReplicatedStorage.Remotes:WaitForChild("Game_Interact")

      while autogame == true do
         Tower:InvokeServer("Towers", {amount = 100})
         task.wait(3)

         for i = 1, rows do
            Interact:InvokeServer("Towers", "Click", {row = i, val = 1})
            task.wait(0.1)
         end

         Interact:InvokeServer("Towers", "Cashout")
         print("Cashed Out!")
         task.wait(delg)
      end
   end
})

Section:Slider({
   Text = "Rows",
   Minimum = 1,
   Default = 4,
   Maximum = 8,
   Callback = function(rows)
      print(rows)
   end
   return rows
})

Section:Slider({
   Text = "Delay (sec)",
   Minimum = 1,
   Default = 400,
   Maximum = 800,
   Callback = function(delg)
      print(delg)
   end
   return delg
})

Section:Slider({
   Text = "Pitch Offset",
   Minimum = 100,
   Default = 150,
   Maximum = 500,
   Callback = function(n)
       warn(n)
   end
})

SectionR:Check({
   Text = "Anti-AFK",
   Callback = function()
      local vu = game:GetService("VirtualUser")
      game:GetService("Players").LocalPlayer.Idled:connect(function()
	      vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	      task.wait()
	      vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
         warn("Saved AFK Kick")
      end)
   end
})

SectionR:Button({
   Text = "Self Destruct",
   Callback = function(destruct)
      warn("What are you talking about?")
   end
})

SectionR:Label({
   Text = "Status: Undetected",
   Color = Color3.fromRGB(100, 190, 31)
})

Tab:Select()


















--[[
   local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Rain-Design/PPHUD/main/Library.lua'))()
local Flags = Library.Flags

local Window = Library:Window({
   Text = "Baseplate"
})

local Tab = Window:Tab({
   Text = "Aiming"
})

local Tab2 = Window:Tab({
   Text = "Visual"
})

local Section = Tab:Section({
   Text = "Aiming"
})

local Section2 = Tab:Section({
   Text = "Anti-Aim"
})

local Section3 = Tab:Section({
   Text = "Ragebot",
   Side = "Right"
})

Section:Check({
   Text = "Aimbot",
   Flag = "Aimbot"
})

Section:Check({
   Text = "Silent-Aim",
   Callback = function(bool)
       warn(bool)
   end
})

Section:Dropdown({
   Text = "Body Part",
   List = {"Head", "Torso", "Random"},
   Callback = function(opt)
       warn(opt)
   end
})

Section:Slider({
   Text = "Hit Chance",
   Minimum = 0,
   Default = 60,
   Maximum = 100,
   Postfix = "%",
   Callback = function(n)
       warn(n)
   end
})

Section:Button({
   Text = "Spawn",
   Callback = function()
       warn("Settings Reseted.")
   end
})

Section2:Check({
   Text = "Spin"
})

Section2:Slider({
   Text = "Pitch Offset",
   Minimum = 100,
   Default = 150,
   Maximum = 500,
   Callback = function(n)
       warn(n)
   end
})

Section2:Slider({
   Text = "Yaw Offset",
   Minimum = 100,
   Default = 150,
   Maximum = 500,
   Callback = function(n)
       warn(n)
   end
})

Section2:Button({
   Text = "Resolve Positions"
})

Section3:Check({
   Text = "Auto-Wall",
   Callback = function(bool)
       warn(bool)
   end
})

Section3:Check({
   Text = "Trigger Bot"
})

Section3:Check({
   Text = "Insta-Kill"
})

Section3:Dropdown({
   Text = "Hitscan Directions",
   List = {"Left", "Right", "Up", "Down", "All"},
   Callback = function(opt)
       warn(opt)
   end
})

Section3:Label({
   Text = "Status: Undetected",
   Color = Color3.fromRGB(100, 190, 31)
})

Tab:Select()
]]