script.Parent.MouseButton1Click:Connect(function()
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://6042053626"
	sound.Volume = 0.5
	sound.Parent = game.Workspace
	sound:Play()
	script.Parent.TextLabel.Visible = not script.Parent.TextLabel.Visible
end)