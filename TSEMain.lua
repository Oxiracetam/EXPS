local library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
local Wait = library.subs.Wait -- Only returns if the GUI has not been terminated. For 'while Wait() do' loops

local OxiMain = library:CreateWindow({
Name = "Pepsi's World",
Themeable = {
Info = "xaxxaxaxa"
}
})

local GeneralTab = OxiMain:CreateTab({
Name = "General"
})

--[[
local FarmingSection = GeneralTab:CreateSection({
Name = "Farming"
})
FarmingSection:AddToggle({
Name = "EXP Grinder",
Flag = "FarmingSection_EXPGrinder"
})
FarmingSection:AddToggle({
Name = "Trick Spammer",
Flag = "FarmingSection_TrickSpammer",
Keybind = 1,
Callback = print
})
FarmingSection:AddSlider({
Name = "Trick Rate",
Flag = "FarmingSection_TrickRate",
Value = 0.15,
Precise = 2,
Min = 0,
Max = 1
})
FarmingSection:AddToggle({
Name = "TP To Coins",
Flag = "FarmingSection_TPCoins"
})
FarmingSection:AddToggle({
Name = "Collect Coins",
Flag = "FarmingSection_CollectCoins",
Callback = print
})
FarmingSection:AddSlider({
Name = "Coin Distance",
Flag = "FarmingSection_CoinDistance",
Value = 175,
Min = 0,
Max = 200,
Format = function(Value)
if Value == 0 then
return "Collection Distance: Infinite"
else
return "Collection Distance: " .. tostring(Value)
end
end
})

local BoardControlSection = GeneralTab:CreateSection({
Name = "Board Control"
})
BoardControlSection:AddToggle({
Name = "Anti Trip/Ragdoll",
Flag = "BoardControlSection_AntiTripRagdoll",
Callback = print
})
BoardControlSection:AddToggle({
Name = "No Wear & Tear",
Flag = "BoardControlSection_NoWearTear"
})
BoardControlSection:AddToggle({
Name = "No Trick Cooldown",
Flag = "BoardControlSection_NoTrickCooldown",
Callback = print
})
BoardControlSection:AddToggle({
Name = "Extend Combo Timout",
Flag = "BoardControlSection_ExtendComboTimeout"
})
BoardControlSection:AddSlider({
Name = "Timeout Extension",
Flag = "BoardControlSection_CoinDistance",
Value = 3,
Min = 0,
Max = 20,
Format = function(Value)
if Value == 0 then
return "Combo Timeout: Never"
else
return "Combo Timeout: " .. tostring(Value) .. "s"
end
end
})

local MiscSection = GeneralTab:CreateSection({
Name = "Misc",
Side = "Right"
})
MiscSection:AddToggle({
Name = "Unlock Gamepasses",
Flag = "MiscSection_UnlockGamepasses",
Callback = print
})
MiscSection:AddToggle({
Name = "Auto Compete",
Flag = "MiscSection_AutoCompete",
Callback = print
})
MiscSection:AddButton({
Name = "Repair Board",
Callback = function()
print("Fixed")
end
})
MiscSection:AddKeybind({
Name = "Test Key",
Callback = print
})
MiscSection:AddToggle({
Name = "Test Toggle/Key",
Keybind = {
Mode = "Dynamic" -- Dynamic means to use the 'hold' method, if the user keeps the button pressed for longer than 0.65 seconds; else use toggle method
},
Callback = print
})

local FunSection = GeneralTab:CreateSection({
Name = "Fun Cosmetics"
})
FunSection:AddToggle({
Name = "Ragdoll Assumes Flight",
Flag = "FunSection_AssumesFlight"
})
FunSection:AddToggle({
Name = "Ragdoll On Player Collision",
Flag = "FunSection_RagdollOnPlayerCollision"
})
FunSection:AddToggle({
Name = "Un-Ragdoll When Motionless",
Flag = "FunSection_UnRagdollWhenMotionless"
})
FunSection:AddToggle({
Name = "Extend Ragdoll Duration",
Flag = "FunSection_ExtendRagdollDuration"
})
FunSection:AddSlider({
Name = "Coin Distance",
Flag = "FarmingSection_Coin Distance",
Value = 4,
Min = 0,
Max = 60,
Textbox = true,
Format = function(Value)
if Value == 0 then
return "Ragdoll Extension: Indefinite"
else
return "Ragdoll Extension: " .. tostring(Value) .. "s"
end
end
})
]]





















local delay = 0
local rows = 0

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
         task.wait(delay)
      end
   end
})

Section:Slider({
   Text = "Rows",
   Minimum = 1,
   Default = 4,
   Maximum = 8,
   Callback = function(n)
      rows = n
      print(n)
   end
})

Section:Slider({
   Text = "Delay (sec)",
   Minimum = 1,
   Default = 400,
   Maximum = 800,
   Callback = function(n)
      delay = n
      print(n)
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
      loadstring(game:HttpGet('https://raw.githubusercontent.com/Oxiracetam/EXPS/main/TSEMain.lua'))()
      warn("What are you talking about?")
   end
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