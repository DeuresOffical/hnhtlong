--// Load UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua"))()

--// Branding
Library.AccentColor = Color3.fromRGB(170, 0, 255)
Library:SetWatermark("hnhtlong.10th3 | Tool UI")

--// Window
local Window = Library:CreateWindow({
    Title = "hnhtlong.10th3",
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

--// Tabs
local AimTab = Window:AddTab("AIM")
local VisualTab = Window:AddTab("VISUAL")
local ConfigTab = Window:AddTab("CONFIG")

--// AIM TAB
local AimBox = AimTab:AddLeftGroupbox("AIM SETTINGS")
AimBox:AddToggle("Enabled", {Text = "Enabled", Default = false})
AimBox:AddDropdown("TargetPart", {
    Values = {"Head", "Torso"},
    Default = 1,
    Text = "Target Part"
})
AimBox:AddSlider("FOV", {
    Text = "FOV",
    Min = 10,
    Max = 300,
    Default = 80,
    Rounding = 0
})

--// VISUAL TAB
local VisualBox = VisualTab:AddLeftGroupbox("VISUAL SETTINGS")
VisualBox:AddToggle("ShowFOV", {Text = "Show FOV Circle", Default = true})
VisualBox:AddColorPicker("FOVColor", {
    Default = Color3.fromRGB(170, 0, 255),
    Title = "FOV Color"
})

--// CONFIG TAB
SaveManager:SetLibrary(Library)
ThemeManager:SetLibrary(Library)

SaveManager:SetFolder("hnhtlong_config")
ThemeManager:SetFolder("hnhtlong_theme")

SaveManager:BuildConfigSection(ConfigTab)
ThemeManager:ApplyToTab(ConfigTab)

--// Toggle menu bằng Insert
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        Library:Toggle()
    end
end)