local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Oxiracetam/EXPS/main/HUD.lua'))()
local Flags = Library.Flags

local Window = Library:Window({
   Text = "Oxi's Trader"
})

local Tab = Window:Tab({
   Text = "Trade Simulator PWN"
})

--[[
local Tab2 = Window:Tab({
   Text = "Misc"
})
]]

local Section = Tab:Section({
   Text = "Automation"
})

local Section2 = Tab:Section({
   Text = "Miscellaneous",
   Side = "Right"
})

Section:Check({
   Text = "Auto Game",
   Callback = function(autogame)
      local Tower = game.ReplicatedStorage.Remotes:WaitForChild("Game_Start")
      local Interact = game.ReplicatedStorage.Remotes:WaitForChild("Game_Interact")

      while autogame do
         Tower:InvokeServer("Towers", {amount = 100})
         task.wait(3)

         for i = 1, 4 do
            Interact:InvokeServer("Towers", "Click", {row = i, val = 1})
            task.wait(0.1)
         end

         Interact:InvokeServer("Towers", "Cashout")
         print("Cashed Out!")
         task.wait(400)
      end
   end
})

--[[
Section:Check({
   Text = "AutoSnipe",
   Flag = "AutoSnipe"
})

Section:Check({
   Text = "Silent-Aim",
   Callback = function(bool)
       warn(bool)
   end
})
]]

Section:Dropdown({
   Text = "Item",
   List = {"Dominus", "LOL", "Random"},
   Callback = function(opt)
       warn(opt)
   end
})

Section:Slider({
   Text = "Price",
   Minimum = 0,
   Default = 1,
   Maximum = 100000000,
   --Postfix = "%",
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

Section2:Button({
   Text = "Self Destruct",
   Callback = function(destruct)
      Window:Destroy()
   end
})

Section2:Label({
   Text = "Status: Undetected",
   Color = Color3.fromRGB(100, 190, 31)
})

Tab:Select()
