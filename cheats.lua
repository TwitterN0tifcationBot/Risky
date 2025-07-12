local player = game.Players.LocalPlayer
local character = player.Character
local mouse = player:GetMouse()
local screenSize = workspace.CurrentCamera.ViewportSize

-- Loading Screen
local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundTransparency = 1
frame.Parent = game.CoreGui
local loadingLabel = Instance.new("TextLabel")
loadingLabel.Text = "Loading..."
loadingLabel.Size = UDim2.new(1, 0, 1, 0)
loadingLabel.BackgroundTransparency = 1
loadingLabel.TextColor3 = Color3.new(1, 1, 1)
loadingLabel.Font = Enum.Font.SourceSans
loadingLabel.TextSize = 36
loadingLabel.Parent = frame

-- Discord Server Link Button
local button = Instance.new("TextButton")
button.Text = "Copy Discord Server Link"
button.Size = UDim2.new(0.2, 0, 0.1, 0)
button.BackgroundTransparency = 0.8
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.SourceSans
button.TextSize = 18
button.Position = UDim2.new(0.4, 0, 0.8, 0)
button.Parent = frame

-- Cheat Functions
local function enableEsp()
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") then
            localESP = Instance.new("SelectionBox")
            localESP.Adornee = object
            localESP.Visible = true
            localESP.Parent = workspace
        end
    end
end

local function enableFly()
    local uis = game:GetService("UserInputService")
    local players = game.Players
    local player = players.LocalPlayer

    local flightSpeed = 50
    local lastMove = Vector3.new(0, 0, 0)

    local function moveToMouse()
        local currentMove = camera.CFrame.lookVector * flightSpeed
        currentMove = currentMove + camera.CFrame.rightVector * (uis.MouseDelta.X / 10) * flightSpeed
        currentMove = currentMove + camera.CFrame.upVector * (uis.MouseDelta.Y / 10) * flightSpeed

        player.Character:TranslateBy(currentMove)
    end

    local function startFlight()
        mouse.KeyDown:Connect(function(key)
            if key == "left shift" then
                player.Character:TranslateBy(lastMove)
                lastMove = player.Character.Velocity
            elseif key == "w" or key == "a" or key == "s" or key == "d" then
                lastMove = Vector3.new(0, 0, 0)
                moveToMouse()
            end
        end)
    end

    startFlight()
end

local function enableNoclip()
    local function noclipping(mouse)
        for _, part in ipairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Collided:Connect(function(entered)
                    if entered then
                        part.CanCollide = false
                    else
                        wait()
                        part.CanCollide = true
                    end
                end)
            end
        end
    end

    noclipping(mouse)
end

local function enableXray()
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") then
            object.Material = Enum.Material.Glass
        end
    end
end

local function enableFPSBoost()
    local renderStepping = game:GetService("RunService").RenderStepping
    local renderSteppingConnection

    local function toggleFpsBoost(state)
        if state then
            renderSteppingConnection = renderStepping:Connect(function()
                for _, part in ipairs(player.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.Velocity = Vector3.new(0, 0, 0)
                        part.RotVelocity = Vector3.new(0, 0, 0)
                    end
                end
            end)
        else
            renderSteppingConnection:Disconnect()
        end
    end

    toggleFpsBoost(true)
end

local function giveAllTools()
    local toolDataStore = require(game:GetService("ServerScriptService").ToolData)
    local playerGui = player.PlayerGui

    for toolName, toolConfig in pairs(toolDataStore) do
        local tool = player:FindFirstChild(toolName) or Instance.new(toolName)
        tool.Animations = toolConfig.Animations
        tool.Gizmo = toolConfig.Gizmo
        tool.Handles = toolConfig.Handles
        tool.HandlesConfiguration = toolConfig.HandlesConfiguration
        tool.HeldRequirement = toolConfig.HeldRequirement
        tool.Parent = player.Character
    end

    for _, object in ipairs(playerGui:GetChildren()) do
        if object:IsA("ScreenGui") then
            object.Parent = playerGui
        end
    end
end

-- Button Events
button.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/rhqN8MXs3C")
    warning("Copied Discord Server Link!")
end)

-- Cheat Menu
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0.2, 0, 0.3, 0)
menu.BackgroundTransparency = 0.8
menu.Position = UDim2.new(0.4, 0, 0.4, 0)
menu.Parent = frame

local espButton = Instance.new("TextButton")
espButton.Text = "ESP On/Off"
espButton.Size = UDim2.new(1, 0, 0.1, 0)
espButton.BackgroundTransparency = 0.5
espButton.TextColor3 = Color3.new(1, 1, 1)
espButton.Font = Enum.Font.SourceSans
espButton.TextSize = 18
espButton.Parent = menu

local flyButton = Instance.new("TextButton")
flyButton.Text = "Fly On/Off"
flyButton.Size = UDim2.new(1, 0, 0.1, 0)
flyButton.BackgroundTransparency = 0.5
flyButton.TextColor3 = Color3.new(1, 1, 1)
flyButton.Font = Enum.Font.SourceSans
flyButton.TextSize = 18
flyButton.Parent = menu

local noclipButton = Instance.new("TextButton")
noclipButton.Text = "Noclip On/Off"
noclipButton.Size = UDim2.new(1, 0, 0.1, 0)
noclipButton.BackgroundTransparency = 0.5
noclipButton.TextColor3 = Color3.new(1, 1, 1)
noclipButton.Font = Enum.Font.SourceSans
noclipButton.TextSize = 18
noclipButton.Parent = menu

local xrayButton = Instance.new("TextButton")
xrayButton.Text = "Xray On/Off"
xrayButton.Size = UDim2.new(1, 0, 0.1, 0)
xrayButton.BackgroundTransparency = 0.5
xrayButton.TextColor3 = Color3.new(1, 1, 1)
xrayButton.Font = Enum.Font.SourceSans
xrayButton.TextSize = 18
xrayButton.Parent = menu

local fpsBoostButton = Instance.new("TextButton")
fpsBoostButton.Text = "FPS Boost On/Off"
fpsBoostButton.Size = UDim2.new(1, 0, 0.1, 0)
fpsBoostButton.BackgroundTransparency = 0.5
fpsBoostButton.TextColor3 = Color3.new(1, 1, 1)
fpsBoostButton.Font = Enum.Font.SourceSans
fpsBoostButton.TextSize = 18
fpsBoostButton.Parent = menu

local giveAllToolsButton = Instance.new("TextButton")
giveAllToolsButton.Text = "Give All Tools"
giveAllToolsButton.Size = UDim2.new(1, 0, 0.1, 0)
giveAllToolsButton.BackgroundTransparency = 0.5
giveAllToolsButton.TextColor3 = Color3.new(1, 1, 1)
giveAllToolsButton.Font = Enum.Font.SourceSans
giveAllToolsButton.TextSize = 18
giveAllToolsButton.Parent = menu

-- Function to create a notification
local function createNotification(message)
    local notification = Instance.new("TextLabel")
    notification.Text = message
    notification.Size = UDim2.new(1, -10, 50, 0)
    notification.TextSize = 24
    notification.BackgroundTransparency = 0.5
    notification.Position = UDim2.new(0, 5, -50, 0)
    notification.TextColor3 = Color3.new(1, 1, 1)
    notification.Parent = frame
    notification:TweenSize(UDim2.new(1, -10, 50, 0), "Out", "Quint", 2, true)
    wait(3)
    notification:Destroy()
end

-- Button Events
espButton.MouseButton1Click:Connect(function()
    enableEsp()
    createNotification("ESP is now enabled.")
end)

flyButton.MouseButton1Click:Connect(function()
    enableFly()
    createNotification("Fly is now enabled.")
end)

noclipButton.MouseButton1Click:Connect(function()
    enableNoclip()
    createNotification("Noclip is now enabled.")
end)

xrayButton.MouseButton1Click:Connect(function()
    enableXray()
    createNotification("Xray is now enabled.")
end)

fpsBoostButton.MouseButton1Click:Connect(function()
    enableFPSBoost()
    createNotification("FPS Boost is now enabled.")
end)

giveAllToolsButton.MouseButton1Click:Connect(function()
    giveAllTools()
    createNotification("All tools have been given.")
end)

-- Load the GUI after a short delay
wait(2)
frame:Destroy()
