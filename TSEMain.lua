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
   Text = "Auto"
})

local Section2 = Tab:Section({
   Text = "Misc",
   Side = "Right"
})

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
   Text = "Auto-Wall",
   Callback = function(bool)
       warn(bool)
   end
})

Section2:Label({
   Text = "Status: Undetected",
   Color = Color3.fromRGB(100, 190, 31)
})

Tab:Select()
