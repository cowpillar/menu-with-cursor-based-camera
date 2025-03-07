--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

--// Player & Camera
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera

--// GUI Elements
local mainMenu = script.Parent.Parent.Parent

--// Play Button
script.Parent.MouseButton1Click:Connect(function()
	-- Disable MenuCamera
	local menuCamera = player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("MenuCamera")
	if menuCamera then menuCamera.Enabled = false end

	-- Remove camPart
	local camPart = workspace:FindFirstChild("CameraPart")
	if camPart then camPart:Destroy() end

	-- Reset camera back to player
	local humanoid = character and character:FindFirstChild("Humanoid")
	if humanoid then
		camera.CameraType = Enum.CameraType.Custom
		camera.CameraSubject = humanoid
	end

	if mainMenu then
		local fadeInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		-- Fade out UI elements and menu frame
		for _, child in ipairs(mainMenu:GetDescendants()) do
			if child:IsA("TextLabel") or child:IsA("TextButton") then
				TweenService:Create(child, fadeInfo, {
					TextTransparency = 1,
					BackgroundTransparency = 1
				}):Play()
			end
		end

		local fadeOut = TweenService:Create(mainMenu, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 1
		})
		fadeOut:Play()
		fadeOut.Completed:Wait()
		mainMenu:Destroy()
	end
end)
