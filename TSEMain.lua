local startTick = tick()

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/cueshut/saves/main/octohook%20ui%20lib"))({cheatname = "", gamename = ""})
library:init()

local menu = library.NewWindow({title = "wwwwww bob", size = UDim2.new(0, 500, 0.7, 20.7)})

---Tabs
local HomeTab = menu:AddTab("Home")

local AimingTab = menu:AddTab("Aiming")

local BlantantTab = menu:AddTab("Blantant")

local VisualsTab = menu:AddTab("Visuals")

local MiscellaneousTab = menu:AddTab("Miscellaneous")

local SettingsTab = library:CreateSettingsTab(menu)

---Sections
local MiscellaneousTab = MiscellaneousTab:AddSection("Test", 1)

local MiscellaneousTab2 = MiscellaneousTab:AddSection("Test", 2)

---Separators
local Test = MiscellaneousTab:AddSection("Section", 2)

MiscellaneousTab:AddSeparator({text = "Separator"})

MiscellaneousTab:AddBox({text = "Box", flag = ""})

---Functions
MiscellaneousTab:AddToggle(
   {
       text = "Toggle",
       flag = "",
       callback = function(bool)
           if bool then
               print("Toggle")
           else
               print("Untoggle")
           end
       end
   }
)

MiscellaneousTab:AddButton(
   {
       text = "Button",
       confirm = false,
       callback = function()
           Print("Button")
       end
   }
)

MiscellaneousTab:AddBind(
   {
       text = "Keybind",
       flag = "",
       nomouse = true,
       noindicator = true,
       bind = Enum.KeyCode.BackSlash,
       callback = function()
           Print("666")
       end
   }
)

MiscellaneousTab:AddButton(
   {
       text = "Notification Sucess",
       callback = function()
           if res.Success then
               library:SendNotification(library.cheatname .. " | asss", 3)
           end
       end
   }
)

MiscellaneousTab:AddButton(
   {
       text = "Notification Error",
       callback = function()
           if res.Error then
               library:SendNotification(library.cheatname .. " | ass!", 3)
           end
       end
   }
)

MiscellaneousTab:AddSlider({text = " Slider", flag = '"', suffix = "%", min = 0, max = 100, increment = .1})

MiscellaneousTab:AddColor(
   {
       text = "Color",
       flag = "",
       callback = function()
       end
   }
)

MiscellaneousTab:AddList(
   {
       text = "List",
       flag = "",
       values = themeStrings,
       callback = function()
       end
   }
)













--[[


local delay = 0
local rows = 0

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

      local vu = game:GetService("VirtualUser")
      game:GetService("Players").LocalPlayer.Idled:connect(function()
	      vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	      task.wait()
	      vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
         warn("Saved AFK Kick")
      end)


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

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
	vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	task.wait()
	vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   warn("Saved AFK Kick")


]]