local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local player = game:WaitForChild("Players").LocalPlayer
local vu = game:GetService("VirtualUser")
local TPService = game:GetService("TeleportService")
local promOver = game.CoreGui.RobloxPromptGui.promptOverlay
local Remotes = game.ReplicatedStorage.Remotes
local Gamestart = Remotes:WaitForChild("Game_Start")
local Interact = Remotes:WaitForChild("Game_Interact")
local afkr = Remotes:WaitForChild("AFK")
local tokens = player:WaitForChild("Tokens")

local delay = 60
local rows = 2

local Window = Rayfield:CreateWindow({
	Name = "Oxi's PWNER",
	LoadingTitle = "Oxi's PWNER Project",
	LoadingSubtitle = "by Oxi",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "rblx", -- Create a custom folder for your hub/game
		FileName = "Oxi Hub",
	},
	Discord = {
	 	Enabled= false,
		Invite = "", -- The Discord invite code, do not include discord.gg/
		RememberJoins = true, -- Set this to false to make them join the discord every time they load it up
	},
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "Oxi's Hub",
		Subtitle = "Key System",
		Note = "Oxi <3 U",
		FileName = "OxiKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "TestKey69",
	},
})

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Auto = Window:CreateTab("Auto") -- Title, Image

local Toggle = Auto:CreateToggle({ --Auto Tower
	Name = "Auto Towers",
	CurrentValue = false,
	Flag = "AutoTower", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
        while Value do
            Gamestart:InvokeServer("Towers", { amount = 100 })
            for i = 1, rows do
                Interact:InvokeServer("Towers", "Click", { row = i, val = 1 })
            end
            local x1 = tokens.Value
            Interact:InvokeServer("Towers", "Cashout")
            local x2 = tokens.Value
            if x2 == x1 then
                print("No Cash out")
            elseif x2 > x1 then
                warn("Cashed out $" .. (x2 - x1))
            end
            task.wait(delay)
            if Value == false then
                warn("BREAK")
                break
            end
        end
	end,
})

local Toggle = Auto:CreateToggle({ --Auto Mine
	Name = "Auto Mines",
	CurrentValue = false,
	Flag = "AutoMine", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		while Value do
            Gamestart:InvokeServer("Mines", { amount = 100 })
            for i = 1, rows do
                Interact:InvokeServer("Mines", "Click", { val = math.random(1, 25) })
            end
            local x1 = tokens.Value
            Interact:InvokeServer("Mines", "Cashout")
            local x2 = tokens.Value
            if x2 == x1 then
                print("No Cash out")
            elseif x2 > x1 then
                warn("Cashed out $" .. (x2 - x1))
            end
            task.wait(delay)
            if Value == false then
                warn("BREAK")
                break
            end
		end
	end,
})

local Slider = Auto:CreateSlider({ --Row Slider
	Name = "Rows",
	Range = { 1, 8 },
	Increment = 1,
	Suffix = "Rows/Mines",
	CurrentValue = 2,
	Flag = "GameRow", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		rows = Value
	end,
})

local Slider = Auto:CreateSlider({ --Game Delay
	Name = "Game Delay",
	Range = { 10, 720 },
	Increment = 10,
	Suffix = "s Delay",
	CurrentValue = 60,
	Flag = "GameDelay", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		delay = Value
	end,
})

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Misc = Window:CreateTab("Misc") -- Title, Image

local AntiAFK = Misc:CreateToggle({ --Anti AFK
	Name = "Anti AFK",
	CurrentValue = true,
	Flag = "AntiAFK", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value == true then
			game:GetService("Players").LocalPlayer.Idled:connect(function()
				vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
				task.wait()
				vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
				warn("Saved AFK Kick")
			end)

			if afkr ~= nil then
				afkr:FireServer(false)
				afkr:Destroy()
			end
		end
	end,
})

local AutoRejoin = Misc:CreateToggle({ --Auto Rejoin
	Name = "Auto Rejoin",
	CurrentValue = true,
	Flag = "AutoRejoin", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value == true then
			repeat
				task.wait()
			until game.CoreGui:FindFirstChild("RobloxPromptGui")

			promOver.ChildAdded:connect(function(x)
				if x.Name == "ErrorPrompt" then
					repeat
						TPService:Teleport(game.PlaceId)
						task.wait(1)
					until false
				end
			end)
		elseif Value ~= true then
		end
	end,
})

local SelfDestruct = Misc:CreateButton({ --Self Destruct
	Name = "Self Destruct",
	Callback = function()
		Rayfield:Destroy()
	end,
})

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Test = Window:CreateTab("Test", 4483362458) -- Title, Image

local xx = 1
local yy = 1
local zz = 100

local StartGame = Test:CreateButton({ --Start Game
	Name = "Start Game",
	Callback = function()
		Gamestart:InvokeServer("Towers", { amount = zz })
	end,
})

local TestTower = Test:CreateButton({ --Test Tower
	Name = "Test Tower",
	Callback = function()
		Interact:InvokeServer("Towers", "Click", { row = yy, val = xx })
	end,
})

local Cashout = Test:CreateButton({ --Cashout
	Name = "Cashout",
	Callback = function()
		local x1 = tokens.Value
		Interact:InvokeServer("Towers", "Cashout")
		local x2 = tokens.Value
		if x2 == x1 then
			print("No Cash out")
		elseif x2 > x1 then
			warn("Cashed out $" .. (x2 - x1))
		end
	end,
})

local nTower = Test:CreateSlider({ --Game Delay
	Name = "Tower",
	Range = { 1, 3 },
	Increment = 1,
	Suffix = "Tower",
	CurrentValue = 1,
	Flag = "nTower", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		xx = Value
	end,
})

local nStory = Test:CreateSlider({ --Game Delay
	Name = "Tower Story",
	Range = { 1, 8 },
	Increment = 1,
	Suffix = "Story",
	CurrentValue = 1,
	Flag = "nStory", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		yy = Value
	end,
})

local nStart = Test:CreateInput({
	Name = "Start Number",
	PlaceholderText = "Default: 100",
	RemoveTextAfterFocusLost = true,
	Callback = function(Text)
		zz = Text
	end,
})
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Rayfield:LoadConfiguration() --Auto Loads Previous Configuration
