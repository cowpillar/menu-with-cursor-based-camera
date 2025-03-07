local player = game.Players.LocalPlayer
local cam = workspace.CurrentCamera
local mouse = player:GetMouse()

local camPart = workspace:FindFirstChild("CameraPart")
if not camPart then
	warn("CameraPart not found!")
	return
end

cam.CameraType = Enum.CameraType.Scriptable

local maxTilt = 10
game:GetService("RunService").RenderStepped:Connect(function()
	if camPart then
		cam.CFrame = camPart.CFrame * CFrame.Angles(
			math.rad((((mouse.Y - mouse.ViewSizeY / 2) / mouse.ViewSizeY)) * -maxTilt),
			math.rad((((mouse.X - mouse.ViewSizeX / 2) / mouse.ViewSizeX)) * -maxTilt),
			0
		)
	end
end)
