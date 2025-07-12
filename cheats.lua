-- [ESP] --

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

-- Function to highlight all players
local function highlightPlayers()
    for _, player in pairs(Players:GetPlayers()) do
        local character = player.Character
        if character then
            for _, child in pairs(character:GetChildren()) do
                if child:IsA("BasePart") then
                    child.BrickColor = BrickColor.new("Orange")
                end
            end
        end
    end
end

-- Function to reset the highlight
local function resetHighlight()
    for _, player in pairs(Players:GetPlayers()) do
        local character = player.Character
        if character then
            for _, child in pairs(character:GetChildren()) do
                if child:IsA("BasePart") then
                    child.BrickColor = BrickColor.new("White")
                end
            end
        end
    end
end

-- Bind the ALT+U key press to the highlightPlayers function
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.U and input.UserInputType == Enum.UserInputType.Keyboard and UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) then
        highlightPlayers()
    end
end)

-- Bind the ALT+U key release to the resetHighlight function
UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.U and input.UserInputType == Enum.UserInputType.Keyboard and not UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) then
        resetHighlight()
    end
end)

-- [END OF ESP] --

-- [GIVE ALL TOOL] --

-- Function to give every tool to the local player
local function giveTools()
    local localPlayer = Players.LocalPlayer
    if localPlayer and localPlayer.Character then
        for _, tool in pairs(game.Workspace:GetDescendants()) do
            if tool:IsA("Tool") and tool.Parent ~= localPlayer.Backpack then
                tool.Parent = localPlayer.Backpack
            end
        end
    end
end

-- Function to take away all tools from the local player
local function takeAwayTools()
    local localPlayer = Players.LocalPlayer
    if localPlayer and localPlayer.Backpack then
        for _, tool in pairs(localPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") then
                tool.Parent = game.Workspace
            end
        end
    end
end

-- Bind the 8+ALT key press to the giveTools function
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.D8 and input.UserInputType == Enum.UserInputType.Keyboard and UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) then
        giveTools()
    end
end)

-- Bind the 8+ALT key release to the takeAwayTools function
UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.D8 and input.UserInputType == Enum.UserInputType.Keyboard and not UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) then
        takeAwayTools()
    end
end)

-- [END OF GIVE ALL] --

-- [FLY] --

local Chat = game:GetService("Chat")

local function toggleFly(player, value)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = value and 50 or 16
            humanoid.JumpPower = value and 50 or 50
            -- Gravity is not a property of Humanoid, so we skip that
        end
    end
end

local function onFlyChatCommand(player, message)
    if string.lower(message) == "/e fly" then
        toggleFly(player, true)
    elseif string.lower(message) == "/e nofly" then
        toggleFly(player, false)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        onFlyChatCommand(player, message)
    end)
end)

if Players.LocalPlayer then
    Players.LocalPlayer.Chatted:Connect(function(message)
        onFlyChatCommand(Players.LocalPlayer, message)
    end)
end

-- [END OF FLY] --

-- [NOCLIP] --

local function makePassThrough(character)
    for _, child in pairs(character:GetDescendants()) do
        if child:IsA("BasePart") then
            child.CanCollide = false
        end
    end
end

local function onNoclipChatCommand(player, message)
    if string.lower(message:sub(1, 5)) == "/pass" then
        local character = player.Character
        if character then
            makePassThrough(character)
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        onNoclipChatCommand(player, message)
    end)
end)

if Players.LocalPlayer then
    Players.LocalPlayer.Chatted:Connect(function(message)
        onNoclipChatCommand(Players.LocalPlayer, message)
    end)
end

-- [END OF NOCLIP] --

-- [GUI NOTIFICATION] --

local screengui = Players.LocalPlayer:WaitForChild("PlayerGui")
local text = Instance.new("ScreenGui")
text.Parent = screengui
local notify = Instance.new("TextLabel")
notify.Parent = text
notify.Size = UDim2.new(0, 300, 0, 50)
notify.Position = UDim2.new(0.5, -150, 0, 50)
notify.BackgroundColor3 = Color3.new(0,0,0)
notify.TextColor3 = Color3.new(1,1,1)
notify.TextScaled = true
notify.Text = "Risky has loaded!"
wait(4)
notify.Text = "Join our Discord! .gg/rhqN8MXs3C"
wait(4)
text.Enabled = false

-- [FLING] --

local function onFlingChatCommand(user, message)
    if string.sub(string.lower(message), 1, 8) == "/e fling" then
        local playerName = string.match(message, "^/e fling%s+(.+)$")
        if playerName then
            local targetPlayer = Players:FindFirstChild(playerName)
                    tool.Unequip()
                    end
                end
            end
        end
    end
end

-- Bind the 8+ALT key press to the giveTools function
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.D8 and input.UserInputType == Enum.UserInputType.Keyboard and input.Alt then
        giveTools()
    end
end)

-- Bind the 8+ALT key release to the takeAwayTools function
UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.D8 and input.UserInputType == Enum.UserInputType.Keyboard and input.Alt then
        takeAwayTools()
    end
end)

-- [END OF GIVE ALL] --

-- [FLY] --
-- Get the Chat service
local Players = game:GetService("Players")
local Chat = game:GetService("Chat")

-- Function to toggle fly
local function toggleFly(player, value)
    -- Get the player's character
    local character = player.Character

    -- Check if the character exists
    if character then
        -- Get the Humanoid
        local humanoid = character:WaitForChild("Humanoid")

        -- Check if the humanoid exists
        if humanoid then
            -- Toggle walk speed and gravity
            humanoid.WalkSpeed = value and 50 or 16
            humanoid.JumpPower = value and 50 or 50
            humanoid.Gravity = value and 0.5 or 196.2
        end
    end
end

-- Function to handle chat command
local function onChatCommand(player, message)
    -- Check if the message starts with `/e fly`
    if string.lower(message) == "/e fly" then
        -- Toggle fly
        toggleFly(player, true)
    elseif string.lower(message) == "/e nofly" then
        -- Toggle fly
        toggleFly(player, false)
    end
end

-- Connect to chat command event
Players.PlayerAdded:Connect(function(player)
    -- Connect to PlayerAdded event
    player.Chatted:Connect(function(message)
        -- Handle chat command
        onChatCommand(player, message)
    end)
end)
-- [END OF FLY] --
-- [TELEPORT] --
-- Get the Players service
local Players = game:GetService("Players")

-- Function to handle teleportation
local function teleportUser(user, targetPlayer)
    -- Get the user's character
    local character = user.Character

    -- Check if the character exists
    if character then
        -- Teleport the user to the target player's character
        character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    end
end

-- Function to handle chat command
local function onChatCommand(user, message)
    -- Check if the message starts with `/pass`
    if string.lower(message:sub(1, 5)) == "/pass" then
        -- Get the character's humanoid
        local character = user.Character
        local humanoid = character:WaitForChild("Humanoid")

        -- Function to make the character pass through objects
        local function makePassThrough()
            -- Make the character pass through objects
            for _, child in pairs(character:GetChildren()) do
                if child:IsA("BasePart") then
                    child.CanCollide = false
                end
            end

            -- Make the character's descendants pass through objects
            for _, child in pairs(character:GetDescendants()) do
                if child:IsA("BasePart") then
                    child.CanCollide = false
                end
            end

            -- Make the character's humanoids pass through objects
            for _, child in pairs(character:GetChildren()) do
                if child:IsA("Model") and child:FindFirstChild("Humanoid") then
                    child.HumanoidRootPart.CanCollide = false
                end
            end

            -- Make the character's ancestry pass through objects
            for _, child in pairs(character:GetAncestors()) do
                if child:IsA("BasePart") then
                    child.CanCollide = false
                end
            end

            -- Make the character's humanoids not fall
            local function noFall()
                -- Make the character's humanoids not fall
                for _, child in pairs(character:GetChildren()) do
                    if child:IsA("Model") and child:FindFirstChild("Humanoid") then
                        child.Humanoid.JumpPower = 0
                    end
                end
            end

            -- Connect to Humanoid event
            character.Humanoid.Jump:Connect(function()
                noFall()
            end)

            -- Connect to RunService
            game:GetService("RunService").RenderStepped:Connect(function()
                -- Make the character's humanoids not fall
                noFall()
            end)
        end

        -- Connect to RenderStepped event
        game:GetService("RunService").RenderStepped:Connect(function()
            -- Make the character pass through objects
            makePassThrough()
        end)

        -- Make the character pass through objects
        makePassThrough()
    end
end

-- Connect to chat command event
Players.PlayerAdded:Connect(function(player)
    -- Connect to PlayerAdded event
    player.Chatted:Connect(function(message)
        -- Handle chat command
        onChatCommand(player, message)
    end)
end)
-- [END OF NOCLIP] --
local screengui = game.GetService.screengui
local text = Instance.new("ScreenGUI")
text.Parent = screengui
local notify = Instance.neww("TextLabel")
notify.Parent = text
notify.text = "Risky has loaded!"
wait(4)
notify.Text = "Join our Discord! .gg/rhqN8MXs3C"
wait(4)
text.Enabled = false
-- [FLING] --
-- Get the Players service
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

-- Function to handle chat command
local function onChatCommand(user, message)
    -- Check if the message starts with `/e fling`
    if string.lower(message:sub(1, 7)) == "/e fling" then
        -- Get the player's name from the message
        local playerName = message:sub(9)

        -- Get the player object
        local targetPlayer = Players:FindFirstChild(playerName)

        -- Check if the player exists
        if targetPlayer then
            -- Get the target player's character
            local targetCharacter = targetPlayer.Character

            -- Check if the character exists
            if targetCharacter then
                -- Get the target player's humanoid root part
                local targetHumanoidRootPart = targetCharacter:WaitForChild("HumanoidRootPart")

                -- Fling the target player
                targetHumanoidRootPart.Velocity = Vector3.new(0, 50, 0)
                targetHumanoidRootPart.Anchored = false
            else
                -- Print an error message
                print("Player is not online.")
            end
        else
            -- Print an error message
            print("Player not found.")
        end
    end
end

-- Connect to chat command event
Players.PlayerAdded:Connect(function(player)
    -- Connect to PlayerAdded event
    player.Chatted:Connect(function(message)
        -- Handle chat command
        onChatCommand(player, message)
    end)
end)

-- Create a fake badge notification
local function showNotification()
    -- Create a new notification
    local notification = Instance.new("Notification")
    notification.Parent = game.StarterGui
    notification.Text = "Script loaded!"
    notification.Title = "Script Loaded!"
    notification.Duration = 5
    notification.Show = true
end

-- Show the notification
showNotification()
-- [END OF FLING] --


-- Make me a script that gets triggered once the user says /e fling [player] then it would fling the player.