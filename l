local plr = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local Runservice = game:GetService("RunService")
local httpservice = game:GetService("HttpService")
local mouse = plr:GetMouse()
local TweenService = game:GetService("TweenService")
local SitinksHub = Instance.new("ScreenGui")
SitinksHub.Name = "Sitinks Hub"
SitinksHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local SitinksLib = {}

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

function SitinksLib:Notify(Configs)
    Configs = Configs or {}
    Configs.Title = Configs.Title or "Notify"
    Configs.Description = Configs.Description or "Description"
    Configs.Time = Configs.Time or 5

    spawn(function()
        local Notify = Instance.new("Frame")
        local UICorner_23 = Instance.new("UICorner")
        local Features_7 = Instance.new("Frame")
        local Title_10 = Instance.new("TextLabel")
        local UIPadding_21 = Instance.new("UIPadding")
        local Desc_6 = Instance.new("TextLabel")
        local UIPadding_22 = Instance.new("UIPadding")

        Notify.Name = "Notify"
        Notify.Parent = SitinksHub
        Notify.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Notify.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Notify.BorderSizePixel = 0
        Notify.Position = UDim2.new(1.732472301, 0, 0.866172493, 0)
        Notify.Size = UDim2.new(0, 281, 0, 58)

        UICorner_23.CornerRadius = UDim.new(0, 2)
        UICorner_23.Parent = Notify

        Features_7.Name = "Features"
        Features_7.Parent = Notify
        Features_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Features_7.BackgroundTransparency = 1.000
        Features_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Features_7.BorderSizePixel = 0
        Features_7.Size = UDim2.new(1, 0, 1, 0)

        Title_10.Name = "Title"
        Title_10.Parent = Features_7
        Title_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title_10.BackgroundTransparency = 1.000
        Title_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Title_10.BorderSizePixel = 0
        Title_10.Size = UDim2.new(1, 0, 0, 18)
        Title_10.Font = Enum.Font.GothamBold
        Title_10.Text = Configs.Title
        Title_10.TextColor3 = Color3.fromRGB(200, 200, 200)
        Title_10.TextSize = 14.000
        Title_10.TextXAlignment = Enum.TextXAlignment.Left

        UIPadding_21.Parent = Title_10
        UIPadding_21.PaddingLeft = UDim.new(0, 4)
        UIPadding_21.PaddingTop = UDim.new(0, 2)

        Desc_6.Name = "Desc"
        Desc_6.Parent = Features_7
        Desc_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Desc_6.BackgroundTransparency = 1.000
        Desc_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Desc_6.BorderSizePixel = 0
        Desc_6.Position = UDim2.new(0, 0, 0, 18)
        Desc_6.Size = UDim2.new(1, 0, 0.137931034, 32)
        Desc_6.Font = Enum.Font.GothamBold
        Desc_6.Text = Configs.Description
        Desc_6.TextColor3 = Color3.fromRGB(100, 100, 100)
        Desc_6.TextSize = 13.000
        Desc_6.TextXAlignment = Enum.TextXAlignment.Left
        Desc_6.TextYAlignment = Enum.TextYAlignment.Top

        UIPadding_22.Parent = Desc_6
        UIPadding_22.PaddingLeft = UDim.new(0, 4)
        UIPadding_22.PaddingTop = UDim.new(0, 2)
        
        TweenService:Create(Notify,TweenInfo.new(3, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Position = UDim2.new(0.732472301, 0, 0.866172493, 0)}):Play()
        task.wait(tonumber(Configs.Time))
        TweenService:Create(Notify,TweenInfo.new(3, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),{Position = UDim2.new(2, 0, 0.856, 0)}):Play() 
        task.wait(tonumber(Configs.Time) / 2)
        Notify.Visible = false
        task.wait(tonumber(Configs.Time) / 2)
        Notify:Destroy()
    end)
end

function SitinksLib:CreateWindow(Configs)
    Configs = Configs or {}
    Configs.Title = Configs.Title or "Sitinks Hub"

    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Top = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Top2 = Instance.new("Frame")
    local NameHub = Instance.new("TextLabel")
    local UIPadding = Instance.new("UIPadding")
    local CloseOpen = Instance.new("Frame")
    local Mini = Instance.new("TextButton")
    local Logo = Instance.new("ImageLabel")
    local Close = Instance.new("TextButton")
    local Logo_2 = Instance.new("ImageLabel")
    local TabHolder = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local Hide = Instance.new("Frame")
    local Hide2 = Instance.new("Frame")
    local TabList = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local ChannelContainer = Instance.new("Frame")
    local UICorner_4 = Instance.new("UICorner")
    local LogoCloseOpen = Instance.new("Frame")
    local UICorner_28 = Instance.new("UICorner")
    local FrameClose = Instance.new("TextButton")
    local Logo_6 = Instance.new("ImageButton")
    local UICorner_29 = Instance.new("UICorner")
    MiniSized = false

    Main.Name = "Main"
    Main.Parent = SitinksHub
    Main.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.318382353, 0, 0.15384616, 0)
    Main.Size = UDim2.new(0, 562, 0, 389)

    LogoCloseOpen.Name = "LogoCloseOpen"
    LogoCloseOpen.Parent = SitinksHub
    LogoCloseOpen.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    LogoCloseOpen.BorderColor3 = Color3.fromRGB(0, 0, 0)
    LogoCloseOpen.BorderSizePixel = 0
    LogoCloseOpen.Position = UDim2.new(0.142066419, 0, 0.151821867, 0)
    LogoCloseOpen.Size = UDim2.new(0, 45, 0, 45)

    FrameClose.Name = "FrameClose"
    FrameClose.Parent = Features_4
    FrameClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    FrameClose.BackgroundTransparency = 1.000
    FrameClose.BorderColor3 = Color3.fromRGB(0, 0, 0)
    FrameClose.BorderSizePixel = 0
    FrameClose.Size = UDim2.new(1, 0, 1, 0)
    FrameClose.Font = Enum.Font.SourceSans
    FrameClose.Text = ""
    FrameClose.TextColor3 = Color3.fromRGB(0, 0, 0)
    FrameClose.TextSize = 14.000
    FrameClose.MouseButton1Click:Connect(function()
        if MiniSized == true then
            MiniSized = false
            Main.Visible = true
        elseif MiniSized == false then
            MiniSized = true
            Main.Visible = false
        end
    end)

    UICorner_28.CornerRadius = UDim.new(0, 5)
    UICorner_28.Parent = LogoCloseOpen

    Logo_6.Name = "Logo"
    Logo_6.Parent = LogoCloseOpen
    Logo_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo_6.BackgroundTransparency = 1.000
    Logo_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo_6.BorderSizePixel = 0
    Logo_6.Size = UDim2.new(1, 0, 1, 0)
    Logo_6.Image = "rbxassetid://18225715872"
    Logo_6.MouseButton1Click:Connect(function()
        if MiniSized == true then
            MiniSized = false
            Main.Visible = true
        elseif MiniSized == false then
            MiniSized = true
            Main.Visible = false
        end
    end)

    UICorner_29.CornerRadius = UDim.new(0, 5)
    UICorner_29.Parent = Logo_6

    UICorner.CornerRadius = UDim.new(0, 3)
    UICorner.Parent = Main

    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
    Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Top.BorderSizePixel = 0
    Top.Size = UDim2.new(1, 0, -0.0413691998, 40)

    UICorner_2.CornerRadius = UDim.new(0, 3)
    UICorner_2.Parent = Top

    Top2.Name = "Top2"
    Top2.Parent = Top
    Top2.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
    Top2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Top2.BorderSizePixel = 0
    Top2.Position = UDim2.new(0, 0, 0.789423883, 0)
    Top2.Size = UDim2.new(1, 0, -0.108980976, 20)

    NameHub.Name = "NameHub"
    NameHub.Parent = Top
    NameHub.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
    NameHub.BackgroundTransparency = 1.000
    NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NameHub.BorderSizePixel = 0
    NameHub.Size = UDim2.new(1, 0, 1.4666667, 0)
    NameHub.Font = Enum.Font.GothamBold
    NameHub.Text = Configs.Title
    NameHub.TextColor3 = Color3.fromRGB(255, 206, 207)
    NameHub.TextSize = 20.000
    NameHub.TextXAlignment = Enum.TextXAlignment.Left

    UIPadding.Parent = NameHub
    UIPadding.PaddingLeft = UDim.new(0, 12)

    CloseOpen.Name = "CloseOpen"
    CloseOpen.Parent = Top
    CloseOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseOpen.BackgroundTransparency = 1.000
    CloseOpen.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloseOpen.BorderSizePixel = 0
    CloseOpen.Position = UDim2.new(0.90196079, 0, 0, 0)
    CloseOpen.Size = UDim2.new(0, 50, 0, 19)

    Mini.Name = "Mini"
    Mini.Parent = CloseOpen
    Mini.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Mini.BackgroundTransparency = 1.000
    Mini.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Mini.BorderSizePixel = 0
    Mini.Size = UDim2.new(0, 25, 0, 19)
    Mini.Font = Enum.Font.SourceSans
    Mini.Text = ""
    Mini.TextColor3 = Color3.fromRGB(0, 0, 0)
    Mini.TextSize = 14.000
    Mini.MouseButton1Click:Connect(function()
        MiniSized = true
        Main.Visible = false
    end)

    Logo.Name = "Logo"
    Logo.Parent = Mini
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo.BorderSizePixel = 0
    Logo.Position = UDim2.new(0.119999997, 0, 0, 0)
    Logo.Size = UDim2.new(0, 18, 0, 17)
    Logo.Image = "rbxassetid://17585149799"

    Close.Name = "Close"
    Close.Parent = CloseOpen
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.BorderColor3 = Color3.fromRGB(255, 255, 255)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.5, 0, 0, 0)
    Close.Size = UDim2.new(0, 25, 0, 19)
    Close.Font = Enum.Font.SourceSans
    Close.Text = ""
    Close.TextColor3 = Color3.fromRGB(0, 0, 0)
    Close.TextSize = 14.000
    Close.MouseButton1Click:Connect(function()
        SitinksHub:Destroy()
    end)

    Logo_2.Name = "Logo"
    Logo_2.Parent = Close
    Logo_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo_2.BackgroundTransparency = 1.000
    Logo_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo_2.BorderSizePixel = 0
    Logo_2.Position = UDim2.new(0.0799999982, 0, 0, 0)
    Logo_2.Size = UDim2.new(0, 23, 0, 19)
    Logo_2.Image = "rbxassetid://2777727756"

    TabHolder.Name = "Tab Holder"
    TabHolder.Parent = Main
    TabHolder.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabHolder.BorderSizePixel = 0
    TabHolder.Position = UDim2.new(0, 0, 0.10511364, 0)
    TabHolder.Size = UDim2.new(0, 140, 0, 348)

    UICorner_3.CornerRadius = UDim.new(0, 3)
    UICorner_3.Parent = TabHolder

    Hide.Name = "Hide"
    Hide.Parent = TabHolder
    Hide.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Hide.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Hide.BorderSizePixel = 0
    Hide.Size = UDim2.new(1, 0, 0, 20)

    Hide2.Name = "Hide2"
    Hide2.Parent = TabHolder
    Hide2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    Hide2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Hide2.BorderSizePixel = 0
    Hide2.Position = UDim2.new(0.871428549, 0, 0, 0)
    Hide2.Size = UDim2.new(0.128571436, 0, 0.93650794, 20)

    TabList.Name = "Tab List"
    TabList.Parent = TabHolder
    TabList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabList.BackgroundTransparency = 1.000
    TabList.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabList.BorderSizePixel = 0
    TabList.Selectable = false
    TabList.Size = UDim2.new(1, 0, 1, 0)
    TabList.ScrollBarThickness = 1
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            TabList.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
        end)
    end)

    UIListLayout.Parent = TabList
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 4)

    ChannelContainer.Name = "Channel Container"
    ChannelContainer.Parent = Main
    ChannelContainer.AnchorPoint = Vector2.new(1, 0)
    ChannelContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    ChannelContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ChannelContainer.BorderSizePixel = 0
    ChannelContainer.Position = UDim2.new(1, 0, 0.105113678, 0)
    ChannelContainer.Size = UDim2.new(0, 422, 0, 348)

    UICorner_4.CornerRadius = UDim.new(0, 3)
    UICorner_4.Parent = ChannelContainer

    MakeDraggable(Top, Main)
    local TabCre = {}
    function TabCre:CreateTab(Configs)
        Configs = Configs or {}
        Configs.Name = Configs.Name or "Tab"

        local Tab = Instance.new("TextButton")
        local Channel = Instance.new("ScrollingFrame")
        local UIListLayout_2 = Instance.new("UIListLayout")
        local UIPadding_3 = Instance.new("UIPadding")
        local defaults = false
        local NameT = ""

        Tab.Name = "Tab"
        Tab.Parent = TabList
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab.BorderSizePixel = 0
        Tab.Size = UDim2.new(1, 0, 0, 40)
        Tab.Font = Enum.Font.GothamBold
        Tab.Text = Configs.Name
        Tab.TextColor3 = Color3.fromRGB(144, 144, 144)
        Tab.TextSize = 14.000

        Channel.Name = "Channel"
        Channel.Parent = ChannelContainer
        Channel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Channel.BackgroundTransparency = 1.000
        Channel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Channel.BorderSizePixel = 0
        Channel.Selectable = false
        Channel.Size = UDim2.new(1, 0, 1, 0)
        Channel.ScrollBarThickness = 1
        spawn(function()
            while wait() do
                Channel.CanvasSize = UDim2.new(0,0,0,UIListLayout_2.AbsoluteContentSize.Y + 20)
            end
        end)

        UIListLayout_2.Parent = Channel
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 8)

        UIPadding_3.Parent = Channel
        UIPadding_3.PaddingLeft = UDim.new(0, 6)
        UIPadding_3.PaddingRight = UDim.new(0, 6)
        UIPadding_3.PaddingTop = UDim.new(0, 5)

        Tab.MouseButton1Click:Connect(function()
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
            Tab.TextColor3 = Color3.fromRGB(255,255,255)
            Tab.BackgroundTransparency = 0.9500
            NameT = Tab.Name
        end)
        
        if defaults == false then
            defaults = true
            Tab.TextColor3 = Color3.fromRGB(144,144,144)
            ChannelContainer.Visible = true
            Channel.Visible = false
        end

        local InTab = {}
        function InTab:CreateSection(Configs)
            Configs = Configs or {}
            Configs.Text = Configs.Text or "Section"

            local Section = Instance.new("TextLabel")
            local UIPadding_4 = Instance.new("UIPadding")

            Section.Name = "Section"
            Section.Parent = Channel
            Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Section.BackgroundTransparency = 1.000
            Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Section.BorderSizePixel = 0
            Section.Size = UDim2.new(1, 0, 0, 18)
            Section.Font = Enum.Font.GothamBold
            Section.Text = Configs.Text
            Section.TextColor3 = Color3.fromRGB(200, 200, 200)
            Section.TextSize = 14.000
            Section.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_4.Parent = Section
            UIPadding_4.PaddingLeft = UDim.new(0, 1)
        end
        function InTab:CreateSectionContent(Configs)
            Configs = Configs or {}
            Configs.Text = Configs.Text or "Section"
            
            local SectionContent = Instance.new("Frame")
            local UICorner_5 = Instance.new("UICorner")
            local Title = Instance.new("TextLabel")
            local UIPadding_5 = Instance.new("UIPadding")
            local UIStroke = Instance.new("UIStroke")

            SectionContent.Name = "Section Content"
            SectionContent.Parent = Channel
            SectionContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionContent.BackgroundTransparency = 1.000
            SectionContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SectionContent.BorderSizePixel = 0
            SectionContent.Size = UDim2.new(1, 0, 0, 20)

            UICorner_5.CornerRadius = UDim.new(0, 2)
            UICorner_5.Parent = SectionContent

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
            UIPadding_5.PaddingBottom = UDim.new(0, 1)
            UIPadding_5.PaddingLeft = UDim.new(0, 4)

            UIStroke.Color = Color3.fromRGB(70, 70, 70)
            UIStroke.Thickness = 2
            UIStroke.Parent = SectionContent

        end
        function InTab:CreateButton(Configs)
            Configs = Configs or {}
            Configs.Name = Configs.Name or "Button"
            Configs.Description = Configs.Description or ""
            Configs.CallBack = Configs.CallBack or function() end

            local Button = Instance.new("Frame")
            local UICorner_14 = Instance.new("UICorner")
            local Features_3 = Instance.new("TextButton")
            local Title_4 = Instance.new("TextLabel")
            local UIPadding_10 = Instance.new("UIPadding")
            local Desc_3 = Instance.new("TextLabel")
            local UIPadding_11 = Instance.new("UIPadding")
            local Logo_3 = Instance.new("ImageLabel")

            Button.Name = "Button"
            Button.Parent = Channel
            Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(1, 0, 0, 55)

            UICorner_14.CornerRadius = UDim.new(0, 2)
            UICorner_14.Parent = Button

            Features_3.Name = "Features"
            Features_3.Parent = Button
            Features_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Features_3.BackgroundTransparency = 1.000
            Features_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Features_3.BorderSizePixel = 0
            Features_3.Size = UDim2.new(1, 0, 1, 0)

            Title_4.Name = "Title"
            Title_4.Parent = Features_3
            Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_4.BackgroundTransparency = 1.000
            Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_4.BorderSizePixel = 0
            Title_4.Size = UDim2.new(1, 0, 0, 18)
            Title_4.Font = Enum.Font.GothamBold
            Title_4.Text = Configs.Name
            Title_4.TextColor3 = Color3.fromRGB(200, 200, 200)
            Title_4.TextSize = 13.000
            Title_4.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_10.Parent = Title_4
            UIPadding_10.PaddingLeft = UDim.new(0, 4)

            Desc_3.Name = "Desc"
            Desc_3.Parent = Features_3
            Desc_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Desc_3.BackgroundTransparency = 1.000
            Desc_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Desc_3.BorderSizePixel = 0
            Desc_3.Position = UDim2.new(0, 0, 0, 18)
            Desc_3.Size = UDim2.new(1, 0, 0.0727272704, 32)
            Desc_3.Font = Enum.Font.GothamBold
            Desc_3.Text = Configs.Description
            Desc_3.TextColor3 = Color3.fromRGB(100, 100, 100)
            Desc_3.TextSize = 13.000
            Desc_3.TextXAlignment = Enum.TextXAlignment.Left
            Desc_3.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_11.Parent = Desc_3
            UIPadding_11.PaddingLeft = UDim.new(0, 4)

            Logo_3.Name = "Logo"
            Logo_3.Parent = Features_3
            Logo_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Logo_3.BackgroundTransparency = 1.000
            Logo_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Logo_3.BorderSizePixel = 0
            Logo_3.Position = UDim2.new(1, -32, 0, 15)
            Logo_3.Size = UDim2.new(0, 25, 0, 25)
            Logo_3.Image = "http://www.roblox.com/asset/?id=18225333886"
            Logo_3.ImageColor3 = Color3.fromRGB(100, 100, 100)

            Button.MouseEnter:Connect(function()
                Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end)

            Button.MouseLeave:Connect(function()
                Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            end)

            Features_3.MouseButton1Click:Connect(function()
                pcall(Configs.CallBack)
                Logo_3.ImageColor3 = Color3.fromRGB(0, 102, 255)
                TweenService:Create(Logo_3, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(144, 144, 144)}):Play()
            end)
        end
        function InTab:CreateToggle(Configs)
            Configs = Configs or {}
            Configs.Name = Configs.Name or "Toggle"
            Configs.Description = Configs.Description or ""
            Configs.Default = Configs.Default or false
            Configs.Settings = Configs.Settings or false
            Configs.CallBack = Configs.CallBack or function() end

            local ToggleDisable = Instance.new("Frame")
            local UICorner_6 = Instance.new("UICorner")
            local Features = Instance.new("Frame")
            local ToggleClick = Instance.new("TextButton")
            local Desc = Instance.new("TextLabel")
            local UIPadding_6 = Instance.new("UIPadding")
            local Title_2 = Instance.new("TextLabel")
            local UIPadding_7 = Instance.new("UIPadding")
            local CheckFrame = Instance.new("Frame")
            local UICorner_7 = Instance.new("UICorner")
            local UIStroke_2 = Instance.new("UIStroke")
            local Check = Instance.new("Frame")
            local UICorner_8 = Instance.new("UICorner")
            local SettingsToggle = Instance.new("Frame")
            local UICorner_9 = Instance.new("UICorner")
            local Clickvoday = Instance.new("TextButton")
            local SettingsToggle_4 = Instance.new("ImageLabel")
            local SettingsToggleTab = Instance.new("Frame")
            local UICorner_23 = Instance.new("UICorner")
            local Listtt = Instance.new("Frame")
            local UIListLayout_4 = Instance.new("UIListLayout")
            local UIPadding_21 = Instance.new("UIPadding")
            local CloseSettings = Instance.new("Frame")
            local SettingText = Instance.new("TextLabel")
            local Logo_5 = Instance.new("ImageLabel")
            local CloseSettings_2 = Instance.new("TextButton")
            local Shitc = Instance.new("UICorner")
            local Tggle = {}
            Toggled = false

            ToggleDisable.Name = "Toggle Disable"
            ToggleDisable.Parent = Channel
            ToggleDisable.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            ToggleDisable.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ToggleDisable.BorderSizePixel = 0
            ToggleDisable.ClipsDescendants = true
            ToggleDisable.Size = UDim2.new(1, 0, 0, 55)

            UICorner_6.CornerRadius = UDim.new(0, 2)
            UICorner_6.Parent = ToggleDisable

            Features.Name = "Features"
            Features.Parent = ToggleDisable
            Features.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Features.BackgroundTransparency = 1.000
            Features.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Features.BorderSizePixel = 0
            Features.Size = UDim2.new(1, 0, 1, 0)

            ToggleClick.Name = "ToggleClick"
            ToggleClick.Parent = Features
            ToggleClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleClick.BackgroundTransparency = 1.000
            ToggleClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ToggleClick.BorderSizePixel = 0
            ToggleClick.Size = UDim2.new(0.939, 0, 1, 0)
            ToggleClick.Font = Enum.Font.SourceSansBold
            ToggleClick.Text = ""
            ToggleClick.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleClick.TextSize = 14.000

            Desc.Name = "Desc"
            Desc.Parent = ToggleClick
            Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Desc.BackgroundTransparency = 1.000
            Desc.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Desc.BorderSizePixel = 0
            Desc.Position = UDim2.new(0, 0, 0, 18)
            Desc.Size = UDim2.new(1, 0, 0.0727272704, 32)
            Desc.Font = Enum.Font.GothamBold
            Desc.Text = Configs.Description
            Desc.TextColor3 = Color3.fromRGB(100, 100, 100)
            Desc.TextSize = 12.000
            Desc.TextWrapped = true
            Desc.TextXAlignment = Enum.TextXAlignment.Left
            Desc.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_6.Parent = Desc
            UIPadding_6.PaddingLeft = UDim.new(0, 4)

            Title_2.Name = "Title"
            Title_2.Parent = ToggleClick
            Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_2.BackgroundTransparency = 1.000
            Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_2.BorderSizePixel = 0
            Title_2.Size = UDim2.new(1, 0, 0, 18)
            Title_2.Font = Enum.Font.GothamBold
            Title_2.Text = Configs.Name
            Title_2.TextColor3 = Color3.fromRGB(200, 200, 200)
            Title_2.TextSize = 13.000
            Title_2.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_7.Parent = Title_2
            UIPadding_7.PaddingLeft = UDim.new(0, 4)

            CheckFrame.Name = "CheckFrame"
            CheckFrame.Parent = Features
            CheckFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CheckFrame.BackgroundTransparency = 1.000
            CheckFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            CheckFrame.BorderSizePixel = 0
            CheckFrame.Position = UDim2.new(1, -85, 0, 18)
            CheckFrame.Size = UDim2.new(0, 45, 0, 17)

            UICorner_7.CornerRadius = UDim.new(1, 0)
            UICorner_7.Parent = CheckFrame

            UIStroke_2.Color = Color3.fromRGB(70, 70, 70)
            UIStroke_2.Thickness = 2
            UIStroke_2.Parent = CheckFrame

            Check.Name = "Check"
            Check.Parent = CheckFrame
            Check.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            Check.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Check.BorderSizePixel = 0
            Check.Position = UDim2.new(0, 2, 0, 1)
            Check.Size = UDim2.new(0, 15, 0, 15)

            UICorner_8.CornerRadius = UDim.new(1, 0)
            UICorner_8.Parent = Check

            if Configs.Settings == true then

            Clickvoday.Name = "Clickvoday"
            Clickvoday.Parent = Features
            Clickvoday.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            Clickvoday.BackgroundTransparency = 0
            Clickvoday.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Clickvoday.BorderSizePixel = 0
            Clickvoday.Position = UDim2.new(1, -25, 0, 0)
            Clickvoday.Size = UDim2.new(0, 25, 1, 0)
            Clickvoday.Font = Enum.Font.SourceSans
            Clickvoday.Text = ""
            Clickvoday.TextColor3 = Color3.fromRGB(0, 0, 0)
            Clickvoday.TextSize = 14.000

            UICorner_9.CornerRadius = UDim.new(0, 4)
            UICorner_9.Parent = SettingsToggle

            Shitc.CornerRadius = UDim.new(0, 4)
            Shitc.Parent = Clickvoday

            SettingsToggle_4.Name = "SettingsToggle"
            SettingsToggle_4.Parent = Clickvoday
            SettingsToggle_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SettingsToggle_4.BackgroundTransparency = 1.000
            SettingsToggle_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SettingsToggle_4.BorderSizePixel = 0
            SettingsToggle_4.Position = UDim2.new(0.156079099, 0, 0.327272713, 0)
            SettingsToggle_4.Size = UDim2.new(0.643920898, 0, 0.345454544, 0)
            SettingsToggle_4.Image = "http://www.roblox.com/asset/?id=18220001952"
            SettingsToggle_4.ImageColor3 = Color3.fromRGB(200, 200, 200)

            SettingsToggleTab.Name = "SettingsToggleTab"
            SettingsToggleTab.Parent = ChannelContainer
            SettingsToggleTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            SettingsToggleTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SettingsToggleTab.BorderSizePixel = 0
            SettingsToggleTab.Position = UDim2.new(0.760663509, -100, 0, 0)
            SettingsToggleTab.Size = UDim2.new(0, 201, 0, 348)
            SettingsToggleTab.Visible = false

            UICorner_23.CornerRadius = UDim.new(0, 2)
            UICorner_23.Parent = SettingsToggleTab

            Listtt.Name = "Listtt"
            Listtt.Parent = SettingsToggleTab
            Listtt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Listtt.BackgroundTransparency = 1.000
            Listtt.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Listtt.BorderSizePixel = 0
            Listtt.Size = UDim2.new(1, 0, 1, 0)

            UIListLayout_4.Parent = Listtt
            UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_4.Padding = UDim.new(0, 7)

            UIPadding_21.Parent = Listtt
            UIPadding_21.PaddingBottom = UDim.new(0, 2)
            UIPadding_21.PaddingLeft = UDim.new(0, 2)
            UIPadding_21.PaddingRight = UDim.new(0, 2)

            CloseSettings.Name = "CloseSettings"
            CloseSettings.Parent = Listtt
            CloseSettings.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            CloseSettings.BorderColor3 = Color3.fromRGB(0, 0, 0)
            CloseSettings.BorderSizePixel = 0
            CloseSettings.Size = UDim2.new(1, 0, 0, 40)

            SettingText.Name = "SettingText"
            SettingText.Parent = CloseSettings
            SettingText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SettingText.BackgroundTransparency = 1.000
            SettingText.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SettingText.BorderSizePixel = 0
            SettingText.Position = UDim2.new(0.223350257, 0, 0, 0)
            SettingText.Size = UDim2.new(0, 156, 0, 40)
            SettingText.Font = Enum.Font.GothamBold
            SettingText.Text = "Settings"
            SettingText.TextColor3 = Color3.fromRGB(200, 200, 200)
            SettingText.TextSize = 10.000
            SettingText.TextXAlignment = Enum.TextXAlignment.Left

            Logo_5.Name = "Logo"
            Logo_5.Parent = CloseSettings
            Logo_5.Active = true
            Logo_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Logo_5.BackgroundTransparency = 1.000
            Logo_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Logo_5.BorderSizePixel = 0
            Logo_5.Position = UDim2.new(0.0304568522, 0, 0.25, 0)
            Logo_5.Selectable = true
            Logo_5.Size = UDim2.new(0, 20, 0, 20)
            Logo_5.Image = "http://www.roblox.com/asset/?id=18226186151"
            Logo_5.ImageColor3 = Color3.fromRGB(222, 222, 222)

            CloseSettings_2.Name = "CloseSettings"
            CloseSettings_2.Parent = CloseSettings
            CloseSettings_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CloseSettings_2.BackgroundTransparency = 1.000
            CloseSettings_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            CloseSettings_2.BorderSizePixel = 0
            CloseSettings_2.Size = UDim2.new(0, 40, 0, 40)
            CloseSettings_2.Font = Enum.Font.SourceSans
            CloseSettings_2.Text = ""
            CloseSettings_2.TextColor3 = Color3.fromRGB(0, 0, 0)
            CloseSettings_2.TextSize = 14.000

            Clickvoday.MouseButton1Click:Connect(function()
                SettingsToggleTab.Visible = true
            end)
            
            CloseSettings_2.MouseButton1Click:Connect(function()
                SettingsToggleTab.Visible = false
            end)

            end

            ToggleDisable.MouseEnter:Connect(function()
                ToggleDisable.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            end)

            ToggleDisable.MouseLeave:Connect(function()
                ToggleDisable.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            end)

            ToggleClick.MouseButton1Click:Connect(function()
                if Toggled == false then
                    TweenService:Create(Title_2, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 28, 0, 1)}):Play()
                    TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                    TweenService:Create(UIStroke_2, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(0, 102, 255)}):Play()
                else
                    TweenService:Create(Title_2, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(222, 222, 222)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 2, 0, 1)}):Play()
                    TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000}):Play()
                    TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
                    TweenService:Create(UIStroke_2, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(70, 70, 70)}):Play()
                end
                Toggled = not Toggled
                pcall(Configs.CallBack, Toggled)
            end)

            if Configs.Default == true then
                TweenService:Create(Title_2, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 28, 0, 1)}):Play()
                TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                TweenService:Create(UIStroke_2, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(0, 102, 255)}):Play()
                Toggled = Configs.Default
                pcall(Configs.CallBack, Toggled)
            end

            function Tggle:Set(Value)
                if Value then
                    TweenService:Create(Title_2, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 28, 0, 1)}):Play()
                    TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                    TweenService:Create(UIStroke_2, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(0, 102, 255)}):Play()
                else
                    TweenService:Create(Title_2, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(222, 222, 222)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
                    TweenService:Create(Check, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 2, 0, 1)}):Play()
                    TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000}):Play()
                    TweenService:Create(CheckFrame, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
                    TweenService:Create(UIStroke_2, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(70, 70, 70)}):Play()
                end       
                Toggled = not Toggled
                pcall(Configs.CallBack, Toggled)
            end

            function Tggle:CreateToggle(Cac)
                Cac = Cac or {}
                Cac.Name = Cac.Name or "Toggle"
                Cac.Default = Cac.Default or false
                Cac.CallBack = Cac.CallBack or function() end

                local Toggle = Instance.new("Frame")
                local Title_10 = Instance.new("TextLabel")
                local UIPadding_22 = Instance.new("UIPadding")
                local Checker = Instance.new("Frame")
                local UICorner_24 = Instance.new("UICorner")
                local UIStroke_5 = Instance.new("UIStroke")
                local Frame = Instance.new("Frame")
                local Click2 = Instance.new("TextButton")
                local UICorner_25 = Instance.new("UICorner")
                Shit = false

                Toggle.Name = "Toggle"
                Toggle.Parent = Listtt
                Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                Toggle.BackgroundTransparency = 1.000
                Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Toggle.BorderSizePixel = 0
                Toggle.Size = UDim2.new(1, 0, 0, 35)

                Click2.Name = "Click2"
                Click2.Parent = Toggle
                Click2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Click2.BackgroundTransparency = 1.000
                Click2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Click2.BorderSizePixel = 0
                Click2.Size = UDim2.new(1, 0, 1, 0)
                Click2.Font = Enum.Font.SourceSansBold
                Click2.Text = ""
                Click2.TextColor3 = Color3.fromRGB(0, 0, 0)
                Click2.TextSize = 14.000

                Title_10.Name = "Title"
                Title_10.Parent = Toggle
                Title_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title_10.BackgroundTransparency = 1.000
                Title_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Title_10.BorderSizePixel = 0
                Title_10.Position = UDim2.new(0, 0, 0.0571428575, 0)
                Title_10.Size = UDim2.new(0, 135, 0, 33)
                Title_10.Font = Enum.Font.GothamBold
                Title_10.Text = Cac.Name
                Title_10.TextColor3 = Color3.fromRGB(200, 200, 200)
                Title_10.TextSize = 12.000
                Title_10.TextXAlignment = Enum.TextXAlignment.Left

                UIPadding_22.Parent = Title_10
                UIPadding_22.PaddingLeft = UDim.new(0, 4)

                Checker.Name = "Checker"
                Checker.Parent = Toggle
                Checker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Checker.BackgroundTransparency = 1.000
                Checker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Checker.BorderSizePixel = 0
                Checker.Position = UDim2.new(0.65482235, 0, 0.22857143, 0)
                Checker.Size = UDim2.new(0, 53, 0, 19)

                UICorner_24.CornerRadius = UDim.new(1, 0)
                UICorner_24.Parent = Checker

                UIStroke_5.Color = Color3.fromRGB(70, 70, 70)
                UIStroke_5.Thickness = 2
                UIStroke_5.Parent = Checker

                Frame.Parent = Checker
                Frame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Frame.BorderSizePixel = 0
                Frame.Position = UDim2.new(0, 2, 0.0529999994, 0)
                Frame.Size = UDim2.new(0, 17, 0, 17)

                UICorner_25.CornerRadius = UDim.new(1, 0)
                UICorner_25.Parent = Frame

                Click2.MouseButton1Click:Connect(function()
                    if Shit == false then
                        TweenService:Create(Title_10, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                        TweenService:Create(Frame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                        TweenService:Create(Frame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 32, 0, 1)}):Play()
                        TweenService:Create(Checker, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                        TweenService:Create(Checker, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                        TweenService:Create(UIStroke_5, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(0, 102, 255)}):Play()
                    else
                        TweenService:Create(Title_10, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(222, 222, 222)}):Play()
                        TweenService:Create(Frame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
                        TweenService:Create(Frame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 2, 0, 1)}):Play()
                        TweenService:Create(Checker, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000}):Play()
                        TweenService:Create(Checker, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
                        TweenService:Create(UIStroke_5, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(70, 70, 70)}):Play()
                    end
                    Shit = not Shit
                    pcall(Cac.CallBack, Shit)
                end)
    
                if Cac.Default == true then
                    TweenService:Create(Title_10, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                    TweenService:Create(Frame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                    TweenService:Create(Frame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 32, 0, 1)}):Play()
                    TweenService:Create(Checker, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                    TweenService:Create(Checker, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                    TweenService:Create(UIStroke_5, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(0, 102, 255)}):Play()
                    Shit = Cac.Default
                    pcall(Cac.CallBack, Shit)
                end
    
                function Tggle:Set(Value)
                    if Value then
                        TweenService:Create(Title_10, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                        TweenService:Create(Frame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                        TweenService:Create(Frame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 32, 0, 1)}):Play()
                        TweenService:Create(Checker, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                        TweenService:Create(Checker, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 102, 255)}):Play()
                        TweenService:Create(UIStroke_5, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(0, 102, 255)}):Play()
                    else
                        TweenService:Create(Title_10, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(222, 222, 222)}):Play()
                        TweenService:Create(Frame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
                        TweenService:Create(Frame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 2, 0, 1)}):Play()
                        TweenService:Create(Checker, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000}):Play()
                        TweenService:Create(Checker, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
                        TweenService:Create(UIStroke_5, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(70, 70, 70)}):Play()
                    end       
                    Shit = not Shit
                    pcall(Cac.CallBack, Shit)
                end
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
            local UICorner_15 = Instance.new("UICorner")
            local Features_4 = Instance.new("Frame")
            local Title_5 = Instance.new("TextLabel")
            local UIPadding_12 = Instance.new("UIPadding")
            local Desc_4 = Instance.new("TextLabel")
            local UIPadding_13 = Instance.new("UIPadding")
            local Logo_4 = Instance.new("ImageLabel")
            local Value = Instance.new("Frame")
            local UICorner_16 = Instance.new("UICorner")
            local UIStroke_4 = Instance.new("UIStroke")
            local Value_2 = Instance.new("TextLabel")
            local UIPadding_14 = Instance.new("UIPadding")
            local DropdClick = Instance.new("TextButton")
            local DropdownList = Instance.new("Frame")
            local UIPadding_15 = Instance.new("UIPadding")
            local List = Instance.new("ScrollingFrame")
            local UIPadding_16 = Instance.new("UIPadding")
            local UIListLayout_3 = Instance.new("UIListLayout")
            local DropFunc = {}
            Dropped = false

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = Channel
            Dropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Dropdown.BorderSizePixel = 0
            Dropdown.Position = UDim2.new(0, 0, 0.568513095, 0)
            Dropdown.Size = UDim2.new(1, 0, 0.0469872393, 63)

            UICorner_15.CornerRadius = UDim.new(0, 2)
            UICorner_15.Parent = Dropdown

            Features_4.Name = "Features"
            Features_4.Parent = Dropdown
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
            Title_5.TextColor3 = Color3.fromRGB(200, 200, 200)
            Title_5.TextSize = 13.000
            Title_5.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_12.Parent = Title_5
            UIPadding_12.PaddingLeft = UDim.new(0, 4)

            Desc_4.Name = "Desc"
            Desc_4.Parent = Features_4
            Desc_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Desc_4.BackgroundTransparency = 1.000
            Desc_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Desc_4.BorderSizePixel = 0
            Desc_4.Position = UDim2.new(0, 0, 0, 18)
            Desc_4.Size = UDim2.new(1, 0, 0.0727272704, 32)
            Desc_4.Font = Enum.Font.GothamBold
            Desc_4.Text = Configs.Description
            Desc_4.TextColor3 = Color3.fromRGB(100, 100, 100)
            Desc_4.TextSize = 13.000
            Desc_4.TextXAlignment = Enum.TextXAlignment.Left
            Desc_4.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_13.Parent = Desc_4
            UIPadding_13.PaddingLeft = UDim.new(0, 4)

            Logo_4.Name = "Logo"
            Logo_4.Parent = Features_4
            Logo_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Logo_4.BackgroundTransparency = 1.000
            Logo_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Logo_4.BorderSizePixel = 0
            Logo_4.Position = UDim2.new(1, -32, 0, 15)
            Logo_4.Rotation = -90.000
            Logo_4.Size = UDim2.new(0, 25, 0, 25)
            Logo_4.Image = "http://www.roblox.com/asset/?id=18225365487"
            Logo_4.ImageColor3 = Color3.fromRGB(100, 100, 100)

            Value.Name = "Value"
            Value.Parent = Features_4
            Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Value.BackgroundTransparency = 1.000
            Value.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Value.BorderSizePixel = 0
            Value.Position = UDim2.new(0.0170731712, 0, 0.562456429, 0)
            Value.Size = UDim2.new(0, 395, 0, 22)

            UICorner_16.CornerRadius = UDim.new(0, 2)
            UICorner_16.Parent = Value

            UIStroke_4.Color = Color3.fromRGB(70, 70, 70)
            UIStroke_4.Thickness = 2
            UIStroke_4.Parent = Value

            Value_2.Name = "Value"
            Value_2.Parent = Value
            Value_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Value_2.BackgroundTransparency = 1.000
            Value_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Value_2.BorderSizePixel = 0
            Value_2.Size = UDim2.new(1, 0, 1, 0)
            Value_2.Font = Enum.Font.GothamBold
            Value_2.Text = Configs.Default
            Value_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            Value_2.TextSize = 14.000
            Value_2.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_14.Parent = Value_2
            UIPadding_14.PaddingLeft = UDim.new(0, 4)

            DropdClick.Name = "DropdClick"
            DropdClick.Parent = Features_4
            DropdClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdClick.BackgroundTransparency = 1.000
            DropdClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
            DropdClick.BorderSizePixel = 0
            DropdClick.Size = UDim2.new(1, 0, 1, 0)
            DropdClick.Font = Enum.Font.SourceSans
            DropdClick.Text = ""
            DropdClick.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropdClick.TextSize = 14.000

            DropdownList.Name = "Dropdown List"
            DropdownList.Parent = Channel
            DropdownList.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            DropdownList.BorderColor3 = Color3.fromRGB(0, 0, 0)
            DropdownList.BorderSizePixel = 0
            DropdownList.Position = UDim2.new(0.0365853645, 0, 0.131195337, 0)
            DropdownList.Size = UDim2.new(1, 0, 0, 131)
            DropdownList.Visible = false

            UIPadding_15.Parent = DropdownList
            UIPadding_15.PaddingBottom = UDim.new(0, 5)
            UIPadding_15.PaddingLeft = UDim.new(0, 5)
            UIPadding_15.PaddingRight = UDim.new(0, 5)
            UIPadding_15.PaddingTop = UDim.new(0, 5)

            List.Name = "List"
            List.Parent = DropdownList
            List.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            List.BorderColor3 = Color3.fromRGB(0, 0, 0)
            List.BorderSizePixel = 0
            List.Selectable = false
            List.Size = UDim2.new(1, 0, 1, 0)
            List.ScrollBarThickness = 1

            UIPadding_16.Parent = List
            UIPadding_16.PaddingBottom = UDim.new(0, 2)
            UIPadding_16.PaddingLeft = UDim.new(0, 2)
            UIPadding_16.PaddingRight = UDim.new(0, 2)
            UIPadding_16.PaddingTop = UDim.new(0, 7)

            UIListLayout_3.Parent = List
            UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_3.Padding = UDim.new(0, 7)

            spawn(function()
                while wait() do
                    List.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_3.AbsoluteContentSize.Y)
                end
            end)

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
                Option.Size = UDim2.new(1, 0, 0, 18)
                Option.Font = Enum.Font.GothamBold
                Option.Text = tostring(v)
                Option.TextColor3 = Color3.fromRGB(144, 144, 144)
                Option.TextSize = 14.000

                Option.MouseButton1Click:Connect(function()
                    Dropped = false
                    DropdownList.Visible = false
                    TweenService:Create(Logo_4, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = -90.000}):Play()
                    Option.TextColor3 = Color3.fromRGB(144, 144, 144)
                    Option.TextColor3 = Color3.fromRGB(255, 255, 255)
                    pcall(Option.Text)
                    Configs.CallBack(Option.Text)
                    Value_2.Text = Option.Text
                end)
            end

            DropdClick.MouseButton1Click:Connect(function()
                if Dropped == false then
                    Dropped = true
                    TweenService:Create(Logo_4, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0}):Play()
                    DropdownList.Visible = true
                else
                    Dropped = false
                    TweenService:Create(Logo_4, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = -90.000}):Play()
                    DropdownList.Visible = false
                end
            end)

            function DropFunc:Set(OptionName)
                for i, v in pairs(List:GetChildren()) do
                    if v.ClassName == "Button" then
                        if v.Name == OptionName then
                            v.TextColor3 = Color3.fromRGB(255, 255, 255)
                            Value_2.Text = OptionName
                            pcall(Value_2.Text)
                        end
                    end
                end
            end

            function DropFunc:Add(Option)
                for i, v in next, Option do
                    local Nahvaicaicut = Instance.new("TextButton")

                    Nahvaicaicut.Name = "Nahvaicaicut"
                    Nahvaicaicut.Parent = List
                    Nahvaicaicut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Nahvaicaicut.BackgroundTransparency = 1.000
                    Nahvaicaicut.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Nahvaicaicut.BorderSizePixel = 0
                    Nahvaicaicut.Size = UDim2.new(1, 0, 0, 18)
                    Nahvaicaicut.Font = Enum.Font.GothamBold
                    Nahvaicaicut.Text = tostring(v)
                    Nahvaicaicut.TextColor3 = Color3.fromRGB(144, 144, 144)
                    Nahvaicaicut.TextSize = 14.000

                    Nahvaicaicut.MouseButton1Click:Connect(function()
                        Dropped = false
                        DropdownList.Visible = false
                        TweenService:Create(
                            DropdownList,
                            TweenInfo.new(0 ,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                            {
                                Visible = false
                            }
                        ):Play()
                        TweenService:Create(Logo_4, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = -90.000}):Play()
                        Nahvaicaicut.TextColor3 = Color3.fromRGB(144, 144, 144)
                        Nahvaicaicut.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Configs.CallBack(Nahvaicaicut.Text)
                        Value_2.Text = Nahvaicaicut.Text
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
                TweenService:Create(
                    DropdownList,
                    TweenInfo.new(0 ,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {
                        Visible = false
                    }
                ):Play()
                DropFunc:Add(Option)
                Value_2.Text = ""
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
            local UICorner_17 = Instance.new("UICorner")
            local Title_6 = Instance.new("TextLabel")
            local UIPadding_17 = Instance.new("UIPadding")
            local SliderFrame = Instance.new("Frame")
            local UICorner_18 = Instance.new("UICorner")
            local Draggable = Instance.new("Frame")
            local UICorner_19 = Instance.new("UICorner")
            local Value_3 = Instance.new("TextLabel")
            local SliderFunc = {Value = Configs.Default}

            Slider.Name = "Slider"
            Slider.Parent = Channel
            Slider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Slider.BorderSizePixel = 0
            Slider.Size = UDim2.new(1, 0, 0, 55)

            UICorner_17.CornerRadius = UDim.new(0, 2)
            UICorner_17.Parent = Slider

            Title_6.Name = "Title"
            Title_6.Parent = Slider
            Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_6.BackgroundTransparency = 1.000
            Title_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_6.BorderSizePixel = 0
            Title_6.Size = UDim2.new(1, 0, 0, 18)
            Title_6.Font = Enum.Font.GothamBold
            Title_6.Text = Configs.Name
            Title_6.TextColor3 = Color3.fromRGB(200, 200, 200)
            Title_6.TextSize = 13.000
            Title_6.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_17.Parent = Title_6
            UIPadding_17.PaddingLeft = UDim.new(0, 4)

            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = Slider
            SliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Position = UDim2.new(0.0170000009, 0, 0, 22)
            SliderFrame.Size = UDim2.new(0, 396, 0, 25)

            UICorner_18.CornerRadius = UDim.new(0, 2)
            UICorner_18.Parent = SliderFrame

            Draggable.Name = "Draggable"
            Draggable.Parent = SliderFrame
            Draggable.BackgroundColor3 = Color3.fromRGB(7, 127, 255)
            Draggable.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Draggable.BorderSizePixel = 0
            Draggable.Size = UDim2.new(0, 198, 0, 25)

            UICorner_19.CornerRadius = UDim.new(0, 2)
            UICorner_19.Parent = Draggable

            Value_3.Name = "Value"
            Value_3.Parent = Slider
            Value_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Value_3.BackgroundTransparency = 1.000
            Value_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Value_3.BorderSizePixel = 0
            Value_3.Position = UDim2.new(0.780487776, 50, 0, 0)
            Value_3.Size = UDim2.new(0, 40, 0, 18)
            Value_3.Font = Enum.Font.GothamBold
            Value_3.Text = Configs.Default
            Value_3.TextColor3 = Color3.fromRGB(255, 255, 255)
            Value_3.TextSize = 13.000

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
				Value_3.Text = tostring(Value)
				TweenService:Create(
					Draggable,
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Size = UDim2.fromScale((Value - Configs.Min) / (Configs.Max - Configs.Min), 1)}
				):Play()
			end
			Draggable.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = true 
				end 
			end)
			Draggable.InputEnded:Connect(function(Input) 
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = false 
					Configs.CallBack(SliderFunc.Value)
				end 
			end)
			uis.InputChanged:Connect(function(Input)
				if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then 
					local SizeScale = math.clamp((Input.Position.X - Draggable.AbsolutePosition.X) / Draggable.AbsoluteSize.X, 0, 1)
					SliderFunc:Set(Configs.Min + ((Configs.Max - Configs.Min) * SizeScale)) 
				end
			end)
			Value_3:GetPropertyChangedSignal("Text"):Connect(function()
				local Valid = Value_3.Text:gsub("[^%d]", "")
				if Valid ~= "" then
					local ValidNumber = math.min(tonumber(Valid), Configs.Max)
					Value_3.Text = tostring(ValidNumber)
				else
					Value_3.Text = tostring(Valid)
				end
			end)
			SliderFunc:Set(tonumber(Configs.Default))
			return SliderFunc       
        end
        function InTab:CreateLabel(Configs)
            Configs = Configs or {}
            Configs.Text = Configs.Text or "Label"

            local Label = Instance.new("Frame")
            local Title_8 = Instance.new("TextLabel")
            local UIPadding_19 = Instance.new("UIPadding")
            local UICorner_22 = Instance.new("UICorner")
            local LabelFunc = {}

            Label.Name = "Label"
            Label.Parent = Channel
            Label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Label.BorderSizePixel = 0
            Label.Size = UDim2.new(1, 0, 0, 25)

            Title_8.Name = "Title"
            Title_8.Parent = Label
            Title_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_8.BackgroundTransparency = 1.000
            Title_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_8.BorderSizePixel = 0
            Title_8.Size = UDim2.new(1, 0, 1, 0)
            Title_8.Font = Enum.Font.GothamBold
            Title_8.Text = Configs.Text
            Title_8.TextColor3 = Color3.fromRGB(200, 200, 200)
            Title_8.TextSize = 13.000
            Title_8.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_19.Parent = Title_8
            UIPadding_19.PaddingLeft = UDim.new(0, 4)

            UICorner_22.CornerRadius = UDim.new(0, 2)
            UICorner_22.Parent = Label

            function LabelFunc:Set(Text)
                Title_8.Text = Text
            end
            return LabelFunc
        end
        function InTab:CreateParagraph(Configs)
            Configs = Configs or {}
            Configs.Title = Configs.Title or "Paragraph"
            Configs.Content = Configs.Content or ""

            local Paragraph = Instance.new("Frame")
            local UICorner_23 = Instance.new("UICorner")
            local Features_6 = Instance.new("Frame")
            local Title_9 = Instance.new("TextLabel")
            local UIPadding_20 = Instance.new("UIPadding")
            local Desc_5 = Instance.new("TextLabel")
            local UIPadding_21 = Instance.new("UIPadding")

            Paragraph.Name = "Paragraph"
            Paragraph.Parent = Channel
            Paragraph.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Paragraph.BorderSizePixel = 0
            Paragraph.Size = UDim2.new(1, 0, 0, 55)

            UICorner_23.CornerRadius = UDim.new(0, 2)
            UICorner_23.Parent = Paragraph

            Features_6.Name = "Features"
            Features_6.Parent = Paragraph
            Features_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Features_6.BackgroundTransparency = 1.000
            Features_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Features_6.BorderSizePixel = 0
            Features_6.Size = UDim2.new(1, 0, 1, 0)

            Title_9.Name = "Title"
            Title_9.Parent = Features_6
            Title_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_9.BackgroundTransparency = 1.000
            Title_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_9.BorderSizePixel = 0
            Title_9.Size = UDim2.new(1, 0, 0, 18)
            Title_9.Font = Enum.Font.GothamBold
            Title_9.Text = Configs.Title
            Title_9.TextColor3 = Color3.fromRGB(200, 200, 200)
            Title_9.TextSize = 13.000
            Title_9.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_20.Parent = Title_9
            UIPadding_20.PaddingLeft = UDim.new(0, 4)

            Desc_5.Name = "Desc"
            Desc_5.Parent = Features_6
            Desc_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Desc_5.BackgroundTransparency = 1.000
            Desc_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Desc_5.BorderSizePixel = 0
            Desc_5.Position = UDim2.new(0, 0, 0, 18)
            Desc_5.Size = UDim2.new(1, 0, -0.0181818176, 38)
            Desc_5.Font = Enum.Font.GothamBold
            Desc_5.Text = Configs.Content
            Desc_5.TextColor3 = Color3.fromRGB(100, 100, 100)
            Desc_5.TextSize = 13.000
            Desc_5.TextXAlignment = Enum.TextXAlignment.Left
            Desc_5.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding_21.Parent = Desc_5
            UIPadding_21.PaddingLeft = UDim.new(0, 4)
            
        end
        function InTab:CreateTextBox(Configs)
            Configs = Configs or {}
            Configs.Name = Configs.Name or ""
            Configs.Default = Configs.Default or ""
            Configs.CallBack = Configs.CallBack or function () end

            local Textbox = Instance.new("Frame")
            local UICorner_20 = Instance.new("UICorner")
            local Features_5 = Instance.new("Frame")
            local Title_7 = Instance.new("TextLabel")
            local UIPadding_18 = Instance.new("UIPadding")
            local PutText = Instance.new("Frame")
            local UICorner_21 = Instance.new("UICorner")
            local Put = Instance.new("TextBox")
            local UIStroke_5 = Instance.new("UIStroke")
            local InputFunc = {}

            Textbox.Name = "Textbox"
            Textbox.Parent = Channel
            Textbox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Textbox.BorderSizePixel = 0
            Textbox.Size = UDim2.new(1, 0, 0, 55)

            UICorner_20.CornerRadius = UDim.new(0, 2)
            UICorner_20.Parent = Textbox

            Features_5.Name = "Features"
            Features_5.Parent = Textbox
            Features_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Features_5.BackgroundTransparency = 1.000
            Features_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Features_5.BorderSizePixel = 0
            Features_5.Size = UDim2.new(1, 0, 1, 0)

            Title_7.Name = "Title"
            Title_7.Parent = Features_5
            Title_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_7.BackgroundTransparency = 1.000
            Title_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_7.BorderSizePixel = 0
            Title_7.Size = UDim2.new(1, 0, 0, 18)
            Title_7.Font = Enum.Font.GothamBold
            Title_7.Text = Configs.Name
            Title_7.TextColor3 = Color3.fromRGB(200, 200, 200)
            Title_7.TextSize = 13.000
            Title_7.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_18.Parent = Title_7
            UIPadding_18.PaddingLeft = UDim.new(0, 4)

            PutText.Name = "PutText"
            PutText.Parent = Features_5
            PutText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PutText.BackgroundTransparency = 1.000
            PutText.BorderColor3 = Color3.fromRGB(0, 0, 0)
            PutText.BorderSizePixel = 0
            PutText.Position = UDim2.new(0.0169999283, 0, 0.4909091, 0)
            PutText.Size = UDim2.new(0.965926886, 0, 0.400000006, 0)

            UICorner_21.CornerRadius = UDim.new(0, 2)
            UICorner_21.Parent = PutText

            Put.Name = "Put"
            Put.Parent = PutText
            Put.Active = false
            Put.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Put.BackgroundTransparency = 1.000
            Put.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Put.BorderSizePixel = 0
            Put.ClipsDescendants = true
            Put.Selectable = false
            Put.Size = UDim2.new(1, 0, 1, 0)
            Put.Font = Enum.Font.GothamBold
            Put.Text = Configs.Default
            Put.TextSize = 14
            Put.TextColor3 = Color3.fromRGB(200, 200, 200)

            UIStroke_5.Color = Color3.fromRGB(70, 70, 70)
            UIStroke_5.Thickness = 2
            UIStroke_5.Parent = PutText

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
        return InTab
    end
    return TabCre
end
 
local Windows = SitinksLib:CreateWindow({Title = "Sitinks Hub"})

local F = Windows:CreateTab({Name = "Farm"})

local S = Windows:CreateTab({Name = "Stack Farm"})

F:CreateSection({Text = "Fuck u"})

F:CreateSectionContent({
    Text = "Show Me Your Dick"
})

Countbeo = 0
F:CreateButton({
    Name = "Click de beo then",
    Description = 'memaybeo',
    CallBack = function()
        print("Adu may beo vay")
    end
})

local ToggleStartFarm = F:CreateToggle({
    Name = "Start Farm",
    Description = "Not",
    Default = true,
    Settings = true,
    CallBack = function(Value)
        print(Value)
    end
})

ToggleStartFarm:CreateToggle({
    Name = "Đ",
    Default = false,
    CallBack = function(Value)
        print(Value)
    end
})

ToggleStartFarm:CreateToggle({
    Name = "ị",
    Default = false,
    CallBack = function(Value)
        print(Value)
    end
})

ToggleStartFarm:CreateToggle({
    Name = "t",
    Default = false,
    CallBack = function(Value)
        print(Value)
    end
})

local never = F:CreateDropdown({
    Name = "Lol",
    Description = "shit",
    Options = {"1", "2", "3"},
    Default = "1",
    CallBack = function(Value)
        print(Value)
    end
})

F:CreateSlider({
    Name = "WalkSpeed",
    Max = 300,
    Min = 50,
    Default = 100,
    CallBack = function(Value)
        plr.Character.Humanoid.WalkSpeed = Value
    end
})

F:CreateTextBox({
    Name = 'shit',
    Default = "",
    CallBack = function(Value)
        plr.Character.Humanoid.WalkSpeed = tonumber(Value)
    end
})

F:CreateLabel({Text = "Con cu"})
F:CreateParagraph({Title = "Con cu sieu dai", Content = "Not have"})

never:Refresh({"Shit", "Lol"})
SitinksLib:Notify({
    Title = "Notification",
    Description = "Shit",
    Time = 5
})
