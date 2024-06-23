local plr = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local Runservice = game:GetService("RunService")
local httpservice = game:GetService("HttpService")
local mouse = plr:GetMouse()
local TweenService = game:GetService("TweenService")
local NightLib = {}
local NightScreen = Instance.new("ScreenGui")
NightScreen.Name = "NightHubScreen"
NightScreen.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		object.Position = pos
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	uis.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

function NightLib:Notify(Configs)
    Configs = Configs or {}
    Configs.Title = Configs.Title or "Notify"
    Configs.Description = Configs.Description or "Description"
    Configs.Time = Configs.Time or 5

    spawn(function()
        local Notify = Instance.new("Frame")
        local UICorner_26 = Instance.new("UICorner")
        local Icon_2 = Instance.new("Frame")
        local UIStroke_7 = Instance.new("UIStroke")
        local LogoHub_2 = Instance.new("ImageLabel")
        local UIStroke_8 = Instance.new("UIStroke")
        local Title_11 = Instance.new("TextLabel")
        local Description = Instance.new("TextLabel")

        Notify.Name = "Notify"
        Notify.Parent = NightScreen
        Notify.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        Notify.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Notify.BorderSizePixel = 0
        Notify.Position = UDim2.new(1.907564592, 0, 0.815789461, 0)
        Notify.Size = UDim2.new(0, 258, 0, 52)

        UICorner_26.CornerRadius = UDim.new(0, 4)
        UICorner_26.Parent = Notify

        Icon_2.Name = "Icon"
        Icon_2.Parent = Notify
        Icon_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Icon_2.BorderSizePixel = 0
        Icon_2.Position = UDim2.new(-0.0710593536, 0, -0.134615391, 0)
        Icon_2.Rotation = 45.000
        Icon_2.Size = UDim2.new(0, 60, 0, 60)

        UIStroke_7.Color = Color3.fromRGB(144, 144, 144)
        UIStroke_7.Parent = Icon_2

        LogoHub_2.Name = "LogoHub"
        LogoHub_2.Parent = Icon_2
        LogoHub_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LogoHub_2.BackgroundTransparency = 1.000
        LogoHub_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        LogoHub_2.BorderSizePixel = 0
        LogoHub_2.Rotation = -45.000
        LogoHub_2.Size = UDim2.new(1, 0, 1, 0)
        LogoHub_2.Image = "rbxassetid://18129806724"

        UIStroke_8.Color = Color3.fromRGB(144, 144, 144)
        UIStroke_8.Parent = Notify

        Title_11.Name = "Title"
        Title_11.Parent = Notify
        Title_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title_11.BackgroundTransparency = 1.000
        Title_11.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Title_11.BorderSizePixel = 0
        Title_11.Position = UDim2.new(0.213178292, 0, 0, 0)
        Title_11.Size = UDim2.new(0, 182, 0, 22)
        Title_11.Font = Enum.Font.GothamBold
        Title_11.Text = Configs.Title
        Title_11.TextColor3 = Color3.fromRGB(222, 222, 222)
        Title_11.TextSize = 14.000
        Title_11.TextXAlignment = Enum.TextXAlignment.Left

        Description.Name = "Description"
        Description.Parent = Notify
        Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Description.BackgroundTransparency = 1.000
        Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Description.BorderSizePixel = 0
        Description.Position = UDim2.new(0.213178292, 0, 0.423076928, 0)
        Description.Size = UDim2.new(0, 203, 0, 31)
        Description.Font = Enum.Font.GothamBold
        Description.Text = Configs.Description
        Description.TextColor3 = Color3.fromRGB(144, 144, 144)
        Description.TextSize = 12.000
        Description.TextWrapped = true
        Description.TextXAlignment = Enum.TextXAlignment.Left
        Description.TextYAlignment = Enum.TextYAlignment.Top
        
        TweenService:Create(Notify,TweenInfo.new(3, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Position = UDim2.new(0.76564592, 0, 0.815789461, 0)}):Play()
        task.wait(tonumber(Configs.Time))
        TweenService:Create(Notify,TweenInfo.new(3, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Position = UDim2.new(2, 0, 0.856, 0)}):Play() 
        task.wait(tonumber(Configs.Time) / 2)
        Notify.Visible = false
        task.wait(tonumber(Configs.Time) / 2)
        Notify:Destroy()
    end)
end

function NightLib:CreateWindow(Configs)
    Configs = Configs or {}
    Configs.Title = Configs.Title or "Night Hub"
    Configs.Cre = Configs.Cre or "! Nightx"

    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local MainContainer = Instance.new("Frame")
    local Top = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Top2 = Instance.new("Frame")
    local Logo = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local LogoHub = Instance.new("ImageLabel")
    local UIStroke = Instance.new("UIStroke")
    local NameHub = Instance.new("TextLabel")
    local UIPadding = Instance.new("UIPadding")
    local UIGradient = Instance.new("UIGradient")
    local Creator = Instance.new("TextLabel")
    local UIPadding_2 = Instance.new("UIPadding")
    local CloseOpen = Instance.new("Frame")
    local UICorner_4 = Instance.new("UICorner")
    local Mini = Instance.new("TextButton")
    local Logo_2 = Instance.new("ImageLabel")
    local Close = Instance.new("TextButton")
    local Logo_3 = Instance.new("ImageLabel")
    local TabHolder = Instance.new("Frame")
    local UICorner_5 = Instance.new("UICorner")
    local Hide = Instance.new("Frame")
    local Hide_2 = Instance.new("Frame")
    local TabList = Instance.new("ScrollingFrame")
    local UIPadding_3 = Instance.new("UIPadding")
    local UIListLayout = Instance.new("UIListLayout")
    local ChannelContainer = Instance.new("Frame")
    local UICorner_6 = Instance.new("UICorner")
    local CloseOpen_2 = Instance.new("Frame")
    local UICorner_25 = Instance.new("UICorner")
    local Title_10 = Instance.new("TextButton")

    CloseOpen_2.Name = "CloseOpen"
    CloseOpen_2.Parent = NightScreen
    CloseOpen_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    CloseOpen_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloseOpen_2.BorderSizePixel = 0
    CloseOpen_2.Position = UDim2.new(0.0860215053, 0, 0.119433202, 0)
    CloseOpen_2.Size = UDim2.new(0, 40, 0, 40)

    UICorner_25.CornerRadius = UDim.new(0, 4)
    UICorner_25.Parent = CloseOpen_2

    Title_10.Name = "Title"
    Title_10.Parent = CloseOpen_2
    Title_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title_10.BackgroundTransparency = 1.000
    Title_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title_10.BorderSizePixel = 0
    Title_10.Size = UDim2.new(1, 0, 1, 0)
    Title_10.Font = Enum.Font.GothamBold
    Title_10.Text = "Close"
    Title_10.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title_10.TextSize = 14.000
    Title_10.MouseButton1Click:Connect(function()
        AnLib = not AnLib
        Title_10.Text = AnLib and "Open" or "Close"
        if Main.Visible == false then
            Title_10.Text = "Close"
            Main.Visible = true
        elseif Main.Visible == true then
            Main.Visible = false
            Title_10.Text = "Open"
        end
    end)

    Main.Name = "Main"
    Main.Parent = NightScreen
    Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.247232467, 0, 0.174089074, 0)
    Main.Size = UDim2.new(0, 486, 0, 334)

    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = Main

    MainContainer.Name = "MainContainer"
    MainContainer.Parent = Main
    MainContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainContainer.BackgroundTransparency = 1.000
    MainContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainContainer.BorderSizePixel = 0
    MainContainer.Size = UDim2.new(1, 0, 1, 0)

    Top.Name = "Top"
    Top.Parent = MainContainer
    Top.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Top.BorderSizePixel = 0
    Top.Position = UDim2.new(0, 0, 2.28424994e-08, 0)
    Top.Size = UDim2.new(1, 0, -0.11676649, 70)

    UICorner_2.CornerRadius = UDim.new(0, 6)
    UICorner_2.Parent = Top

    Top2.Name = "Top2"
    Top2.Parent = Top
    Top2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Top2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Top2.BorderSizePixel = 0
    Top2.Position = UDim2.new(0, 0, 0.571428597, 0)
    Top2.Size = UDim2.new(1, 0, 0, 30)

    Logo.Name = "Logo"
    Logo.Parent = Top2
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo.BorderSizePixel = 0
    Logo.Position = UDim2.new(0.0350000001, -5, -0.333000004, -4)
    Logo.Size = UDim2.new(0, 40, 0, 40)

    UICorner_3.CornerRadius = UDim.new(1, 0)
    UICorner_3.Parent = Logo

    LogoHub.Name = "LogoHub"
    LogoHub.Parent = Logo
    LogoHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LogoHub.BackgroundTransparency = 1.000
    LogoHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
    LogoHub.BorderSizePixel = 0
    LogoHub.Size = UDim2.new(1, 0, 1, 0)
    LogoHub.Image = "rbxassetid://18129806724"

    UIStroke.Color = Color3.fromRGB(50, 50, 50)
    UIStroke.Parent = Logo

    NameHub.Name = "NameHub"
    NameHub.Parent = Top
    NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.BackgroundTransparency = 1.000
    NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NameHub.BorderSizePixel = 0
    NameHub.Size = UDim2.new(1, 0, 0, 32)
    NameHub.Font = Enum.Font.GothamBold
    NameHub.Text = Configs.Title
    NameHub.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.TextSize = 17.000
    NameHub.TextXAlignment = Enum.TextXAlignment.Left

    UIPadding.Parent = NameHub
    UIPadding.PaddingLeft = UDim.new(0, 60)

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(47, 47, 47)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
    UIGradient.Parent = NameHub

    Creator.Name = "Creator"
    Creator.Parent = Top
    Creator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Creator.BackgroundTransparency = 1.000
    Creator.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Creator.BorderSizePixel = 0
    Creator.Position = UDim2.new(0, 0, 0.870967984, 0)
    Creator.Size = UDim2.new(1, 0, 0, 20)
    Creator.Font = Enum.Font.GothamBold
    Creator.Text = Configs.Cre
    Creator.TextColor3 = Color3.fromRGB(50, 50, 50)
    Creator.TextSize = 15.000
    Creator.TextXAlignment = Enum.TextXAlignment.Left
    Creator.TextYAlignment = Enum.TextYAlignment.Top

    UIPadding_2.Parent = Creator
    UIPadding_2.PaddingBottom = UDim.new(0, 12)
    UIPadding_2.PaddingLeft = UDim.new(0, 60)

    CloseOpen.Name = "CloseOpen"
    CloseOpen.Parent = Top
    CloseOpen.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    CloseOpen.BackgroundTransparency = 1.000
    CloseOpen.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloseOpen.BorderSizePixel = 0
    CloseOpen.Position = UDim2.new(0.823045254, 0, 0.120137893, 0)
    CloseOpen.Size = UDim2.new(0, 86, 0, 23)

    UICorner_4.CornerRadius = UDim.new(0, 4)
    UICorner_4.Parent = CloseOpen

    Mini.Name = "Mini"
    Mini.Parent = CloseOpen
    Mini.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Mini.BackgroundTransparency = 1.000
    Mini.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Mini.BorderSizePixel = 0
    Mini.Position = UDim2.new(0.47673282, 0, -0.0869565234, 0)
    Mini.Size = UDim2.new(0, 14, 0, 15)
    Mini.Font = Enum.Font.SourceSans
    Mini.Text = ""
    Mini.TextColor3 = Color3.fromRGB(0, 0, 0)
    Mini.TextSize = 14.000
    Mini.MouseButton1Click:Connect(function()
        Main.Visible = false
        Title_10.Text = "Open"
    end)

    Logo_2.Name = "Logo"
    Logo_2.Parent = Mini
    Logo_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo_2.BackgroundTransparency = 1.000
    Logo_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo_2.BorderSizePixel = 0
    Logo_2.Position = UDim2.new(0.0348510742, 0, 0.069565326, 0)
    Logo_2.Size = UDim2.new(0, 14, 0, 15)
    Logo_2.Image = "rbxassetid://17585149799"

    Close.Name = "Close"
    Close.Parent = CloseOpen
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.767138839, 0, -0.161999911, 2)
    Close.Size = UDim2.new(0, 17, 0, 17)
    Close.Font = Enum.Font.SourceSans
    Close.Text = ""
    Close.TextColor3 = Color3.fromRGB(0, 0, 0)
    Close.TextSize = 14.000
    Close.MouseButton1Click:Connect(function()
        NightScreen:Destroy()
    end)

    Logo_3.Name = "Logo"
    Logo_3.Parent = Close
    Logo_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo_3.BackgroundTransparency = 1.000
    Logo_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo_3.BorderSizePixel = 0
    Logo_3.Size = UDim2.new(1, 0, 1, 0)
    Logo_3.Image = "rbxassetid://2777727756"

    TabHolder.Name = "TabHolder"
    TabHolder.Parent = MainContainer
    TabHolder.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabHolder.BorderSizePixel = 0
    TabHolder.Position = UDim2.new(0, 0, 0.140718564, 0)
    TabHolder.Size = UDim2.new(0, 124, 0, 287)

    UICorner_5.CornerRadius = UDim.new(0, 4)
    UICorner_5.Parent = TabHolder

    Hide.Name = "Hide"
    Hide.Parent = TabHolder
    Hide.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Hide.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Hide.BorderSizePixel = 0
    Hide.Position = UDim2.new(0, 0, 0.00248883083, 0)
    Hide.Size = UDim2.new(1, 0, -0.00248877751, 30)

    Hide_2.Name = "Hide"
    Hide_2.Parent = TabHolder
    Hide_2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Hide_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Hide_2.BorderSizePixel = 0
    Hide_2.Position = UDim2.new(0.84677422, 0, 0, 0)
    Hide_2.Size = UDim2.new(0.153225809, 0, 0.895470381, 30)

    TabList.Name = "Tab List"
    TabList.Parent = TabHolder
    TabList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabList.BackgroundTransparency = 1.000
    TabList.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabList.BorderSizePixel = 0
    TabList.Size = UDim2.new(1, 0, 1, 0)
    TabList.CanvasSize = UDim2.new(0, 0, 1, 5)
    TabList.ScrollBarThickness = 2
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            TabList.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
        end)
    end)

    UIPadding_3.Parent = TabList
    UIPadding_3.PaddingBottom = UDim.new(0, 1)
    UIPadding_3.PaddingLeft = UDim.new(0, 1)
    UIPadding_3.PaddingRight = UDim.new(0, 1)
    UIPadding_3.PaddingTop = UDim.new(0, 1)

    UIListLayout.Parent = TabList
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 2)
    
    ChannelContainer.Name = "ChannelContainer"
    ChannelContainer.Parent = MainContainer
    ChannelContainer.AnchorPoint = Vector2.new(1, 0)
    ChannelContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    ChannelContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ChannelContainer.BorderSizePixel = 0
    ChannelContainer.Position = UDim2.new(1, 0, 0.14371258, 0)
    ChannelContainer.Size = UDim2.new(0, 362, 0, 286)

    UICorner_6.CornerRadius = UDim.new(0, 6)
    UICorner_6.Parent = ChannelContainer
    
    MakeDraggable(Top, Main)
    local Tabshit = {}
    function Tabshit:CreateTab(Configs)
        Configs = Configs or {}
        Configs.Name = Configs.Name or "Tab"

        local TabDisable = Instance.new("TextButton")
        local EnableFrame_2 = Instance.new("Frame")
        local Channel = Instance.new("ScrollingFrame")
        local UIPadding_4 = Instance.new("UIPadding")
        local UIListLayout_2 = Instance.new("UIListLayout")
        local defaults = false
        local NameT = ""

        TabDisable.Name = "Tab Disable"
        TabDisable.Parent = TabList
        TabDisable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabDisable.BackgroundTransparency = 1.000
        TabDisable.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabDisable.BorderSizePixel = 0
        TabDisable.Size = UDim2.new(1, 0, 0, 35)
        TabDisable.Font = Enum.Font.GothamBold
        TabDisable.Text = Configs.Name
        TabDisable.TextColor3 = Color3.fromRGB(144, 144, 144)
        TabDisable.TextSize = 17.000

        EnableFrame_2.Name = "EnableFrame"
        EnableFrame_2.Parent = TabDisable
        EnableFrame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        EnableFrame_2.BackgroundTransparency = 1.000
        EnableFrame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        EnableFrame_2.BorderSizePixel = 0
        EnableFrame_2.Position = UDim2.new(0, 0, 0.171428576, 0)
        EnableFrame_2.Size = UDim2.new(0, 2, 0.657143295, 0)

        Channel.Name = "Channel"
        Channel.Parent = ChannelContainer
        Channel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Channel.BackgroundTransparency = 1.000
        Channel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Channel.BorderSizePixel = 0
        Channel.Size = UDim2.new(1, 0, 1, 0)
        Channel.ScrollBarThickness = 2
        spawn(function()
            while wait() do
                Channel.CanvasSize = UDim2.new(0,0,0,UIListLayout_2.AbsoluteContentSize.Y + 20)
            end
        end)

        UIPadding_4.Parent = Channel
        UIPadding_4.PaddingBottom = UDim.new(0, 3)
        UIPadding_4.PaddingLeft = UDim.new(0, 5)
        UIPadding_4.PaddingRight = UDim.new(0, 5)
        UIPadding_4.PaddingTop = UDim.new(0, 3)

        UIListLayout_2.Parent = Channel
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 5)

        TabDisable.MouseButton1Click:Connect(function()
            for i, v in next, ChannelContainer:GetChildren() do
                if v.Name == "Channel" then
                    v.Visible = false
                end
                Channel.Visible = true
            end
            for i, v in next, TabList:GetChildren() do
                if v.ClassName == "TextButton" then
                    v.TextColor3 = Color3.fromRGB(144, 144, 144)
                    v.BackgroundTransparency = 1.000
                end
            end
            TabDisable.TextColor3 = Color3.fromRGB(255,255,255)
            TabDisable.BackgroundTransparency = 0.9500
            NameT = TabDisable.Name
        end)
        
        if defaults == false then
            defaults = true
            TabDisable.TextColor3 = Color3.fromRGB(144,144,144)
            ChannelContainer.Visible = true
            EnableFrame_2.BackgroundTransparency = 1.000
            Channel.Visible = false
        end

        local InTab = {}
        function InTab:CreateSectionContent(Configs)
            Configs = Configs or {}
            Configs.Text = Configs.Text or "Section Content"

            local SectionContent = Instance.new("Frame")
            local UICorner_7 = Instance.new("UICorner")
            local UIStroke_2 = Instance.new("UIStroke")
            local Title = Instance.new("TextLabel")
            local UIPadding_5 = Instance.new("UIPadding")

            SectionContent.Name = "Section Content"
            SectionContent.Parent = Channel
            SectionContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionContent.BackgroundTransparency = 1.000
            SectionContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SectionContent.BorderSizePixel = 0
            SectionContent.Size = UDim2.new(1, 0, 0, 18)

            UICorner_7.CornerRadius = UDim.new(0, 2)
            UICorner_7.Parent = SectionContent

            UIStroke_2.Color = Color3.fromRGB(100, 100, 100)
            UIStroke_2.Thickness = 2
            UIStroke_2.Parent = SectionContent

            Title.Name = "Title"
            Title.Parent = SectionContent
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title.BorderSizePixel = 0
            Title.Size = UDim2.new(1, 0, 1, 0)
            Title.Font = Enum.Font.GothamBold
            Title.Text = Configs.Text
            Title.TextColor3 = Color3.fromRGB(200, 200, 200)
            Title.TextSize = 14.000
            Title.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_5.Parent = Title
            UIPadding_5.PaddingLeft = UDim.new(0, 4)
            
        end
        function InTab:CreateSection(Configs)
            Configs = Configs or {}
            Configs.Text = Configs.Text or "Section"

            local Section = Instance.new("TextLabel")
            local UIPadding_21 = Instance.new("UIPadding")

            Section.Name = "Section"
            Section.Parent = Channel
            Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Section.BackgroundTransparency = 1.000
            Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Section.BorderSizePixel = 0
            Section.Size = UDim2.new(1, 0, 0, 18)
            Section.Font = Enum.Font.GothamBold
            Section.Text = Configs.Text
            Section.TextColor3 = Color3.fromRGB(222, 222, 222)
            Section.TextSize = 14.000
            Section.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_21.Parent = Section
            UIPadding_21.PaddingLeft = UDim.new(0, 4)
            
        end
        function InTab:CreateButton(Configs)
            Configs = Configs or {}
            Configs.Name = Configs.Name or "Button"
            Configs.Description = Configs.Description or ""
            Configs.CallBack = Configs.CallBack or function() end

            local Button = Instance.new("Frame")
            local Features = Instance.new("Frame")
            local Click = Instance.new("TextButton")
            local Title_2 = Instance.new("TextLabel")
            local UIPadding_6 = Instance.new("UIPadding")
            local Desc = Instance.new("TextLabel")
            local UIPadding_7 = Instance.new("UIPadding")
            local Frame = Instance.new("Frame")
            local ImageLabel = Instance.new("ImageLabel")
            local UICorner_8 = Instance.new("UICorner")

            Button.Name = "Button"
            Button.Parent = Channel
            Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0, 0, 0.0821428597, 0)
            Button.Size = UDim2.new(1, 0, -0, 55)

            Features.Name = "Features"
            Features.Parent = Button
            Features.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Features.BackgroundTransparency = 1.000
            Features.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Features.BorderSizePixel = 0
            Features.Size = UDim2.new(1, 0, 1, 0)

            Click.Name = "Click"
            Click.Parent = Features
            Click.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Click.BackgroundTransparency = 1.000
            Click.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Click.BorderSizePixel = 0
            Click.Size = UDim2.new(1, 0, 1, 0)
            Click.Font = Enum.Font.SourceSans
            Click.Text = ""
            Click.TextColor3 = Color3.fromRGB(0, 0, 0)
            Click.TextSize = 14.000

            Title_2.Name = "Title"
            Title_2.Parent = Features
            Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_2.BackgroundTransparency = 1.000
            Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_2.BorderSizePixel = 0
            Title_2.Size = UDim2.new(0.826704562, 0, 0, 18)
            Title_2.Font = Enum.Font.GothamBold
            Title_2.Text = Configs.Name
            Title_2.TextColor3 = Color3.fromRGB(222, 222, 222)
            Title_2.TextSize = 14.000
            Title_2.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_6.Parent = Title_2
            UIPadding_6.PaddingLeft = UDim.new(0, 4)

            Desc.Name = "Desc"
            Desc.Parent = Features
            Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Desc.BackgroundTransparency = 1.000
            Desc.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Desc.BorderSizePixel = 0
            Desc.Position = UDim2.new(0, 0, 0, 18)
            Desc.Size = UDim2.new(0.826704562, 0, -0.0545454547, 40)
            Desc.Font = Enum.Font.GothamBold
            Desc.Text = Configs.Description
            Desc.TextColor3 = Color3.fromRGB(144, 144, 144)
            Desc.TextSize = 12.000
            Desc.TextWrapped = true
            Desc.TextXAlignment = Enum.TextXAlignment.Left
            Desc.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_7.Parent = Desc
            UIPadding_7.PaddingLeft = UDim.new(0, 4)

            Frame.Parent = Features
            Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Frame.BackgroundTransparency = 1.000
            Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Frame.BorderSizePixel = 0
            Frame.Position = UDim2.new(1, -32, 0, 15)
            Frame.Size = UDim2.new(0, 20, 0, 20)

            ImageLabel.Parent = Frame
            ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ImageLabel.BackgroundTransparency = 1.000
            ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ImageLabel.BorderSizePixel = 0
            ImageLabel.Size = UDim2.new(1, 0, 1, 0)
            ImageLabel.Image = "rbxassetid://18159597864"
            ImageLabel.ImageColor3 = Color3.fromRGB(144, 144, 144)

            UICorner_8.CornerRadius = UDim.new(0, 2)
            UICorner_8.Parent = Button

            Button.MouseEnter:Connect(function()
                Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end)

            Button.MouseLeave:Connect(function()
                Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            end)

            Click.MouseButton1Click:Connect(function()
                pcall(Configs.CallBack)
                ImageLabel.ImageColor3 = Color3.fromRGB(0, 102, 255)
                TweenService:Create(ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(144, 144, 144)}):Play()
            end)
            
        end
        function InTab:CreateToggle(Configs)
            Configs = Configs or {}
            Configs.Name = Configs.Name or "Toggle"
            Configs.Description = Configs.Description or ""
            Configs.Default = Configs.Default or false
            Configs.CallBack = Configs.CallBack or function() end

            local Toggle = Instance.new("Frame")
            local Features_2 = Instance.new("Frame")
            local ToggleClick = Instance.new("TextButton")
            local Title_3 = Instance.new("TextLabel")
            local UIPadding_8 = Instance.new("UIPadding")
            local Desc_2 = Instance.new("TextLabel")
            local UIPadding_9 = Instance.new("UIPadding")
            local CheckToggle = Instance.new("Frame")
            local UICorner_9 = Instance.new("UICorner")
            local UIStroke_3 = Instance.new("UIStroke")
            local Check = Instance.new("Frame")
            local UICorner_10 = Instance.new("UICorner")
            local UICorner_11 = Instance.new("UICorner")
            local Tggle = {}
            Toggled = false

            Toggle.Name = "Toggle"
            Toggle.Parent = Channel
            Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Toggle.BorderSizePixel = 0
            Toggle.Position = UDim2.new(0, 0, 0.0821428597, 0)
            Toggle.Size = UDim2.new(1, 0, -0, 55)

            Features_2.Name = "Features"
            Features_2.Parent = Toggle
            Features_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Features_2.BackgroundTransparency = 1.000
            Features_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Features_2.BorderSizePixel = 0
            Features_2.Size = UDim2.new(1, 0, 1, 0)

            ToggleClick.Name = "ToggleClick"
            ToggleClick.Parent = Features_2
            ToggleClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleClick.BackgroundTransparency = 1.000
            ToggleClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ToggleClick.BorderSizePixel = 0
            ToggleClick.Size = UDim2.new(1, 0, 1, 0)
            ToggleClick.Font = Enum.Font.SourceSans
            ToggleClick.Text = ""
            ToggleClick.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleClick.TextSize = 14.000

            Title_3.Name = "Title"
            Title_3.Parent = Features_2
            Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_3.BackgroundTransparency = 1.000
            Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_3.BorderSizePixel = 0
            Title_3.Size = UDim2.new(0.795454562, 0, 0, 18)
            Title_3.Font = Enum.Font.GothamBold
            Title_3.Text = Configs.Name
            Title_3.TextColor3 = Color3.fromRGB(222, 222, 222)
            Title_3.TextSize = 14.000
            Title_3.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_8.Parent = Title_3
            UIPadding_8.PaddingLeft = UDim.new(0, 4)

            Desc_2.Name = "Desc"
            Desc_2.Parent = Features_2
            Desc_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Desc_2.BackgroundTransparency = 1.000
            Desc_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Desc_2.BorderSizePixel = 0
            Desc_2.Position = UDim2.new(0, 0, 0, 18)
            Desc_2.Size = UDim2.new(0.795454562, 0, -0.0545454547, 40)
            Desc_2.Font = Enum.Font.GothamBold
            Desc_2.Text = Configs.Description
            Desc_2.TextColor3 = Color3.fromRGB(144, 144, 144)
            Desc_2.TextSize = 12.000
            Desc_2.TextWrapped = true
            Desc_2.TextXAlignment = Enum.TextXAlignment.Left
            Desc_2.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_9.Parent = Desc_2
            UIPadding_9.PaddingLeft = UDim.new(0, 4)

            CheckToggle.Name = "CheckToggle"
            CheckToggle.Parent = Features_2
            CheckToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CheckToggle.BackgroundTransparency = 1.000
            CheckToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            CheckToggle.BorderSizePixel = 0
            CheckToggle.Position = UDim2.new(1, -52, 0, 18)
            CheckToggle.Size = UDim2.new(0, 42, 0, 16)

            UICorner_9.CornerRadius = UDim.new(1, 0)
            UICorner_9.Parent = CheckToggle

            UIStroke_3.Color = Color3.fromRGB(70, 70, 70)
            UIStroke_3.Thickness = 2
            UIStroke_3.Parent = CheckToggle

            Check.Name = "Check"
            Check.Parent = CheckToggle
            Check.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            Check.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Check.BorderSizePixel = 0
            Check.Position = UDim2.new(0, 2, 0, 1)
            Check.Size = UDim2.new(0, 14, 0, 14)

            UICorner_10.CornerRadius = UDim.new(1, 0)
            UICorner_10.Parent = Check

            UICorner_11.CornerRadius = UDim.new(0, 2)
            UICorner_11.Parent = Toggle

            Toggle.MouseEnter:Connect(function()
                Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end)

            Toggle.MouseLeave:Connect(function()
                Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            end)

            ToggleClick.MouseButton1Click:Connect(function()
                if Toggled == false then
                    TweenService:Create(Title_3, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 26, 0, 1)}):Play()
                    TweenService:Create(CheckToggle, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(CheckToggle, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                    TweenService:Create(UIStroke_3, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(0, 102, 255)}):Play()
                else
                    TweenService:Create(Title_3, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(222, 222, 222)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 2, 0, 1)}):Play()
                    TweenService:Create(CheckToggle, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000}):Play()
                    TweenService:Create(CheckToggle, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
                    TweenService:Create(UIStroke_3, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(70, 70, 70)}):Play()
                end
                Toggled = not Toggled
                pcall(Configs.CallBack, Toggled)
            end)

            if Configs.Default == true then
                TweenService:Create(Title_3, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 26, 0, 1)}):Play()
                TweenService:Create(CheckToggle, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                TweenService:Create(CheckToggle, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                TweenService:Create(UIStroke_3, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(0, 102, 255)}):Play()
                Toggled = Configs.Default
                pcall(Configs.CallBack, Toggled)
            end

            function Tggle:Set(Value)
                if Value then
                    TweenService:Create(Title_3, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 26, 0, 1)}):Play()
                    TweenService:Create(CheckToggle, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(CheckToggle, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                    TweenService:Create(UIStroke_3, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(0, 102, 255)}):Play()
                else
                    TweenService:Create(Title_3, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(222, 222, 222)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 2, 0, 1)}):Play()
                    TweenService:Create(CheckToggle, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000}):Play()
                    TweenService:Create(CheckToggle, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
                    TweenService:Create(UIStroke_3, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(70, 70, 70)}):Play()
                end       
                Toggled = not Toggled
                pcall(Configs.CallBack, Toggled)
            end
            return Tggle
        end
        function InTab:CreateDropdown(Configs)
            Configs = Configs or {}
            Configs.Name = Configs.Name or "Dropdown"
            Configs.Description = Configs.Description or ""
            Configs.Options = Configs.Options or ""
            Configs.Default = Configs.Default or ""
            Configs.CallBack = Configs.CallBack or function() end

            local Dropdown = Instance.new("Frame")
            local Features_5 = Instance.new("Frame")
            local Click_2 = Instance.new("TextButton")
            local Title_6 = Instance.new("TextLabel")
            local UIPadding_13 = Instance.new("UIPadding")
            local Desc_4 = Instance.new("TextLabel")
            local UIPadding_14 = Instance.new("UIPadding")
            local Features_6 = Instance.new("Frame")
            local Icon = Instance.new("ImageLabel")
            local Text = Instance.new("Frame")
            local UICorner_17 = Instance.new("UICorner")
            local UIStroke_6 = Instance.new("UIStroke")
            local TextLabel = Instance.new("TextLabel")
            local UIPadding_15 = Instance.new("UIPadding")
            local ListFrame = Instance.new("Frame")
            local UICorner_18 = Instance.new("UICorner")
            local UIPadding_16 = Instance.new("UIPadding")
            local List = Instance.new("ScrollingFrame")
            local UICorner_19 = Instance.new("UICorner")
            local UIPadding_17 = Instance.new("UIPadding")
            local UIListLayout_3 = Instance.new("UIListLayout")
            local DropFunc = {}
            Dropped = false

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = Channel
            Dropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Dropdown.BorderSizePixel = 0
            Dropdown.Position = UDim2.new(0, 0, 0.453571439, 0)
            Dropdown.Size = UDim2.new(1, 0, 0, 55)

            Features_5.Name = "Features"
            Features_5.Parent = Dropdown
            Features_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Features_5.BackgroundTransparency = 1.000
            Features_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Features_5.BorderSizePixel = 0
            Features_5.Size = UDim2.new(1, 0, 1, 0)

            Click_2.Name = "Click"
            Click_2.Parent = Features_5
            Click_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Click_2.BackgroundTransparency = 1.000
            Click_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Click_2.BorderSizePixel = 0
            Click_2.Size = UDim2.new(1, 0, 1, 0)
            Click_2.Font = Enum.Font.SourceSans
            Click_2.Text = ""
            Click_2.TextColor3 = Color3.fromRGB(0, 0, 0)
            Click_2.TextSize = 14.000

            Title_6.Name = "Title"
            Title_6.Parent = Features_5
            Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_6.BackgroundTransparency = 1.000
            Title_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_6.BorderSizePixel = 0
            Title_6.Size = UDim2.new(0.88774699, 0, 0, 18)
            Title_6.Font = Enum.Font.GothamBold
            Title_6.Text = Configs.Name
            Title_6.TextColor3 = Color3.fromRGB(222, 222, 222)
            Title_6.TextSize = 14.000
            Title_6.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_13.Parent = Title_6
            UIPadding_13.PaddingLeft = UDim.new(0, 4)

            Desc_4.Name = "Desc"
            Desc_4.Parent = Features_5
            Desc_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Desc_4.BackgroundTransparency = 1.000
            Desc_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Desc_4.BorderSizePixel = 0
            Desc_4.Position = UDim2.new(0, 0, 0, 18)
            Desc_4.Size = UDim2.new(1, 0, 0, 12)
            Desc_4.Font = Enum.Font.GothamBold
            Desc_4.Text = Configs.Description
            Desc_4.TextColor3 = Color3.fromRGB(144, 144, 144)
            Desc_4.TextSize = 12.000
            Desc_4.TextWrapped = true
            Desc_4.TextXAlignment = Enum.TextXAlignment.Left
            Desc_4.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_14.Parent = Desc_4
            UIPadding_14.PaddingLeft = UDim.new(0, 4)

            Features_6.Name = "Features"
            Features_6.Parent = Features_5
            Features_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Features_6.BackgroundTransparency = 1.000
            Features_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Features_6.BorderSizePixel = 0
            Features_6.Position = UDim2.new(1, -32, 0, 20)
            Features_6.Size = UDim2.new(0, 20, 0, 20)

            Icon.Name = "Icon"
            Icon.Parent = Features_6
            Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Icon.BackgroundTransparency = 1.000
            Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Icon.BorderSizePixel = 0
            Icon.Rotation = -90.000
            Icon.Size = UDim2.new(1, 0, 1, 0)
            Icon.Image = "rbxassetid://17584979104"
            Icon.ImageColor3 = Color3.fromRGB(222, 222, 222)

            Text.Name = "Text"
            Text.Parent = Features_5
            Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Text.BackgroundTransparency = 1.000
            Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Text.BorderSizePixel = 0
            Text.Position = UDim2.new(0, 7, 0, 40)
            Text.Size = UDim2.new(0, 300, 0, 17)

            UICorner_17.CornerRadius = UDim.new(0, 2)
            UICorner_17.Parent = Text

            UIStroke_6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            UIStroke_6.Color = Color3.fromRGB(70, 70, 70)
            UIStroke_6.Thickness = 2
            UIStroke_6.Parent = Text

            TextLabel.Parent = Text
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel.BorderSizePixel = 0
            TextLabel.Position = UDim2.new(0.0166666675, 0, 0, 0)
            TextLabel.Size = UDim2.new(1.00162315, 0, 1, 0)
            TextLabel.Font = Enum.Font.GothamBold
            TextLabel.Text = Configs.Default
            TextLabel.TextColor3 = Color3.fromRGB(222, 222, 222)
            TextLabel.TextSize = 14.000
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_15.Parent = TextLabel

            ListFrame.Name = "ListFrame"
            ListFrame.Parent = Features_5
            ListFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            ListFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ListFrame.BorderSizePixel = 0
            ListFrame.Position = UDim2.new(0, 0, 0.457551688, 0)
            ListFrame.Size = UDim2.new(1, 0, 0.547675133, 0)
            ListFrame.Visible = false

            UICorner_18.CornerRadius = UDim.new(0, 2)
            UICorner_18.Parent = ListFrame

            UIPadding_16.Parent = ListFrame
            UIPadding_16.PaddingBottom = UDim.new(0, 10)
            UIPadding_16.PaddingLeft = UDim.new(0, 10)
            UIPadding_16.PaddingRight = UDim.new(0, 10)
            UIPadding_16.PaddingTop = UDim.new(0, 10)

            List.Name = "List"
            List.Parent = ListFrame
            List.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            List.BorderColor3 = Color3.fromRGB(0, 0, 0)
            List.BorderSizePixel = 0
            List.Selectable = false
            List.Size = UDim2.new(1, 0, 1, 0)
            List.ScrollBarThickness = 2
            spawn(function()
                while wait() do
                    List.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_3.AbsoluteContentSize.Y)
                end
            end)

            UICorner_19.CornerRadius = UDim.new(0, 2)
            UICorner_19.Parent = List

            UIPadding_17.Parent = List
            UIPadding_17.PaddingBottom = UDim.new(0, 2)
            UIPadding_17.PaddingLeft = UDim.new(0, 2)
            UIPadding_17.PaddingRight = UDim.new(0, 2)
            UIPadding_17.PaddingTop = UDim.new(0, 7)

            UIListLayout_3.Parent = List
            UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_3.Padding = UDim.new(0, 7)

            Dropdown.MouseEnter:Connect(function()
                Dropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end)

            Dropdown.MouseLeave:Connect(function()
                Dropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            end)

            for i, v in next, Configs.Options do
                local Option = Instance.new("TextButton")

                Option.Name = "Option"
                Option.Parent = List
                Option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Option.BackgroundTransparency = 1.000
                Option.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Option.BorderSizePixel = 0
                Option.Size = UDim2.new(1, 0, 0, 15)
                Option.Font = Enum.Font.GothamBold
                Option.Text = tostring(v)
                Option.TextColor3 = Color3.fromRGB(255, 255, 255)
                Option.TextSize = 14.000

                Option.MouseButton1Click:Connect(function()
                    Dropped = false
                    ListFrame.Visible = false
                    Dropdown:TweenSize(UDim2.new(1, 0, 0, 55),"Out","Quad",0.3,true)
                    TweenService:Create(Icon, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = -90.000}):Play()
                    Option.TextColor3 = Color3.fromRGB(255, 255, 255)
                    pcall(Option.Text)
                    Configs.CallBack(Option.Text)
                    TextLabel.Text = Option.Text
                end)
            end

            Click_2.MouseButton1Click:Connect(function()
                if Dropped == false then
                    Dropped = true
                    Dropdown:TweenSize(UDim2.new(1, 0, 0.150, 55),"Out","Quad",0.3,true)
                    TweenService:Create(Icon, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0}):Play()
                    wait(0.2)
                    ListFrame.Visible = true
                else
                    Dropped = false
                    Dropdown:TweenSize(UDim2.new(1, 0, 0, 55),"Out","Quad",0.3,true)
                    TweenService:Create(Icon, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = -90.000}):Play()
                    ListFrame.Visible = false
                end
            end)
            
            function DropFunc:Set(OptionName)
                for i, v in pairs(List:GetChildren()) do
                    if v.ClassName == "Button" then
                        if v.Name == OptionName then
                            v.TextColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.Text = OptionName
                            pcall(TextLabel.Text)
                        end
                    end
                end
            end

            function DropFunc:Add(Option)
                for i, v in next, Option do
                    local Nahvaicaicut = Instance.new("TextButton")

                    Nahvaicaicut.Name = "Option"
                    Nahvaicaicut.Parent = List
                    Nahvaicaicut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Nahvaicaicut.BackgroundTransparency = 1.000
                    Nahvaicaicut.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Nahvaicaicut.BorderSizePixel = 0
                    Nahvaicaicut.Size = UDim2.new(1, 0, 0, 15)
                    Nahvaicaicut.Font = Enum.Font.GothamBold
                    Nahvaicaicut.Text = tostring(v)
                    Nahvaicaicut.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Nahvaicaicut.TextSize = 14.000

                    Nahvaicaicut.MouseButton1Click:Connect(function()
                        Dropped = false
                        ListFrame.Visible = false
                        Dropdown:TweenSize(UDim2.new(1, 0, 0.037, 55),"Out","Quad",0.3,true)
                        TweenService:Create(
                            ListFrame,
                            TweenInfo.new(0 ,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {
                                Visible = false
                            }
                        ):Play()
                        TweenService:Create(Icon, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = -90.000}):Play()
                        Nahvaicaicut.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Configs.CallBack(Nahvaicaicut.Text)
                        TextLabel.Text = Nahvaicaicut.Text
                    end)
                end
            end

            function DropFunc:Refresh(Option)
                for i, v in pairs(List:GetChildren()) do
                    if v.Name == "Option" then
                        v:Destroy()
                    end
                end
                Dropped = false
                Dropdown:TweenSize(UDim2.new(1, 0, 0.037, 55),"Out","Quad",0.3,true)
                TweenService:Create(
                    ListFrame,
                    TweenInfo.new(0 ,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        Visible = false
                    }
                ):Play()
                TweenService:Create(
                    Icon,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                    {ImageColor3 = Color3.fromRGB(255, 255, 255)}
                ):Play()
                DropFunc:Add(Option)
                TextLabel.Text = ""
			end
            return DropFunc
        end
        function InTab:CreateSlider(Configs)
            Configs = Configs or {}
            Configs.Name = Configs.Name or "Slider"
            Configs.Max = Configs.Max or 100
            Configs.Min = Configs.Min or 1
            Configs.Default = Configs.Default or 50
            Configs.CallBack = Configs.CallBack or function() end

            local Slider = Instance.new("Frame")
            local Features_8 = Instance.new("Frame")
            local Title_9 = Instance.new("TextLabel")
            local UIPadding_22 = Instance.new("UIPadding")
            local Desc_5 = Instance.new("TextLabel")
            local UIPadding_23 = Instance.new("UIPadding")
            local SliderFrame = Instance.new("Frame")
            local UICorner_22 = Instance.new("UICorner")
            local Slidershit = Instance.new("Frame")
            local UICorner_23 = Instance.new("UICorner")
            local TextLabel_2 = Instance.new("TextLabel")
            local SliderFunc = {Value = Configs.Default}

            Slider.Name = "Slider"
            Slider.Parent = Channel
            Slider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Slider.BorderSizePixel = 0
            Slider.Position = UDim2.new(0, 0, 0.568392813, 0)
            Slider.Size = UDim2.new(1, 0, 0.0285714287, 54)

            Features_8.Name = "Features"
            Features_8.Parent = Slider
            Features_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Features_8.BackgroundTransparency = 1.000
            Features_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Features_8.BorderSizePixel = 0
            Features_8.Size = UDim2.new(1, 0, 1, 0)

            Title_9.Name = "Title"
            Title_9.Parent = Features_8
            Title_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_9.BackgroundTransparency = 1.000
            Title_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_9.BorderSizePixel = 0
            Title_9.Size = UDim2.new(1, 0, 0, 18)
            Title_9.Font = Enum.Font.GothamBold
            Title_9.Text = Configs.Name
            Title_9.TextColor3 = Color3.fromRGB(222, 222, 222)
            Title_9.TextSize = 14.000
            Title_9.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_22.Parent = Title_9
            UIPadding_22.PaddingLeft = UDim.new(0, 4)

            Desc_5.Name = "Desc"
            Desc_5.Parent = Features_8
            Desc_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Desc_5.BackgroundTransparency = 1.000
            Desc_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Desc_5.BorderSizePixel = 0
            Desc_5.Position = UDim2.new(0, 0, 0, 18)
            Desc_5.Size = UDim2.new(1, 0, 0.0740740746, 32)
            Desc_5.Font = Enum.Font.GothamBold
            Desc_5.Text = Configs.Description
            Desc_5.TextColor3 = Color3.fromRGB(144, 144, 144)
            Desc_5.TextSize = 12.000
            Desc_5.TextXAlignment = Enum.TextXAlignment.Left
            Desc_5.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_23.Parent = Desc_5
            UIPadding_23.PaddingLeft = UDim.new(0, 4)
            UIPadding_23.PaddingTop = UDim.new(0, 1)

            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = Features_8
            SliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Position = UDim2.new(0.0170454551, 0, 0.684039056, 0)
            SliderFrame.Size = UDim2.new(0, 340, 0, 4)

            UICorner_22.CornerRadius = UDim.new(1, 0)
            UICorner_22.Parent = SliderFrame

            Slidershit.Name = "Slidershit"
            Slidershit.Parent = SliderFrame
            Slidershit.BackgroundColor3 = Color3.fromRGB(6, 114, 255)
            Slidershit.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Slidershit.BorderSizePixel = 0
            Slidershit.Size = UDim2.new(0, 170, 1, 0)

            UICorner_23.CornerRadius = UDim.new(1, 0)
            UICorner_23.Parent = Slidershit

            TextLabel_2.Parent = Features_8
            TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.BackgroundTransparency = 1.000
            TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.Position = UDim2.new(0.926136374, 0, 0, 0)
            TextLabel_2.Size = UDim2.new(0, 20, 0, 20)
            TextLabel_2.Font = Enum.Font.GothamBold
            TextLabel_2.Text = tonumber(Configs.Default)
            TextLabel_2.TextColor3 = Color3.fromRGB(15, 235, 255)
            TextLabel_2.TextSize = 14.000

            Slider.MouseEnter:Connect(function()
                Slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end)

            Slider.MouseLeave:Connect(function()
                Slider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            end)
            
            local Dragging = false
			local function Round(Number, Factor)
				local Result = math.floor(Number/Factor + (math.sign(Number) * 0.5)) * Factor
				if Result < 0 then Result = Result + Factor end
				return Result
			end
			function SliderFunc:Set(Value)
				Value = math.clamp(Round(Value, 1), Configs.Min, Configs.Max)
				SliderFunc.Value = Value
				TextLabel_2.Text = tostring(Value)
				TweenService:Create(
					Slidershit,
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Size = UDim2.fromScale((Value - Configs.Min) / (Configs.Max - Configs.Min), 1)}
				):Play()
			end
			Slidershit.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = true 
				end 
			end)
			Slidershit.InputEnded:Connect(function(Input) 
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = false 
					Configs.CallBack(SliderFunc.Value)
				end 
			end)
			uis.InputChanged:Connect(function(Input)
				if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then 
					local SizeScale = math.clamp((Input.Position.X - Slidershit.AbsolutePosition.X) / Slidershit.AbsoluteSize.X, 0, 1)
					SliderFunc:Set(Configs.Min + ((Configs.Max - Configs.Min) * SizeScale)) 
				end
			end)
			TextLabel_2:GetPropertyChangedSignal("Text"):Connect(function()
				local Valid = TextLabel_2.Text:gsub("[^%d]", "")
				if Valid ~= "" then
					local ValidNumber = math.min(tonumber(Valid), Configs.Max)
					TextLabel_2.Text = tostring(ValidNumber)
				else
					TextLabel_2.Text = tostring(Valid)
				end
			end)
			SliderFunc:Set(tonumber(Configs.Default))
			return SliderFunc       
        end
        function InTab:CreateTextBox(Configs)
            Configs = Configs or {}
            Configs.Name = Configs.Name or ""
            Configs.Description = Configs.Description or ""
            Configs.Default = Configs.Default or ""
            Configs.CallBack = Configs.CallBack or function () end

            local Textbox = Instance.new("Frame")
            local UICorner_15 = Instance.new("UICorner")
            local Features_4 = Instance.new("Frame")
            local Title_5 = Instance.new("TextLabel")
            local UIPadding_12 = Instance.new("UIPadding")
            local Put = Instance.new("TextBox")
            local UICorner_16 = Instance.new("UICorner")
            local UIStroke_5 = Instance.new("UIStroke")
            local InputFunc = {}

            Textbox.Name = "Textbox"
            Textbox.Parent = Channel
            Textbox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Textbox.BorderSizePixel = 0
            Textbox.Size = UDim2.new(1, 0, 0, 55)

            UICorner_15.CornerRadius = UDim.new(0, 2)
            UICorner_15.Parent = Textbox

            Features_4.Name = "Features"
            Features_4.Parent = Textbox
            Features_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Features_4.BackgroundTransparency = 1.000
            Features_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Features_4.BorderSizePixel = 0
            Features_4.Size = UDim2.new(1, 0, 1, 0)

            Title_5.Name = "Title"
            Title_5.Parent = Features_4
            Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_5.BackgroundTransparency = 1.000
            Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_5.BorderSizePixel = 0
            Title_5.Size = UDim2.new(1, 0, 0, 18)
            Title_5.Font = Enum.Font.GothamBold
            Title_5.Text = Configs.Name
            Title_5.TextColor3 = Color3.fromRGB(222, 222, 222)
            Title_5.TextSize = 14.000
            Title_5.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_12.Parent = Title_5
            UIPadding_12.PaddingLeft = UDim.new(0, 4)

            Put.Name = "Put"
            Put.Parent = Features_4
            Put.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Put.BackgroundTransparency = 1.000
            Put.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Put.BorderSizePixel = 0
            Put.Position = UDim2.new(0, 7, 0, 24)
            Put.Size = UDim2.new(0.962000012, 0, 0, 18)
            Put.Font = Enum.Font.GothamBold
            Put.Text = "..."
            Put.TextColor3 = Color3.fromRGB(144, 144, 144)
            Put.TextSize = 14.000

            UICorner_16.CornerRadius = UDim.new(0, 2)
            UICorner_16.Parent = Put

            UIStroke_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            UIStroke_5.Color = Color3.fromRGB(70, 70, 70)
            UIStroke_5.Thickness = 2
            UIStroke_5.Parent = Put

            Textbox.MouseEnter:Connect(function()
                Textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end)

            Textbox.MouseLeave:Connect(function()
                Textbox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            end)

            function InputFunc:Set(Value)
				Put.Text = Value
			end
			Put.Focused:Connect(function()
			end)
			Put.FocusLost:Connect(function()
				Put.Size = UDim2.new(0.962000012, 0, 0, 18)
				Configs.CallBack(Put.Text)
			end)
			return InputFunc    
        end
        function InTab:CreateLabel(Configs)
            Configs = Configs or {}
            Configs.Text = Configs.Text or "Label"

            local Label = Instance.new("Frame")
            local Title_7 = Instance.new("TextLabel")
            local UIPadding_18 = Instance.new("UIPadding")
            local LabelFunc = {}

            Label.Name = "Label"
            Label.Parent = Channel
            Label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Label.BorderSizePixel = 0
            Label.ClipsDescendants = true
            Label.Size = UDim2.new(1, 0, 0, 20)

            Title_7.Name = "Title"
            Title_7.Parent = Label
            Title_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_7.BackgroundTransparency = 1.000
            Title_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_7.BorderSizePixel = 0
            Title_7.Size = UDim2.new(1, 0, 1, 0)
            Title_7.Font = Enum.Font.GothamBold
            Title_7.Text = Configs.Text
            Title_7.TextColor3 = Color3.fromRGB(222, 222, 222)
            Title_7.TextSize = 13.000
            Title_7.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_18.Parent = Title_7
            UIPadding_18.PaddingLeft = UDim.new(0, 4)

            function LabelFunc:Set(Text)
                Title_7.Text = Text
            end
            return LabelFunc
        end
        function InTab:CreateParagraph(Configs)
            Configs = Configs or {}
            Configs.Title = Configs.Title or "Paragraph"
            Configs.Content = Configs.Content or ""

            local Paragraph = Instance.new("Frame")
            local Features_7 = Instance.new("Frame")
            local Title_8 = Instance.new("TextLabel")
            local UIPadding_19 = Instance.new("UIPadding")
            local Content = Instance.new("TextLabel")
            local UIPadding_20 = Instance.new("UIPadding")
            local UICorner_21 = Instance.new("UICorner")

            Paragraph.Name = "Paragraph"
            Paragraph.Parent = Channel
            Paragraph.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Paragraph.BorderSizePixel = 0
            Paragraph.Size = UDim2.new(1, 0, 0, 55)

            Features_7.Name = "Features"
            Features_7.Parent = Paragraph
            Features_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Features_7.BackgroundTransparency = 1.000
            Features_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Features_7.BorderSizePixel = 0
            Features_7.Size = UDim2.new(1, 0, 1, 0)

            Title_8.Name = "Title"
            Title_8.Parent = Features_7
            Title_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_8.BackgroundTransparency = 1.000
            Title_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_8.BorderSizePixel = 0
            Title_8.Size = UDim2.new(1, 0, 0, 18)
            Title_8.Font = Enum.Font.GothamBold
            Title_8.Text = Configs.Title
            Title_8.TextColor3 = Color3.fromRGB(222, 222, 222)
            Title_8.TextSize = 14.000
            Title_8.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_19.Parent = Title_8
            UIPadding_19.PaddingLeft = UDim.new(0, 4)

            Content.Name = "Content"
            Content.Parent = Features_7
            Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Content.BackgroundTransparency = 1.000
            Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Content.BorderSizePixel = 0
            Content.Position = UDim2.new(0, 0, 0, 18)
            Content.Size = UDim2.new(1, 0, 0.109090909, 32)
            Content.Font = Enum.Font.GothamBold
            Content.Text = Configs.Content
            Content.TextColor3 = Color3.fromRGB(144, 144, 144)
            Content.TextSize = 12.000
            Content.TextXAlignment = Enum.TextXAlignment.Left
            Content.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_20.Parent = Content
            UIPadding_20.PaddingLeft = UDim.new(0, 4)

            UICorner_21.CornerRadius = UDim.new(0, 2)
            UICorner_21.Parent = Paragraph
            
        end
        return InTab
    end
    return Tabshit
end

return NightLib
