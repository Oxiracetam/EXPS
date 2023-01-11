repeat
	task.wait()
until game:IsLoaded()

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local vu = game:GetService("VirtualUser")
local TPService = game:GetService("TeleportService")
local Workspace = game:GetService("Workspace")
local player = game:WaitForChild("Players").LocalPlayer
local character = player:GetCharacter()
local promOver = game.CoreGui.RobloxPromptGui:WaitForChild("promptOverlay")
local Remotes = game.ReplicatedStorage:WaitForChild("Remotes")
local RecentListings = Workspace.RecentListings.Board.SurfaceGui:WaitForChild("ScrollingFrame")
local ItemSpawns = Workspace:WaitForChild("ItemSpawns")
local Gamestart = Remotes:WaitForChild("Game_Start")
local Interact = Remotes:WaitForChild("Game_Interact")
local Getiteminfo = Remotes:WaitForChild("GetItemInfo")
local Purchase1 = Remotes:WaitForChild("Purchase1")
local PurchaseL = Remotes:WaitForChild("PurchaseL")
local afkr = Remotes:WaitForChild("AFK")
local tokens = player:WaitForChild("Tokens")

local delay = 60
local rows = 2
local listingP = 100
local ItemN = "Item Name"

-----FUNCS-----
local function cashout()
	local x1 = tokens.Value
	Interact:InvokeServer("Towers", "Cashout")
	local x2 = tokens.Value

	if x2 == x1 then
		print("No Cash out")
	elseif x2 > x1 then
		warn("Cashed out $" .. (x2 - x1))
	end
end

local function autosnipe(bool)
	if bool == true then
		Getiteminfo:InvokeServer(ItemN)
		Purchase1:InvokeServer(ItemN)

		warn("PURCHASED: " .. ItemN)
	end
end

local function itemspawnesp(bool)
   if bool == true then
      while bool do
         local spawns = ItemSpawns:GetChildren()

         for i = 1, #spawns do
            if spawns[i] ~= nil and spawns[i].Billboard == nil then
               local Billboard = Instance.new("BillboardGui")
               Billboard.Parent = spawns[i]
               local Text = Instance.new("TextLabel")
               Text.Parent = Billboard
               Text.BackgroundTransparency = 1
               Text.Text = "ITEM DROP"
            end
         end
         task.wait()
      end
   end
end

local function recentsnipe(bool)
	if bool == true then
		while bool do
			local listingN = RecentListings:GetChildren()
			local bought = {}

			for i = 1, #listingN do
				if listingN[i] ~= nil and listingN[i].Name == "Item" then
					local item = listingN[i].ItemName.Text
					local pprice = listingN[i]:FindFirstChild("Price")
					local price = pprice.Text
					local newprice = price.gsub(price, "%D", "")
					local nnewprice = tonumber(newprice)

					if nnewprice <= listingP and item ~= bought then
						Getiteminfo:InvokeServer(item)
						PurchaseL:InvokeServer(item)
						table.insert(bought, item)
						print(bought)
						warn("PURCHASED: " .. item)
						Rayfield:Notify({
							Title = "Recent Item Snipe",
							Content = "You Bought: " .. item .. "!",
							Duration = 5,
							Image = 4483362458,
							Actions = { -- Notification Buttons
								Ignore = {
									Name = "Okay!",
									Callback = function() end,
								},
							},
						})
					end
				end
			end
			task.wait()
		end
	end
end

local function autotower(bool)
	if bool == true then
		while bool == true do
			Gamestart:InvokeServer("Towers", { amount = 100 })

			for i = 1, rows do
				Interact:InvokeServer("Towers", "Click", { row = i, val = 1 })
			end

			cashout()
			task.wait(delay)

			if bool == false then
				warn("BREAK")
				break
			end
		end
	end
end

local function automine(bool)
	if bool == true then
		while bool == true do
			Gamestart:InvokeServer("Mines", { amount = 100 })

			for i = 1, rows do
				Interact:InvokeServer("Mines", "Click", { val = math.random(1, 25) })
			end

			cashout()
			task.wait(delay)

			if bool == false then
				warn("BREAK")
				break
			end
		end
	end
end

local function antiafk(bool)
	if bool == true then
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

		warn("ANTI AFK ENABLED!")
	end
end

local function autorejoin(bool)
	if bool == true then
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

		warn("AUTO REJOIN ENABLED!")
	end
end

-----UI-----

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
		Enabled = false,
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
local AutoS = Window:CreateTab("Auto Snipe") -- Title, Image

local AutoSnipeListing = AutoS:CreateToggle({ --Auto Snipe
	Name = "Auto Snipe Listing",
	CurrentValue = false,
	Flag = "AutoSnipeListing",
	Callback = function(Value)
		recentsnipe(Value)
	end,
})

local priceSlider = AutoS:CreateSlider({ --Row Slider
	Name = "Listing Price",
	Range = { 1, 1000 },
	Increment = 10,
	Suffix = "Price",
	CurrentValue = listingP,
	Flag = "GameRow", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		listingP = Value
	end,
})

local AutoSnipeNew = AutoS:CreateToggle({ --Auto Snipe
	Name = "Auto Snipe New",
	CurrentValue = false,
	Flag = "AutoSnipeNew",
	Callback = function(Value)
		autosnipe(Value)
	end,
})

local SnipeItem = AutoS:CreateInput({
	Name = "Autosnipe Item",
	PlaceholderText = ItemN,
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		ItemN = Text
		print(Text)
	end,
})

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Auto = Window:CreateTab("Auto Game") -- Title, Image

local AutoTower = Auto:CreateToggle({ --Auto Tower
	Name = "Auto Towers",
	CurrentValue = false,
	Flag = "AutoTower", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		autotower(Value)
	end,
})

local AutoMine = Auto:CreateToggle({ --Auto Mine
	Name = "Auto Mines",
	CurrentValue = false,
	Flag = "AutoMine", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		automine(Value)
	end,
})

local rowSlider = Auto:CreateSlider({ --Row Slider
	Name = "Rows",
	Range = { 1, 8 },
	Increment = 1,
	Suffix = "Rows/Mines",
	CurrentValue = rows,
	Flag = "GameRow", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		rows = Value
	end,
})

local delaySlider = Auto:CreateSlider({ --Game Delay
	Name = "Game Delay",
	Range = { 10, 720 },
	Increment = 10,
	Suffix = "s Delay",
	CurrentValue = delay,
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
		antiafk(Value)
	end,
})

local AutoRejoin = Misc:CreateToggle({ --Auto Rejoin
	Name = "Auto Rejoin",
	CurrentValue = true,
	Flag = "AutoRejoin", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		autorejoin(Value)
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
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		zz = Text
	end,
})

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Rayfield:LoadConfiguration() --Auto Loads Previous Configuration
antiafk(true)
autorejoin(true)
