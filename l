local plr = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local Runservice = game:GetService("RunService")
local httpservice = game:GetService("HttpService")
local mouse = plr:GetMouse()
local TweenService = game:GetService("TweenService")
local NightLib = {}
local NightHubScreen = Instance.new("ScreenGui")
NightHubScreen.Name = "NightHubScreen"
    NightHubScreen.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

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

function NightLib:CreateNotify(Config)
    Config = Config or {}
    Config.Title = Config.Title or "Notify"
    Config.Description = Config.Description or "Description"
    Config.Time = Config.Time or 5

        local Notify = Instance.new("Frame")
        local UICorner_25 = Instance.new("UICorner")
        local Title_9 = Instance.new("TextLabel")
        local UIPadding_20 = Instance.new("UIPadding")
        local Desc_7 = Instance.new("TextLabel")
        local UIPadding_21 = Instance.new("UIPadding")
        
    pcall(function()
        Notify.Name = "Notify"
        Notify.Parent = NightHubScreen
        Notify.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Notify.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Notify.BorderSizePixel = 0
        Notify.ClipsDescendants = true
        Notify.Position = UDim2.new(1.707564592, 0, 0.815789461, 0)
        Notify.Size = UDim2.new(0, 309, 0, 62)

        UICorner_25.CornerRadius = UDim.new(0, 7)
        UICorner_25.Parent = Notify

        Title_9.Name = "Title"
        Title_9.Parent = Notify
        Title_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title_9.BackgroundTransparency = 1.000
        Title_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Title_9.BorderSizePixel = 0
        Title_9.Size = UDim2.new(0, 309, 0, 26)
        Title_9.Font = Enum.Font.SourceSansBold
        Title_9.Text = Config.Title
        Title_9.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title_9.TextSize = 14.000
        Title_9.TextXAlignment = Enum.TextXAlignment.Left

        UIPadding_20.Parent = Title_9
        UIPadding_20.PaddingLeft = UDim.new(0, 9)

        Desc_7.Name = "Desc"
        Desc_7.Parent = Notify
        Desc_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Desc_7.BackgroundTransparency = 1.000
        Desc_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Desc_7.BorderSizePixel = 0
        Desc_7.Position = UDim2.new(0, 0, 0, 26)
        Desc_7.Size = UDim2.new(1, 0, 0.0645161271, 32)
        Desc_7.Font = Enum.Font.SourceSansBold
        Desc_7.Text = Config.Description
        Desc_7.TextColor3 = Color3.fromRGB(100, 100, 100)
        Desc_7.TextSize = 12.000
        Desc_7.TextWrapped = true
        Desc_7.TextXAlignment = Enum.TextXAlignment.Left
        Desc_7.TextYAlignment = Enum.TextYAlignment.Top

        UIPadding_21.Parent = Desc_7
        UIPadding_21.PaddingLeft = UDim.new(0, 9)

        TweenService:Create(Notify,TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Position = UDim2.new(0.707564592, 0, 0.815789461, 0)}):Play()
        task.wait(tonumber(Config.Time))
        TweenService:Create(Notify,TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Position = UDim2.new(2, 0, 0.856, 0)}):Play() 
        task.wait(tonumber(Config.Time) / 2)
        Notify.Visible = false
        task.wait(tonumber(Config.Time) / 2)
        Notify:Destroy()
    end)
end

function NightLib:CreateWindow(Config)
    Config = Config or {}
    Config.Title = Config.Title or ""
    Config.Cre = Config.Cre or ""
    
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")
    local Top = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local LogoHub = Instance.new("Frame")
    local Logo = Instance.new("ImageLabel")
    local UICorner_3 = Instance.new("UICorner")
    local UIStroke_2 = Instance.new("UIStroke")
    local NameHub = Instance.new("TextLabel")
    local UIGradient = Instance.new("UIGradient")
    local Creator = Instance.new("TextLabel")
    local UIGradient_2 = Instance.new("UIGradient")
    local CloseOpen = Instance.new("Frame")
    local UICorner_4 = Instance.new("UICorner")
    local Mini = Instance.new("TextButton")
    local Logo_2 = Instance.new("ImageLabel")
    local Close = Instance.new("TextButton")
    local Logo_3 = Instance.new("ImageLabel")
    local DropShadowHolder = Instance.new("Frame")
    local DropShadow = Instance.new("ImageLabel")
    local TabHolder = Instance.new("Frame")
    local UICorner_5 = Instance.new("UICorner")
    local UIStroke_3 = Instance.new("UIStroke")
    local ScrollingTab = Instance.new("ScrollingFrame")
    local UICorner_6 = Instance.new("UICorner")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local ChannelContainer = Instance.new("Frame")
    local Logo2 = Instance.new("ImageButton")
    local UICorner_26 = Instance.new("UICorner")

    Main.Name = "Main"
    Main.Parent = NightHubScreen
    Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.240774915, 0, 0.190283403, 0)
    Main.Size = UDim2.new(0, 481, 0, 326)

    Logo2.Name = "Logo2"
    Logo2.Parent = NightHubScreen
    Logo2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo2.BackgroundTransparency = 1.000
    Logo2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo2.BorderSizePixel = 0
    Logo2.Position = UDim2.new(0.25999999, 0, 0.215000004, 0)
    Logo2.Size = UDim2.new(0, 50, 0, 50)
    Logo2.Image = "rbxassetid://17717048927"
    Logo2.Visible = false
    Logo2.MouseButton1Click:Connect(function()
        TweenService:Create(Logo2, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 50, 0, 50)}):Play()
        TweenService:Create(Logo2, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.26, 0,0.215, 0)}):Play()
        wait(1)
        TweenService:Create(Main, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 481, 0, 326)}):Play()
        wait(.1)
        TweenService:Create(Main, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
        UIStroke.Enabled = true
        wait(1)
        Logo2.Visible = false
        DropShadowHolder.Visible = true
        ChannelContainer.Visible = true
        Top.Visible = true
        TabHolder.Visible = true
    end)

    UICorner_26.CornerRadius = UDim.new(1, 0)
    UICorner_26.Parent = Logo2

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Main

    UIStroke.Color = Color3.fromRGB(15, 15, 15)
    UIStroke.Thickness = 4
    UIStroke.Parent = Main

    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Top.BorderSizePixel = 0
    Top.Size = UDim2.new(1, 0, 0, 75)

    UICorner_2.CornerRadius = UDim.new(0, 5)
    UICorner_2.Parent = Top

    LogoHub.Name = "Logo Hub"
    LogoHub.Parent = Top
    LogoHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LogoHub.BackgroundTransparency = 1.000
    LogoHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
    LogoHub.BorderSizePixel = 0
    LogoHub.Position = UDim2.new(0.04158004, 0, 0.159999996, 0)
    LogoHub.Size = UDim2.new(0, 50, 0, 50)

    Logo.Name = "Logo"
    Logo.Parent = LogoHub
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo.BorderSizePixel = 0
    Logo.Size = UDim2.new(1, 0, 1, 0)
    Logo.Image = "rbxassetid://18129806724"

    UICorner_3.CornerRadius = UDim.new(1, 0)
    UICorner_3.Parent = LogoHub

    UIStroke_2.Color = Color3.fromRGB(40, 40, 40)
    UIStroke_2.Parent = LogoHub

    NameHub.Name = "NameHub"
    NameHub.Parent = Top
    NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.BackgroundTransparency = 1.000
    NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NameHub.BorderSizePixel = 0
    NameHub.Position = UDim2.new(0.17671518, 0, 0.159999996, 0)
    NameHub.Size = UDim2.new(0, 378, 0, 28)
    NameHub.Font = Enum.Font.SourceSansBold
    NameHub.Text = Config.Title
    NameHub.TextColor3 = Color3.fromRGB(200, 200, 200)
    NameHub.TextSize = 20.000
    NameHub.TextXAlignment = Enum.TextXAlignment.Left

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.22, Color3.fromRGB(153, 153, 153)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
    UIGradient.Parent = NameHub

    Creator.Name = "Creator"
    Creator.Parent = Top
    Creator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Creator.BackgroundTransparency = 1.000
    Creator.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Creator.BorderSizePixel = 0
    Creator.Position = UDim2.new(0.17671518, 0, 0.533333361, 0)
    Creator.Size = UDim2.new(0, 350, 0, 22)
    Creator.Font = Enum.Font.SourceSansBold
    Creator.Text = Config.Cre
    Creator.TextColor3 = Color3.fromRGB(200, 200, 200)
    Creator.TextSize = 18.000
    Creator.TextXAlignment = Enum.TextXAlignment.Left

    UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.03, Color3.fromRGB(165, 165, 165)), ColorSequenceKeypoint.new(0.23, Color3.fromRGB(97, 97, 97)), ColorSequenceKeypoint.new(0.42, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.86, Color3.fromRGB(28, 28, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
    UIGradient_2.Parent = Creator

    CloseOpen.Name = "CloseOpen"
    CloseOpen.Parent = Top
    CloseOpen.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    CloseOpen.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloseOpen.BorderSizePixel = 0
    CloseOpen.Position = UDim2.new(0.817047834, 0, 0.0799999982, 0)
    CloseOpen.Size = UDim2.new(0, 88, 0, 39)

    UICorner_4.Parent = CloseOpen

    Mini.Name = "Mini"
    Mini.Parent = CloseOpen
    Mini.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Mini.BackgroundTransparency = 1.000
    Mini.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Mini.BorderSizePixel = 0
    Mini.Size = UDim2.new(0, 42, 0, 39)
    Mini.Font = Enum.Font.SourceSansBold
    Mini.Text = ""
    Mini.TextColor3 = Color3.fromRGB(0, 0, 0)
    Mini.TextSize = 12.000
    Mini.MouseButton1Click:Connect(function()
        DropShadowHolder.Visible = false
        ChannelContainer.Visible = false
        Top.Visible = false
        TabHolder.Visible = false
        wait(.1)
        TweenService:Create(Main, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, -1, 0, 326)}):Play()
        wait(.1)
        TweenService:Create(Main, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000}):Play()
        UIStroke.Enabled = false
        wait(1)
        Logo2.Visible = true
        TweenService:Create(Logo2, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 35, 0, 35)}):Play()
        TweenService:Create(Logo2, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(-0, 0,0.523, 0)}):Play()
    end)

    Logo_2.Name = "Logo"
    Logo_2.Parent = Mini
    Logo_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo_2.BackgroundTransparency = 1.000
    Logo_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo_2.BorderSizePixel = 0
    Logo_2.Position = UDim2.new(0.261904776, 0, 0.205128208, 0)
    Logo_2.Size = UDim2.new(0, 22, 0, 22)
    Logo_2.Image = "rbxassetid://17585149799"

    Close.Name = "Close"
    Close.Parent = CloseOpen
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0, 42, 0, 0)
    Close.Size = UDim2.new(0, 46, 0, 39)
    Close.Font = Enum.Font.SourceSansBold
    Close.Text = ""
    Close.TextColor3 = Color3.fromRGB(0, 0, 0)
    Close.TextSize = 12.000
    Close.MouseButton1Click:Connect(function()
        DropShadowHolder.Visible = false
        ChannelContainer.Visible = false
        Top.Visible = false
        TabHolder.Visible = false
        wait(.1)
        TweenService:Create(Main, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, -1, 0, 326)}):Play()
        wait(.1)
        TweenService:Create(Main, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000}):Play()
        UIStroke.Enabled = false
        wait(1)
        NightHubScreen:Destroy()
    end)

    Logo_3.Name = "Logo"
    Logo_3.Parent = Close
    Logo_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo_3.BackgroundTransparency = 1.000
    Logo_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo_3.BorderSizePixel = 0
    Logo_3.Position = UDim2.new(0.190476194, 0, 0.179487184, 0)
    Logo_3.Size = UDim2.new(0, 25, 0, 25)
    Logo_3.Image = "rbxassetid://2777727756"

    DropShadowHolder.Name = "DropShadowHolder"
    DropShadowHolder.Parent = Main
    DropShadowHolder.BackgroundTransparency = 1.000
    DropShadowHolder.BorderSizePixel = 0
    DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
    DropShadowHolder.ZIndex = 0

    DropShadow.Name = "DropShadow"
    DropShadow.Parent = DropShadowHolder
    DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    DropShadow.BackgroundTransparency = 1.000
    DropShadow.BorderSizePixel = 0
    DropShadow.Position = UDim2.new(0.496881485, 0, 0.501533747, 0)
    DropShadow.Size = UDim2.new(1.01871097, 47, 1.02760732, 47)
    DropShadow.ZIndex = 0
    DropShadow.Image = "rbxassetid://6014261993"
    DropShadow.ImageTransparency = 0.500
    DropShadow.ScaleType = Enum.ScaleType.Slice
    DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

    TabHolder.Name = "Tab Holder"
    TabHolder.Parent = Main
    TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabHolder.BackgroundTransparency = 1.000
    TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabHolder.BorderSizePixel = 0
    TabHolder.Position = UDim2.new(0.04158004, 0, 0.230061352, 0)
    TabHolder.Size = UDim2.new(0, 50, 0, 241)

    UICorner_5.CornerRadius = UDim.new(0, 16)
    UICorner_5.Parent = TabHolder

    UIStroke_3.Color = Color3.fromRGB(70, 70, 70)
    UIStroke_3.Parent = TabHolder

    ScrollingTab.Name = "Scrolling Tab"
    ScrollingTab.Parent = TabHolder
    ScrollingTab.Active = true
    ScrollingTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollingTab.BackgroundTransparency = 1.000
    ScrollingTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ScrollingTab.BorderSizePixel = 0
    ScrollingTab.Position = UDim2.new(-0.0184198003, 0, -0.00398118049, 0)
    ScrollingTab.Size = UDim2.new(1, 0, 1, 0)
    ScrollingTab.ScrollBarThickness = 0
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            ScrollingTab.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
        end)
    end)

    UICorner_6.CornerRadius = UDim.new(0, 16)
    UICorner_6.Parent = ScrollingTab

    UIListLayout.Parent = ScrollingTab
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 3)

    UIPadding.Parent = ScrollingTab
    UIPadding.PaddingBottom = UDim.new(0, 5)
    UIPadding.PaddingLeft = UDim.new(0, 2)
    UIPadding.PaddingRight = UDim.new(0, 2)
    UIPadding.PaddingTop = UDim.new(0, 3)

    ChannelContainer.Name = "Channel Container"
    ChannelContainer.Parent = Main
    ChannelContainer.AnchorPoint = Vector2.new(1, 0)
    ChannelContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ChannelContainer.BackgroundTransparency = 1.000
    ChannelContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ChannelContainer.BorderSizePixel = 0
    ChannelContainer.Position = UDim2.new(0.99584198, 0, 0.230061352, 0)
    ChannelContainer.Size = UDim2.new(0, 396, 0, 242)

    MakeDraggable(Top, Main)

    local Tab = {}
    function Tab:CreateTab(Config)
        Config = Config or {}
        Config.Logo = Config.Logo or "rbxassetid://17567926152"
        Config.Name = Config.Name or ""

        local Tab1 = Instance.new("TextButton")
        local Logo_5 = Instance.new("ImageLabel")
        local UICorner_8 = Instance.new("UICorner")
        local Channel = Instance.new("ScrollingFrame")
        local UIListLayout_2 = Instance.new("UIListLayout")
        local UIPadding_2 = Instance.new("UIPadding")
        local NameTab = Instance.new("TextLabel")
        local UIPadding_3 = Instance.new("UIPadding")
        NameT = ""
        local defaults = false

        Tab1.Name = "Tab 1"
        Tab1.Parent = ScrollingTab
        Tab1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab1.BackgroundTransparency = 1.000
        Tab1.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab1.BorderSizePixel = 0
        Tab1.Position = UDim2.new(0.0184198003, 0, 0.157446802, 0)
        Tab1.Size = UDim2.new(0, 50, 0, 46)
        Tab1.Font = Enum.Font.SourceSansBold
        Tab1.Text = ""
        Tab1.TextColor3 = Color3.fromRGB(0, 0, 0)
        Tab1.TextSize = 14.000

        Logo_5.Name = "Logo"
        Logo_5.Parent = Tab1
        Logo_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Logo_5.BackgroundTransparency = 1.000
        Logo_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Logo_5.BorderSizePixel = 0
        Logo_5.Position = UDim2.new(0.150000006, 0, 0.156000003, 0)
        Logo_5.Size = UDim2.new(0, 30, 0, 30)
        Logo_5.Image = Config.Logo

        UICorner_8.CornerRadius = UDim.new(0, 18)
        UICorner_8.Parent = Tab1

        Channel.Name = "Channel"
        Channel.Parent = ChannelContainer
        Channel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Channel.BackgroundTransparency = 1.000
        Channel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Channel.BorderSizePixel = 0
        Channel.Size = UDim2.new(1, 0, 1, 0)
        Channel.ScrollBarThickness = 0
        Channel.Visible = false
        spawn(function()
            while wait() do
                Channel.CanvasSize = UDim2.new(0,0,0,UIListLayout_2.AbsoluteContentSize.Y + 20)
            end
        end)

        UIListLayout_2.Parent = Channel
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 7)

        UIPadding_2.Parent = Channel
        UIPadding_2.PaddingBottom = UDim.new(0, 2)
        UIPadding_2.PaddingLeft = UDim.new(0, 2)
        UIPadding_2.PaddingRight = UDim.new(0, 2)
        UIPadding_2.PaddingTop = UDim.new(0, 2)

        NameTab.Name = "NameTab"
        NameTab.Parent = Channel
        NameTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameTab.BackgroundTransparency = 1.000
        NameTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
        NameTab.BorderSizePixel = 0
        NameTab.Size = UDim2.new(1, 0, 0, 18)
        NameTab.Font = Enum.Font.SourceSansBold
        NameTab.Text = Config.Name
        NameTab.TextColor3 = Color3.fromRGB(255, 255, 255)
        NameTab.TextSize = 27.000
        NameTab.TextXAlignment = Enum.TextXAlignment.Left

        UIPadding_3.Parent = NameTab
        UIPadding_3.PaddingLeft = UDim.new(0, 4)

        Tab1.MouseButton1Click:Connect(function()
            for i, v in next, ChannelContainer:GetChildren() do
                if v.Name == "Channel" then
                    v.Visible = false
                end
                Channel.Visible = true
            end
            Logo_5.ImageColor3 = Color3.fromRGB(255, 255, 255)
            NameT = Tab1.Name
        end)
        
        if defaults == false then
            defaults = true
            Logo_5.ImageColor3 = Color3.fromRGB(144, 144, 144)
            ChannelContainer.Visible = true
            Channel.Visible = false
        end
        local TabContent = {}
        function TabContent:CreateButton(Config)
            Config = Config or {}
            Config.Name = Config.Name or "Button"
            Config.Description = Config.Description or ""
            Config.CallBack = Config.CallBack or function() end

            pcall(function()

                local Button = Instance.new("Frame")
                local UICorner_10 = Instance.new("UICorner")
                local ButtonClick = Instance.new("TextButton")
                local Title_2 = Instance.new("TextLabel")
                local UIPadding_6 = Instance.new("UIPadding")
                local Desc = Instance.new("TextLabel")
                local UIPadding_7 = Instance.new("UIPadding")
                local Logo_6 = Instance.new("ImageLabel")

                Button.Name = "Button"
                Button.Parent = Channel
                Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Button.BorderSizePixel = 0
                Button.Position = UDim2.new(0, 0, 0.386554629, 0)
                Button.Size = UDim2.new(1, 0, 0.0259162206, 35)

                UICorner_10.CornerRadius = UDim.new(0, 4)
                UICorner_10.Parent = Button

                ButtonClick.Name = "ButtonClick"
                ButtonClick.Parent = Button
                ButtonClick.Active = false
                ButtonClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonClick.BackgroundTransparency = 1.000
                ButtonClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ButtonClick.BorderSizePixel = 0
                ButtonClick.Selectable = false
                ButtonClick.Size = UDim2.new(1, 0, 0.262222707, 35)
                ButtonClick.Font = Enum.Font.SourceSansBold
                ButtonClick.Text = ""
                ButtonClick.TextColor3 = Color3.fromRGB(255, 255, 255)
                ButtonClick.TextSize = 17.000
                ButtonClick.TextXAlignment = Enum.TextXAlignment.Left

                Title_2.Name = "Title"
                Title_2.Parent = ButtonClick
                Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title_2.BackgroundTransparency = 1.000
                Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title_2.BorderSizePixel = 0
                Title_2.Position = UDim2.new(0, 0, 0, 3)
                Title_2.Size = UDim2.new(1, 0, 0.0476190485, 15)
                Title_2.Font = Enum.Font.SourceSansBold
                Title_2.Text = Config.Name
                Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Title_2.TextSize = 14.000
                Title_2.TextXAlignment = Enum.TextXAlignment.Left

                UIPadding_6.Parent = Title_2
                UIPadding_6.PaddingLeft = UDim.new(0, 6)

                Desc.Name = "Desc"
                Desc.Parent = ButtonClick
                Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Desc.BackgroundTransparency = 1.000
                Desc.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Desc.BorderSizePixel = 0
                Desc.Position = UDim2.new(0, 0, 0, 20)
                Desc.Size = UDim2.new(1, 0, 0.222222269, 15)
                Desc.Font = Enum.Font.SourceSansBold
                Desc.Text = Config.Description
                Desc.TextColor3 = Color3.fromRGB(100, 100, 100)
                Desc.TextSize = 14.000
                Desc.TextWrapped = true
                Desc.TextXAlignment = Enum.TextXAlignment.Left
                Desc.TextYAlignment = Enum.TextYAlignment.Top

                UIPadding_7.Parent = Desc
                UIPadding_7.PaddingLeft = UDim.new(0, 6)
                UIPadding_7.PaddingTop = UDim.new(0, 1)

                Logo_6.Name = "Logo"
                Logo_6.Parent = ButtonClick
                Logo_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Logo_6.BackgroundTransparency = 1.000
                Logo_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Logo_6.BorderSizePixel = 0
                Logo_6.Position = UDim2.new(1, -32, 0, 10)
                Logo_6.Size = UDim2.new(0, 25, 0, 25)
                Logo_6.Image = "rbxassetid://18130203284"

                ButtonClick.MouseButton1Click:Connect(function()
                    pcall(Config.CallBack)
                    Button.BackgroundColor3 = Color3.fromRGB(112, 112, 112)
                    TweenService:Create(Button, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
            end)
        end)
        end
        function TabContent:CreateToggle(Config)
            Config = Config or {}
            Config.Name = Config.Name or "Toggle"
            Config.Description = Config.Description or ""
            Config.Default = Config.Default or false
            Config.CallBack = Config.CallBack or function() end

                local Toggle = Instance.new("Frame")
                local UICorner_11 = Instance.new("UICorner")
                local ToggleClick = Instance.new("TextButton")
                local Title_3 = Instance.new("TextLabel")
                local UIPadding_8 = Instance.new("UIPadding")
                local Desc_2 = Instance.new("TextLabel")
                local UIPadding_9 = Instance.new("UIPadding")
                local ToggleClick_2 = Instance.new("Frame")
                local UICorner_12 = Instance.new("UICorner")
                local Checker = Instance.new("Frame")
                local UICorner_13 = Instance.new("UICorner")
                local Tggle = {}
                Toggled = false

                pcall(function()

                Toggle.Name = "Toggle"
                Toggle.Parent = Channel
                Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.BorderSizePixel = 0
                Toggle.Position = UDim2.new(0, 0, 0.615293205, 0)
                Toggle.Size = UDim2.new(1, 0, 0.0259162355, 35)

                UICorner_11.CornerRadius = UDim.new(0, 4)
                UICorner_11.Parent = Toggle

                ToggleClick.Name = "ToggleClick"
                ToggleClick.Parent = Toggle
                ToggleClick.Active = false
                ToggleClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleClick.BackgroundTransparency = 1.000
                ToggleClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ToggleClick.BorderSizePixel = 0
                ToggleClick.Selectable = false
                ToggleClick.Size = UDim2.new(1, 0, 0.261999995, 35)
                ToggleClick.Font = Enum.Font.SourceSansBold
                ToggleClick.Text = ""
                ToggleClick.TextColor3 = Color3.fromRGB(255, 255, 255)
                ToggleClick.TextSize = 17.000
                ToggleClick.TextXAlignment = Enum.TextXAlignment.Left

                Title_3.Name = "Title"
                Title_3.Parent = ToggleClick
                Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title_3.BackgroundTransparency = 1.000
                Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title_3.BorderSizePixel = 0
                Title_3.Position = UDim2.new(0, 0, 0, 3)
                Title_3.Size = UDim2.new(1, 0, 0.0476190485, 15)
                Title_3.Font = Enum.Font.SourceSansBold
                Title_3.Text = Config.Name
                Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
                Title_3.TextSize = 14.000
                Title_3.TextXAlignment = Enum.TextXAlignment.Left

                UIPadding_8.Parent = Title_3
                UIPadding_8.PaddingLeft = UDim.new(0, 6)

                Desc_2.Name = "Desc"
                Desc_2.Parent = ToggleClick
                Desc_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Desc_2.BackgroundTransparency = 1.000
                Desc_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Desc_2.BorderSizePixel = 0
                Desc_2.Position = UDim2.new(0, 0, 0, 20)
                Desc_2.Size = UDim2.new(1, 0, 0.222222269, 15)
                Desc_2.Font = Enum.Font.SourceSansBold
                Desc_2.Text = Config.Description
                Desc_2.TextColor3 = Color3.fromRGB(100, 100, 100)
                Desc_2.TextSize = 14.000
                Desc_2.TextWrapped = true
                Desc_2.TextXAlignment = Enum.TextXAlignment.Left
                Desc_2.TextYAlignment = Enum.TextYAlignment.Top

                UIPadding_9.Parent = Desc_2
                UIPadding_9.PaddingLeft = UDim.new(0, 6)
                UIPadding_9.PaddingTop = UDim.new(0, 1)

                ToggleClick_2.Name = "ToggleClick"
                ToggleClick_2.Parent = ToggleClick
                ToggleClick_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                ToggleClick_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ToggleClick_2.BorderSizePixel = 0
                ToggleClick_2.Position = UDim2.new(0.951530635, -32, 0.088888891, 10)
                ToggleClick_2.Size = UDim2.new(0, 44, 0, 17)

                UICorner_12.CornerRadius = UDim.new(0, 7)
                UICorner_12.Parent = ToggleClick_2

                Checker.Name = "Checker"
                Checker.Parent = ToggleClick_2
                Checker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Checker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Checker.BorderSizePixel = 0
                Checker.Position = UDim2.new(0, 0, -0.176470593, 0)
                Checker.Size = UDim2.new(0, 22, 0, 22)

                UICorner_13.CornerRadius = UDim.new(0, 999)
                UICorner_13.Parent = Checker

                ToggleClick.MouseButton1Click:Connect(function()
                    if Toggled == false then
                        TweenService:Create(Checker, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, -0.176470593, 0)}):Play()
                        TweenService:Create(ToggleClick_2, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(128, 218, 220)}):Play()
                    else
                        TweenService:Create(Checker, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, -0.176470593, 0)}):Play()
                        TweenService:Create(ToggleClick_2, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
                    end
                    Toggled = not Toggled
                    pcall(Config.CallBack, Toggled)
                end)
                
                if Config.Default == true then
                    TweenService:Create(Checker, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, -0.176470593, 0)}):Play()
                    TweenService:Create(ToggleClick_2, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(128, 218, 220)}):Play()
                    Toggled = Config.Default
                    pcall(Config.CallBack, Toggled)
                end
    
                function Tggle:Set(Value)
                    if Value then
                        TweenService:Create(Checker, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, -0.176470593, 0)}):Play()
                        TweenService:Create(ToggleClick_2, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
                    else
                        TweenService:Create(Checker, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, -0.176470593, 0)}):Play()
                        TweenService:Create(ToggleClick_2, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(128, 218, 220)}):Play()
                    end       
                    Toggled = not Toggled
                    pcall(Config.CallBack, Toggled)
                end
                return Tggle

            end)
        end
        function TabContent:CreateDropdown(Config)
            Config = Config or {}
            Config.Name = Config.Name or "Dropdown"
            Config.Description = Config.Description or ""
            Config.Options = Config.Options or ""
            Config.Default = Config.Default or ""
            Config.CallBack = Config.CallBack or function() end

            pcall(function()

            local Dropdown = Instance.new("Frame")
            local UICorner_17 = Instance.new("UICorner")
            local Drop2 = Instance.new("TextButton")
            local Desc_4 = Instance.new("TextLabel")
            local UIPadding_12 = Instance.new("UIPadding")
            local Title_5 = Instance.new("TextLabel")
            local UIPadding_13 = Instance.new("UIPadding")
            local Ico = Instance.new("ImageLabel")
            local List1 = Instance.new("Frame")
            local UICorner_18 = Instance.new("UICorner")
            local List = Instance.new("ScrollingFrame")
            local UIPadding_14 = Instance.new("UIPadding")
            local UIListLayout_3 = Instance.new("UIListLayout")
            local DropFunc = {}
            Dropped = false

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = Channel
            Dropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Dropdown.BorderSizePixel = 0
            Dropdown.Position = UDim2.new(0, 0, 0.442687213, 0)
            Dropdown.Size = UDim2.new(1, 0, 0.0182779785, 35)

            UICorner_17.CornerRadius = UDim.new(0, 4)
            UICorner_17.Parent = Dropdown

            Drop2.Name = "Drop2"
            Drop2.Parent = Dropdown
            Drop2.Active = false
            Drop2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Drop2.BackgroundTransparency = 1.000
            Drop2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Drop2.BorderSizePixel = 0
            Drop2.Position = UDim2.new(0, 0, 4.11102889e-07, 0)
            Drop2.Selectable = false
            Drop2.Size = UDim2.new(1, 0, 0.0705607384, 35)
            Drop2.Font = Enum.Font.SourceSansBold
            Drop2.Text = ""
            Drop2.TextColor3 = Color3.fromRGB(255, 255, 255)
            Drop2.TextSize = 14.000

            Desc_4.Name = "Desc"
            Desc_4.Parent = Drop2
            Desc_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Desc_4.BackgroundTransparency = 1.000
            Desc_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Desc_4.BorderSizePixel = 0
            Desc_4.Position = UDim2.new(0, 0, 0, 20)
            Desc_4.Size = UDim2.new(0.923, 0, 0.222222239, 15)
            Desc_4.Font = Enum.Font.SourceSansBold
            Desc_4.Text = Config.Description
            Desc_4.TextColor3 = Color3.fromRGB(100, 100, 100)
            Desc_4.TextSize = 14.000
            Desc_4.TextWrapped = true
            Desc_4.TextXAlignment = Enum.TextXAlignment.Left
            Desc_4.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_12.Parent = Desc_4
            UIPadding_12.PaddingLeft = UDim.new(0, 6)
            UIPadding_12.PaddingTop = UDim.new(0, 1)

            Title_5.Name = "Title"
            Title_5.Parent = Drop2
            Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_5.BackgroundTransparency = 1.000
            Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_5.BorderSizePixel = 0
            Title_5.Size = UDim2.new(0.918, 0, 0.0476190411, 15)
            Title_5.Font = Enum.Font.SourceSansBold
            Title_5.Text = Config.Name .. " : ".. Config.Default
            Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_5.TextSize = 14.000
            Title_5.TextXAlignment = Enum.TextXAlignment.Left
            if Config.Default ~= "" and Config.Default ~= nil then
                Config.CallBack(Config.Default)
            end

            UIPadding_13.Parent = Title_5
            UIPadding_13.PaddingLeft = UDim.new(0, 6)

            Ico.Name = "Ico"
            Ico.Parent = Drop2
            Ico.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Ico.BackgroundTransparency = 1.000
            Ico.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Ico.BorderSizePixel = 0
            Ico.Position = UDim2.new(1, -32, 0, 10)
            Ico.Rotation = -90.000
            Ico.Size = UDim2.new(0, 25, 0, 25)
            Ico.Image = "rbxassetid://17584979104"

            List1.Name = "List1"
            List1.Parent = Dropdown
            List1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            List1.BorderColor3 = Color3.fromRGB(0, 0, 0)
            List1.BorderSizePixel = 0
            List1.Position = UDim2.new(0.0229591839, 0, 0.399854422, 0)
            List1.Size = UDim2.new(0, 374, 0, 57)
            List1.Visible = false

            UICorner_18.CornerRadius = UDim.new(0, 4)
            UICorner_18.Parent = List1

            List.Name = "List"
            List.Parent = List1
            List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            List.BackgroundTransparency = 1.000
            List.BorderColor3 = Color3.fromRGB(0, 0, 0)
            List.BorderSizePixel = 0
            List.Selectable = false
            List.Size = UDim2.new(1, 0, 1, 0)
            List.ScrollBarThickness = 0
            spawn(function()
                while wait() do
                    List.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_3.AbsoluteContentSize.Y)
                end
            end)

            UIPadding_14.Parent = List
            UIPadding_14.PaddingBottom = UDim.new(0, 2)
            UIPadding_14.PaddingTop = UDim.new(0, 2)

            UIListLayout_3.Parent = List
            UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_3.Padding = UDim.new(0, 2)

            for i, v in next, Config.Options do
                local Option1 = Instance.new("TextButton")

                Option1.Name = "Option1"
                Option1.Parent = List
                Option1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Option1.BackgroundTransparency = 1.000
                Option1.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Option1.BorderSizePixel = 0
                Option1.Size = UDim2.new(1, 0, 0, 20)
                Option1.Font = Enum.Font.SourceSansBold
                Option1.Text = tostring(v)
                Option1.TextColor3 = Color3.fromRGB(255, 255, 255)
                Option1.TextSize = 14.000

                Option1.MouseButton1Click:Connect(function()
                    Dropped = false
                    List1.Visible = false
                    Dropdown:TweenSize(UDim2.new(1, 0, 0, 35),"Out","Quad",0.3,true)
                    TweenService:Create(Ico, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = -90.000}):Play()
                    Option1.TextColor3 = Color3.fromRGB(255, 255, 255)
                    pcall(Option1.Text)
                    Config.CallBack(Option1.Text)
                    Title_5.Text = Config.Name .. " : " .. Option1.Text
                end)
            end

            Drop2.MouseButton1Click:Connect(function()
                if Dropped == false then
                    Dropped = true
                    Dropdown:TweenSize(UDim2.new(1, 0, 0.140, 35),"Out","Quad",0.3,true)
                    TweenService:Create(Ico, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0}):Play()
                    wait(.2)
                    List1.Visible = true
                else
                    Dropped = false
                    Dropdown:TweenSize(UDim2.new(1, 0, 0, 35),"Out","Quad",0.3,true)
                    TweenService:Create(Ico, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = -90.000}):Play()
                    List1.Visible = false
                end
            end)

            if Dropped == false then
                List1.Visible = false
            end

            function DropFunc:Set(OptionName)
                for i, v in pairs(List:GetChildren()) do
                    if v.ClassName == "Button" then
                        if v.Name == OptionName then
                            v.TextColor3 = Color3.fromRGB(255, 255, 255)
                            Title_5.Text = Config.Name .. " : ".. OptionName .. ""
                            pcall(Title_5.Text)
                        end
                    end
                end
            end

            function DropFunc:Add(Option)
                for i, v in next, Option do
                    local Option1 = Instance.new("TextButton")

                    Option1.Name = "Option1"
                    Option1.Parent = List
                    Option1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Option1.BackgroundTransparency = 1.000
                    Option1.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Option1.BorderSizePixel = 0
                    Option1.Size = UDim2.new(1, 0, 0, 20)
                    Option1.Font = Enum.Font.SourceSansBold
                    Option1.Text = tostring(v)
                    Option1.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Option1.TextSize = 14.000

                    Option1.MouseButton1Click:Connect(function()
                        Dropped = false
                        List1.Visible = false
                        Dropdown:TweenSize(UDim2.new(1, 0, 0, 35),"Out","Quad",0.3,true)
                        TweenService:Create(Ico, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = -90.000}):Play()
                        Option1.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Config.CallBack(Option1.Text)
                        Title_5.Text = Config.Name .. " : ".. Option1.Text .. ""
                    end)
                end
            end

            function DropFunc:Refresh(Option)
                for i, v in pairs(List:GetChildren()) do
                    if v.Name == "Option1" then
                        v:Destroy()
                    end
                end
                Dropped = false
                Dropdown:TweenSize(UDim2.new(1, 0, 0, 35),"Out","Quad",0.3,true)
                List1.Visible = false
                TweenService:Create(Ico, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = -90.000}):Play()
                DropFunc:Add(Option)
                Title_5.Text = Config.Name
            end
            return DropFunc
        end)
        end
        function TabContent:CreateSlider(Config)
            Config = Config or {}
            Config.Name = Config.Name or "Slider"
            Config.Max = Config.Max or 100
            Config.Min = Config.Min or 1
            Config.Default = Config.Default or 50
            Config.CallBack = Config.CallBack or function() end

            pcall(function()

            local Slider = Instance.new("Frame")
            local UICorner_19 = Instance.new("UICorner")
            local Title_6 = Instance.new("TextLabel")
            local UIPadding_15 = Instance.new("UIPadding")
            local SliderFrame = Instance.new("Frame")
            local Frame = Instance.new("Frame")
            local UICorner_20 = Instance.new("UICorner")
            local UICorner_21 = Instance.new("UICorner")
            local Valie = Instance.new("TextLabel")
            local SliderFunc = {Value = Config.Default}

            Slider.Name = "Slider"
            Slider.Parent = Channel
            Slider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Slider.BorderSizePixel = 0
            Slider.Size = UDim2.new(1, 0, 0, 43)

            UICorner_19.CornerRadius = UDim.new(0, 4)
            UICorner_19.Parent = Slider

            Title_6.Name = "Title"
            Title_6.Parent = Slider
            Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_6.BackgroundTransparency = 1.000
            Title_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_6.BorderSizePixel = 0
            Title_6.Position = UDim2.new(0, 0, 0, 3)
            Title_6.Size = UDim2.new(1, 0, 0, 18)
            Title_6.Font = Enum.Font.SourceSansBold
            Title_6.Text = Config.Name
            Title_6.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_6.TextSize = 14.000
            Title_6.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_15.Parent = Title_6
            UIPadding_15.PaddingLeft = UDim.new(0, 7)

            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = Slider
            SliderFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Position = UDim2.new(0, 9, 0, 22)
            SliderFrame.Size = UDim2.new(0, 374, 0, 11)

            Frame.Name = "Frame"
            Frame.Parent = SliderFrame
            Frame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.new(0, 187, 0, 11)

            UICorner_20.CornerRadius = UDim.new(0, 4)
            UICorner_20.Parent = Frame

            UICorner_21.CornerRadius = UDim.new(0, 4)
            UICorner_21.Parent = SliderFrame

            Valie.Name = "Value"
            Valie.Parent = SliderFrame
            Valie.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Valie.BackgroundTransparency = 1.000
            Valie.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Valie.BorderSizePixel = 0
            Valie.Position = UDim2.new(0.403743327, 0, 0, 0)
            Valie.Size = UDim2.new(0.0935828909, 50, 1, 0)
            Valie.Font = Enum.Font.SourceSansBold
            Valie.Text = tonumber(Config.Default)
            Valie.TextColor3 = Color3.fromRGB(255, 255, 255)
            Valie.TextSize = 14.000

            local Dragging = false
			local function Round(Number, Factor)
				local Result = math.floor(Number/Factor + (math.sign(Number) * 0.5)) * Factor
				if Result < 0 then Result = Result + Factor end
				return Result
			end
			function SliderFunc:Set(Value)
				Value = math.clamp(Round(Value, 1), Config.Min, Config.Max)
				SliderFunc.Value = Value
				Valie.Text = tostring(Value)
				TweenService:Create(
					Frame,
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Size = UDim2.fromScale((Value - Config.Min) / (Config.Max - Config.Min), 1)}
				):Play()
			end
			Frame.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = true 
				end 
			end)
			Frame.InputEnded:Connect(function(Input) 
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = false 
					Config.CallBack(SliderFunc.Value)
				end 
			end)
			uis.InputChanged:Connect(function(Input)
				if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then 
					local SizeScale = math.clamp((Input.Position.X - Frame.AbsolutePosition.X) / Frame.AbsoluteSize.X, 0, 1)
					SliderFunc:Set(Config.Min + ((Config.Max - Config.Min) * SizeScale)) 
				end
			end)
			Valie:GetPropertyChangedSignal("Text"):Connect(function()
				local Valid = Valie.Text:gsub("[^%d]", "")
				if Valid ~= "" then
					local ValidNumber = math.min(tonumber(Valid), Config.Max)
					Valie.Text = tostring(ValidNumber)
				else
					Valie.Text = tostring(Valid)
				end
			end)
			SliderFunc:Set(tonumber(Config.Default))
			return SliderFunc       
        end)
        end
        function TabContent:CreateLabel(Config)
            Config = Config or {}
            Config.Text = Config.Text or "Label"

            local Label = Instance.new("Frame")
            local Title = Instance.new("TextLabel")
            local UIPadding_4 = Instance.new("UIPadding")
            local UICorner_9 = Instance.new("UICorner")
            local Lbel = {}

            Label.Name = "Label"
            Label.Parent = Channel
            Label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Label.BorderSizePixel = 0
            Label.Position = UDim2.new(0, 0, 0.105042018, 0)
            Label.Size = UDim2.new(1, 0, 0, 35)

            Title.Name = "Title"
            Title.Parent = Label
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title.BorderSizePixel = 0
            Title.Size = UDim2.new(1, 0, 1, 0)
            Title.Font = Enum.Font.SourceSansBold
            Title.Text = Config.Text
            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title.TextSize = 15.000
            Title.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_4.Parent = Title
            UIPadding_4.PaddingLeft = UDim.new(0, 4)

            UICorner_9.CornerRadius = UDim.new(0, 4)
            UICorner_9.Parent = Label

            function Lbel:Set(Concac)
                Title.Text = Concac
            end
            return Lbel
        end
        function TabContent:CreateSection(Config)
            Config = Config or {}
            Config.Text = Config.Text or {}

            local Section = Instance.new("TextLabel")
            local UIPadding_5 = Instance.new("UIPadding")
            local Sec = {}

            Section.Name = "Section"
            Section.Parent = Channel
            Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Section.BackgroundTransparency = 1.000
            Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Section.BorderSizePixel = 0
            Section.Size = UDim2.new(1, 0, 0, 18)
            Section.Font = Enum.Font.SourceSansBold
            Section.Text = Config.Text
            Section.TextColor3 = Color3.fromRGB(255, 255, 255)
            Section.TextSize = 20.000
            Section.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_5.Parent = Section
            UIPadding_5.PaddingLeft = UDim.new(0, 4)
            return Sec
        end
        function TabContent:CreateParagraph(Config)

            Config = Config or {}
            Config.Title = Config.Title or "Paragraph"
            Config.Content = Config.Content or ""

            local Paragraph = Instance.new("Frame")
            local UICorner_22 = Instance.new("UICorner")
            local Title_7 = Instance.new("TextLabel")
            local UIPadding_16 = Instance.new("UIPadding")
            local Desc_5 = Instance.new("TextLabel")
            local UIPadding_17 = Instance.new("UIPadding")

            Paragraph.Name = "Paragraph"
            Paragraph.Parent = Channel
            Paragraph.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Paragraph.BorderSizePixel = 0
            Paragraph.Size = UDim2.new(1, 0, 0, 50)

            UICorner_22.CornerRadius = UDim.new(0, 4)
            UICorner_22.Parent = Paragraph

            Title_7.Name = "Title"
            Title_7.Parent = Paragraph
            Title_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_7.BackgroundTransparency = 1.000
            Title_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_7.BorderSizePixel = 0
            Title_7.Position = UDim2.new(0, 0, 0, 3)
            Title_7.Size = UDim2.new(1, 0, 0, 18)
            Title_7.Font = Enum.Font.SourceSansBold
            Title_7.Text = Config.Title
            Title_7.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_7.TextSize = 14.000
            Title_7.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_16.Parent = Title_7
            UIPadding_16.PaddingLeft = UDim.new(0, 7)

            Desc_5.Name = "Desc"
            Desc_5.Parent = Paragraph
            Desc_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Desc_5.BackgroundTransparency = 1.000
            Desc_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Desc_5.BorderSizePixel = 0
            Desc_5.Position = UDim2.new(0, 0, 0, 21)
            Desc_5.Size = UDim2.new(1, 0, -0.0599999987, 32)
            Desc_5.Font = Enum.Font.SourceSansBold
            Desc_5.Text = Config.Content
            Desc_5.TextColor3 = Color3.fromRGB(100, 100, 100)
            Desc_5.TextSize = 12.000
            Desc_5.TextXAlignment = Enum.TextXAlignment.Left
            Desc_5.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_17.Parent = Desc_5
            UIPadding_17.PaddingLeft = UDim.new(0, 7)
            UIPadding_17.PaddingTop = UDim.new(0, 2)
        end
        function TabContent:CreateTextBox(Config)

            Config = Config or {}
            Config.Name = Config.Name or ""
            Config.Description = Config.Description or ""
            Config.Default = Config.Default or ""
            Config.CallBack = Config.CallBack or function () end

            local Textbox = Instance.new("Frame")
            local UICorner_23 = Instance.new("UICorner")
            local Title_8 = Instance.new("TextLabel")
            local UIPadding_18 = Instance.new("UIPadding")
            local Desc_6 = Instance.new("TextLabel")
            local UIPadding_19 = Instance.new("UIPadding")
            local PutHere = Instance.new("TextBox")
            local UICorner_24 = Instance.new("UICorner")
            local UIStroke_4 = Instance.new("UIStroke")
            local InputFunc = {}

            Textbox.Name = "Textbox"
            Textbox.Parent = Channel
            Textbox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Textbox.BorderSizePixel = 0
            Textbox.Size = UDim2.new(1, 0, 0, 50)

            UICorner_23.CornerRadius = UDim.new(0, 4)
            UICorner_23.Parent = Textbox

            Title_8.Name = "Title"
            Title_8.Parent = Textbox
            Title_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_8.BackgroundTransparency = 1.000
            Title_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_8.BorderSizePixel = 0
            Title_8.Position = UDim2.new(0, 0, 0, 3)
            Title_8.Size = UDim2.new(1, 0, 0, 18)
            Title_8.Font = Enum.Font.SourceSansBold
            Title_8.Text = Config.Name
            Title_8.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_8.TextSize = 14.000
            Title_8.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_18.Parent = Title_8
            UIPadding_18.PaddingLeft = UDim.new(0, 7)

            Desc_6.Name = "Desc"
            Desc_6.Parent = Textbox
            Desc_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Desc_6.BackgroundTransparency = 1.000
            Desc_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Desc_6.BorderSizePixel = 0
            Desc_6.Position = UDim2.new(0, 0, 0, 21)
            Desc_6.Size = UDim2.new(1, 0, -0.0599999987, 32)
            Desc_6.Font = Enum.Font.SourceSansBold
            Desc_6.Text = Config.Description
            Desc_6.TextColor3 = Color3.fromRGB(100, 100, 100)
            Desc_6.TextSize = 12.000
            Desc_6.TextXAlignment = Enum.TextXAlignment.Left
            Desc_6.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_19.Parent = Desc_6
            UIPadding_19.PaddingLeft = UDim.new(0, 7)
            UIPadding_19.PaddingTop = UDim.new(0, 3)

            PutHere.Name = "PutHere"
            PutHere.Parent = Textbox
            PutHere.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            PutHere.BorderColor3 = Color3.fromRGB(0, 0, 0)
            PutHere.BorderSizePixel = 0
            PutHere.Position = UDim2.new(1, -99, 0.180000007, 0)
            PutHere.Size = UDim2.new(0, 91, 0, 24)
            PutHere.Font = Enum.Font.SourceSans
            PutHere.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            PutHere.Text = Config.Default
            PutHere.ClipsDescendants = true
            PutHere.TextColor3 = Color3.fromRGB(255, 255, 255)
            PutHere.TextSize = 14.000

            UICorner_24.CornerRadius = UDim.new(0, 4)
            UICorner_24.Parent = PutHere

            UIStroke_4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            UIStroke_4.Color = Color3.fromRGB(100, 100, 100)
            UIStroke_4.Parent = PutHere

            function InputFunc:Set(Value)
				PutHere.Text = Value
			end
			PutHere.Focused:Connect(function()
			end)
			PutHere.FocusLost:Connect(function()
				PutHere.Size = UDim2.new(0, 91, 0, 24)
				Config.CallBack(PutHere.Text)
			end)
			return InputFunc
        end
        return TabContent
    end
    return Tab
end
return NightLib
