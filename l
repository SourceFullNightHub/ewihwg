local plr = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local Runservice = game:GetService("RunService")
local httpservice = game:GetService("HttpService")
local mouse = plr:GetMouse()
local TweenService = game:GetService("TweenService")
local NightLib = {}

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
function NightLib:CreateWindow(Options)
    Options = Options or {}
    Options.Title = Options.Title or "Night Hub"
    Options.Creator = Options.Creator or "- By ! Nightx"

    local ScreenGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local DropShadowHolder = Instance.new("Frame")
    local DropShadow = Instance.new("ImageLabel")
    local UIStroke = Instance.new("UIStroke")
    local Top = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local NameHub = Instance.new("TextLabel")
    local Cre = Instance.new("TextLabel")
    local TabFolder = Instance.new("Frame")
    local ScrollingTab = Instance.new("ScrollingFrame")
    local UIPadding = Instance.new("UIPadding")
    local UIListLayout = Instance.new("UIListLayout")
    local ChannelContainer = Instance.new("Frame")
    local CloseOpen = Instance.new("ImageButton")
    local UICorner_12 = Instance.new("UICorner")
    local shadowHolder = Instance.new("Frame")
    local umbraShadow = Instance.new("ImageLabel")
    local penumbraShadow = Instance.new("ImageLabel")
    local ambientShadow = Instance.new("ImageLabel")
    local Nah = true

    ScreenGui.Parent = game.CoreGui

    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.429149806, 0, 0.127530366, 0)
    Main.Size = UDim2.new(0, 548, 0, 386)

    CloseOpen.Name = "CloseOpen"
    CloseOpen.Parent = ScreenGui
    CloseOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseOpen.BackgroundTransparency = 1.000
    CloseOpen.BorderColor3 = Color3.fromRGB(0, 0, 0)
    CloseOpen.BorderSizePixel = 0
    CloseOpen.Position = UDim2.new(0.00696864119, 0, 0.457489878, 0)
    CloseOpen.Size = UDim2.new(0, 35, 0, 35)
    CloseOpen.Image = "rbxassetid://15541504459"
    CloseOpen.MouseButton1Click:Connect(function()
        Nah = not Nah
        Main.Visible = Nah
    end)

    UICorner_12.Parent = CloseOpen

    shadowHolder.Name = "shadowHolder"
    shadowHolder.Parent = CloseOpen
    shadowHolder.BackgroundTransparency = 1.000
    shadowHolder.Position = UDim2.new(0, 0, -0.146449491, 0)
    shadowHolder.Size = UDim2.new(1, 0, 1.02447248, 0)
    shadowHolder.ZIndex = 0

    umbraShadow.Name = "umbraShadow"
    umbraShadow.Parent = shadowHolder
    umbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    umbraShadow.BackgroundTransparency = 1.000
    umbraShadow.Position = UDim2.new(0.5, 0, 0.504095137, 6)
    umbraShadow.Size = UDim2.new(1, 10, 1.00682509, 10)
    umbraShadow.ZIndex = 0
    umbraShadow.Image = "rbxassetid://1316045217"
    umbraShadow.ImageTransparency = 0.860
    umbraShadow.ScaleType = Enum.ScaleType.Slice
    umbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

    penumbraShadow.Name = "penumbraShadow"
    penumbraShadow.Parent = shadowHolder
    penumbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    penumbraShadow.BackgroundTransparency = 1.000
    penumbraShadow.Position = UDim2.new(0.5, 0, 0.504095137, 6)
    penumbraShadow.Size = UDim2.new(1, 10, 1.00682509, 10)
    penumbraShadow.ZIndex = 0
    penumbraShadow.Image = "rbxassetid://1316045217"
    penumbraShadow.ImageTransparency = 0.880
    penumbraShadow.ScaleType = Enum.ScaleType.Slice
    penumbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

    ambientShadow.Name = "ambientShadow"
    ambientShadow.Parent = shadowHolder
    ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    ambientShadow.BackgroundTransparency = 1.000
    ambientShadow.Position = UDim2.new(0.5, 0, 0.504095137, 6)
    ambientShadow.Size = UDim2.new(1, 10, 1.00682509, 10)
    ambientShadow.ZIndex = 0
    ambientShadow.Image = "rbxassetid://1316045217"
    ambientShadow.ImageTransparency = 0.880
    ambientShadow.ScaleType = Enum.ScaleType.Slice
    ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)

    UICorner.CornerRadius = UDim.new(0, 3)
    UICorner.Parent = Main

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
    DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    DropShadow.Size = UDim2.new(1, 47, 1, 47)
    DropShadow.ZIndex = 0
    DropShadow.Image = "rbxassetid://6015897843"
    DropShadow.ImageTransparency = 0.500
    DropShadow.ScaleType = Enum.ScaleType.Slice
    DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

    UIStroke.Color = Color3.fromRGB(200, 200, 200)
    UIStroke.Parent = Main

    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Top.BorderSizePixel = 0
    Top.Size = UDim2.new(1, 0, -0.00777202053, 40)

    UICorner_2.CornerRadius = UDim.new(0, 3)
    UICorner_2.Parent = Top

    NameHub.Name = "NameHub"
    NameHub.Parent = Top
    NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.BackgroundTransparency = 1.000
    NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NameHub.BorderSizePixel = 0
    NameHub.Size = UDim2.new(1, 0, 1, 0)
    NameHub.Font = Enum.Font.GothamBold
    NameHub.Text = "   " .. Options.Title
    NameHub.TextColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.TextSize = 15.000
    NameHub.TextWrapped = true
    NameHub.TextXAlignment = Enum.TextXAlignment.Left

    Cre.Name = "Cre"
    Cre.Parent = NameHub
    Cre.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Cre.BackgroundTransparency = 1.000
    Cre.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Cre.BorderSizePixel = 0
    Cre.Position = UDim2.new(0.169708148, 0, 0, 0)
    Cre.Size = UDim2.new(0, 200, 0, 37)
    Cre.Font = Enum.Font.GothamBold
    Cre.Text = "By " .. Options.Creator
    Cre.TextColor3 = Color3.fromRGB(100, 100, 100)
    Cre.TextSize = 12.000
    Cre.TextXAlignment = Enum.TextXAlignment.Left

    TabFolder.Name = "TabFolder"
    TabFolder.Parent = Main
    TabFolder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TabFolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabFolder.BorderSizePixel = 0
    TabFolder.Position = UDim2.new(0, 0, 0.0984455943, 0)
    TabFolder.Size = UDim2.new(0, 136, 0, 348)

    ScrollingTab.Name = "Scrolling Tab"
    ScrollingTab.Parent = TabFolder
    ScrollingTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollingTab.BackgroundTransparency = 1.000
    ScrollingTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ScrollingTab.BorderSizePixel = 0
    ScrollingTab.Selectable = false
    ScrollingTab.Size = UDim2.new(1, 0, 1, 0)
    ScrollingTab.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollingTab.ScrollBarThickness = 1

    UIPadding.Parent = ScrollingTab
    UIPadding.PaddingBottom = UDim.new(0, 6)
    UIPadding.PaddingLeft = UDim.new(0, 6)
    UIPadding.PaddingTop = UDim.new(0, 6)

    UIListLayout.Parent = ScrollingTab
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 2)

    ChannelContainer.Name = "Channel Container"
    ChannelContainer.Parent = Main
    ChannelContainer.AnchorPoint = Vector2.new(1, 0)
    ChannelContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    ChannelContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ChannelContainer.BorderSizePixel = 0
    ChannelContainer.ClipsDescendants = true
    ChannelContainer.Position = UDim2.new(1, 0, 0.0958548859, 0)
    ChannelContainer.Size = UDim2.new(0, 412, 0, 348)

    MakeDraggable(Top, Main)

    function NightLib:MakeNotify(Options)
        Options = Options or {}
        Options.Name = Options.Name or 'Night Hub'
        Options.Content = Options.Content or "Is This Notify"
        Options.Icon = Options.Icon or "rbxassetid://17317584331"
        Options.Time = Options.Time or 5

        local Notify = Instance.new("Frame")
        local UICorner_11 = Instance.new("UICorner")
        local DropShadowHolder_2 = Instance.new("Frame")
        local DropShadow_2 = Instance.new("ImageLabel")
        local Title_6 = Instance.new("TextLabel")
        local Iconnotify = Instance.new("ImageLabel")
        local TextLabel = Instance.new("TextLabel")
        local PaddingN = Instance.new("UIPadding")
        local PaddingN2 = Instance.new("UIPadding")

        Notify.Name = "Notify"
        Notify.Parent = ScreenGui
        Notify.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Notify.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Notify.BorderSizePixel = 0
        Notify.Position = UDim2.new(11.769000947, 0, 0.825910926, 0)
        Notify.Size = UDim2.new(0, 310, 0, 55)

        UICorner_11.CornerRadius = UDim.new(0, 3)
        UICorner_11.Parent = Notify

        DropShadowHolder_2.Name = "DropShadowHolder"
        DropShadowHolder_2.Parent = Notify
        DropShadowHolder_2.BackgroundTransparency = 1.000
        DropShadowHolder_2.BorderSizePixel = 0
        DropShadowHolder_2.Size = UDim2.new(1, 0, 1, 0)
        DropShadowHolder_2.ZIndex = 0

        DropShadow_2.Name = "DropShadow"
        DropShadow_2.Parent = DropShadowHolder_2
        DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
        DropShadow_2.BackgroundTransparency = 1.000
        DropShadow_2.BorderSizePixel = 0
        DropShadow_2.Position = UDim2.new(0.5, 0, 0.5, 0)
        DropShadow_2.Size = UDim2.new(1, 47, 1, 47)
        DropShadow_2.ZIndex = 0
        DropShadow_2.Image = "rbxassetid://6015897843"
        DropShadow_2.ImageTransparency = 0.500
        DropShadow_2.ScaleType = Enum.ScaleType.Slice
        DropShadow_2.SliceCenter = Rect.new(49, 49, 450, 450)

        Title_6.Name = "Title"
        Title_6.Parent = Notify
        Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title_6.BackgroundTransparency = 1.000
        Title_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Title_6.BorderSizePixel = 0
        Title_6.ClipsDescendants = true
        Title_6.Position = UDim2.new(0, 0, 0, 6)
        Title_6.Size = UDim2.new(1, 0, 0, 16)
        Title_6.Font = Enum.Font.GothamBold
        Title_6.Text = Options.Name
        Title_6.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title_6.TextSize = 15.000
        Title_6.TextWrapped = true
        Title_6.TextXAlignment = Enum.TextXAlignment.Left

        PaddingN.Parent = Title_6
        PaddingN.PaddingLeft = UDim.new(0, 29)
        PaddingN.PaddingBottom = UDim.new(0, 3)

        Iconnotify.Name = "Iconnotify"
        Iconnotify.Parent = Notify
        Iconnotify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Iconnotify.BackgroundTransparency = 1.000
        Iconnotify.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Iconnotify.BorderSizePixel = 0
        Iconnotify.Position = UDim2.new(0, 3, 0, 3)
        Iconnotify.Size = UDim2.new(0, 20, 0, 20)
        Iconnotify.Image = Options.Icon

        TextLabel.Parent = Notify
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.new(0, 0, 0, 28)
        TextLabel.Size = UDim2.new(1, 0, 0, 26)
        TextLabel.Font = Enum.Font.GothamBold
        TextLabel.Text = Options.Content
        TextLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        TextLabel.TextSize = 14.000
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left

        PaddingN2.Parent = TextLabel
        PaddingN2.PaddingLeft = UDim.new(0, 6)

        TweenService:Create(Notify, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
            { Position = UDim2.new(0.650, 0, 0.797, 0) }):Play()

        wait(Options.Time - 0.88)
        TweenService:Create(Iconnotify, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 }):Play()
        TweenService:Create(Notify, TweenInfo.new(0.8, Enum.EasingStyle.Quint), { BackgroundTransparency = 0.6 }):Play()
        wait(0.3)
        TweenService:Create(Title_6, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 0.4 }):Play()
        TweenService:Create(TextLabel, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 0.5 }):Play()
        wait(0.05)

        Notify:TweenPosition(UDim2.new(20, 0, 0, 0), 'In', 'Quint', 0.8, true)
        wait(1.35)
        Notify:Destroy()
    end

    local Tab = {}
    function Tab:MakeTab(Options)
        Options = Options or {}
        Options.Name = Options.Name or "Tab 1"
        Options.Icon = Options.Icon or "rbxassetid://17184558565"

        local Tab1 = Instance.new("TextButton")
        local UICorner_4 = Instance.new("UICorner")
        local IcoTab_2 = Instance.new("ImageLabel")
        local TabEnable = Instance.new("ScrollingFrame")
        local UIListLayout_2 = Instance.new("UIListLayout")
        local UIPadding_2 = Instance.new("UIPadding")
        local ChannelName = ""
        defaut = false

        Tab1.Name = "Tab1"
        Tab1.Parent = ScrollingTab
        Tab1.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Tab1.BackgroundTransparency = 1.000
        Tab1.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tab1.BorderSizePixel = 0
        Tab1.ClipsDescendants = true
        Tab1.Size = UDim2.new(1, 0, 0, 30)
        Tab1.Font = Enum.Font.GothamBold
        Tab1.Text = "         " .. Options.Name
        Tab1.TextColor3 = Color3.fromRGB(222, 222, 222)
        Tab1.TextSize = 15.000
        Tab1.TextXAlignment = Enum.TextXAlignment.Left

        UICorner_4.CornerRadius = UDim.new(0, 3)
        UICorner_4.Parent = Tab1

        IcoTab_2.Name = "IcoTab"
        IcoTab_2.Parent = Tab1
        IcoTab_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        IcoTab_2.BackgroundTransparency = 1.000
        IcoTab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
        IcoTab_2.BorderSizePixel = 0
        IcoTab_2.ClipsDescendants = true
        IcoTab_2.Position = UDim2.new(0.0610000007, 0, 0.100000001, 0)
        IcoTab_2.Size = UDim2.new(0, 22, 0, 22)
        IcoTab_2.Image = Options.Icon
        IcoTab_2.ImageColor3 = Color3.fromRGB(222, 222, 222)

        TabEnable.Name = "Tab Enable"
        TabEnable.Parent = ChannelContainer
        TabEnable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabEnable.BackgroundTransparency = 1.000
        TabEnable.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TabEnable.BorderSizePixel = 0
        TabEnable.Selectable = false
        TabEnable.Size = UDim2.new(0, 412, 0, 348)
        TabEnable.ScrollBarThickness = 0
        TabEnable.CanvasSize = UDim2.new(0, 0, 2, 0)
        TabEnable.Visible = false
        spawn(function()
            while wait() do
                TabEnable.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_2.AbsoluteContentSize.Y + 70)
            end
        end)

        UIListLayout_2.Parent = TabEnable
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 6)

        UIPadding_2.Parent = TabEnable
        UIPadding_2.PaddingBottom = UDim.new(0, 7)
        UIPadding_2.PaddingLeft = UDim.new(0, 7)
        UIPadding_2.PaddingRight = UDim.new(0, 7)
        UIPadding_2.PaddingTop = UDim.new(0, 7)

        Tab1.MouseEnter:Connect(function()
            if ChannelName ~= Tab1.Name then
                Tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
                IcoTab_2.ImageColor3 = Color3.fromRGB(255, 255, 255)
            end
        end)

        Tab1.MouseLeave:Connect(function()
            if ChannelName ~= Tab1.Name then
                Tab1.TextColor3 = Color3.fromRGB(114, 118, 125)
                IcoTab_2.ImageColor3 = Color3.fromRGB(144, 144, 144)
            end
        end)

        Tab1.MouseButton1Click:Connect(function()
            for i, v in next, ChannelContainer:GetChildren() do
                if v.Name == "Tab Enable" then
                    v.Visible = false
                end
                TabEnable.Visible = true
            end
            for i, v in next, ScrollingTab:GetChildren() do
                if v.ClassName == "TextButton" then
                    v.TextColor3 = Color3.fromRGB(144, 144, 144)
                    v.BackgroundTransparency = 1.000
                end
            end
            Tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
            Tab1.BackgroundColor3 = Color3.fromRGB(42, 251, 255)
            Tab1.BackgroundTransparency = 0.400
            ChannelName = Tab1.Name
        end)

        if default == false then
            default = true
            Tab1.TextColor3 = Color3.fromRGB(144, 144, 144)
            ChannelContainer.Visible = true
            TabEnable.Visible = false
        end

        local TabContent = {}
        function TabContent:CreateSection(Options)
            Options = Options or {}
            Options.Text = Options.Text or "Section"

            local Section = Instance.new("TextLabel")

            Section.Name = "Section"
            Section.Parent = TabEnable
            Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Section.BackgroundTransparency = 1.000
            Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Section.BorderSizePixel = 0
            Section.Position = UDim2.new(0, 0, 0.0119760484, 0)
            Section.Size = UDim2.new(1, 0, 0, 20)
            Section.Font = Enum.Font.GothamBold
            Section.Text = "  " .. Options.Text
            Section.TextColor3 = Color3.fromRGB(255, 255, 255)
            Section.TextSize = 13.000
            Section.TextWrapped = true
            Section.TextXAlignment = Enum.TextXAlignment.Left
        end

        function TabContent:CreateParagraph(Options)
            Options = Options or {}
            Options.Title = Options.Title or "Paragraph"
            Options.Content = Options.Content or "Description"

            local Paragraph = Instance.new("Frame")
            local UICorner_5 = Instance.new("UICorner")
            local Title = Instance.new("TextLabel")
            local Content = Instance.new("TextLabel")
            local Padding = Instance.new("UIPadding")
            local Paddin2g = Instance.new("UIPadding")
            local ParagraphFunction = {}

            Paragraph.Name = "Paragraph"
            Paragraph.Parent = TabEnable
            Paragraph.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Paragraph.BorderSizePixel = 0
            Paragraph.ClipsDescendants = true
            Paragraph.Position = UDim2.new(0, 0, 0.0778443143, 0)
            Paragraph.Size = UDim2.new(1, 0, -0.00898203626, 55)

            UICorner_5.CornerRadius = UDim.new(0, 3)
            UICorner_5.Parent = Paragraph

            Title.Name = "Title"
            Title.Parent = Paragraph
            Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title.BackgroundTransparency = 1.000
            Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title.BorderSizePixel = 0
            Title.ClipsDescendants = true
            Title.Position = UDim2.new(0, 0, 0, 6)
            Title.Size = UDim2.new(1, 0, 0, 16)
            Title.Font = Enum.Font.GothamBold
            Title.Text = "  " .. Options.Title
            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title.TextSize = 15.000
            Title.TextXAlignment = Enum.TextXAlignment.Left

            Padding.Parent = Title
            Padding.PaddingLeft = UDim.new(0, 6)

            Content.Name = "Content"
            Content.Parent = Paragraph
            Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Content.BackgroundTransparency = 1.000
            Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Content.BorderSizePixel = 0
            Content.ClipsDescendants = true
            Content.Position = UDim2.new(0, 0, 0, 23)
            Content.Size = UDim2.new(1, 0, 0, 26)
            Content.Font = Enum.Font.GothamBold
            Content.Text = "   " .. Options.Content
            Content.TextColor3 = Color3.fromRGB(100, 100, 100)
            Content.TextSize = 12.000
            Content.TextWrapped = true
            Content.TextXAlignment = Enum.TextXAlignment.Left

            Paddin2g.Parent = Content
            Paddin2g.PaddingLeft = UDim.new(0, 6)

            function ParagraphFunction:Set(Options)
                Options = Options or {}
                Options.Title = Options.Title or "Title"
                Options.Content = Options.Content or "Content"

                Title.Text = tostring(Options.Title)
                Content.Text = tostring(Options.Content)
            end

            ParagraphFunction:Set(Options)
            return ParagraphFunction
        end

        function TabContent:CreateButton(Options)
            Options = Options or {}
            Options.Name = Options.Name or "Button"
            Options.Description = Options.Description or ""
            Options.CallBack = Options.CallBack or function() end

            local Button = Instance.new("Frame")
            local Title_2 = Instance.new("TextLabel")
            local Content_2 = Instance.new("TextLabel")
            local IcoButton = Instance.new("ImageLabel")
            local ButtonClick = Instance.new("TextButton")
            local UIPadding_Butt = Instance.new("UIPadding")
            local UIPadding_B = Instance.new("UIPadding")

            Button.Name = "Button"
            Button.Parent = TabEnable
            Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(1, 0, 0, 55)

            Title_2.Name = "Title"
            Title_2.Parent = Button
            Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_2.BackgroundTransparency = 1.000
            Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_2.BorderSizePixel = 0
            Title_2.ClipsDescendants = true
            Title_2.Position = UDim2.new(0, 0, 0, 6)
            Title_2.Size = UDim2.new(0.899497509, 0, 0, 16)
            Title_2.Font = Enum.Font.GothamBold
            Title_2.Text = Options.Name
            Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_2.TextSize = 15.000
            Title_2.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_Butt.Parent = Title_2
            UIPadding_Butt.PaddingLeft = UDim.new(0, 6)

            Content_2.Name = "Content"
            Content_2.Parent = Button
            Content_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Content_2.BackgroundTransparency = 1.000
            Content_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Content_2.BorderSizePixel = 0
            Content_2.Position = UDim2.new(0, 0, 0, 28)
            Content_2.Size = UDim2.new(0.899497509, 0, 0, 26)
            Content_2.Font = Enum.Font.GothamBold
            Content_2.Text = Options.Description
            Content_2.TextColor3 = Color3.fromRGB(100, 100, 100)
            Content_2.TextSize = 12.000
            Content_2.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_B.Parent = Content_2
            UIPadding_B.PaddingLeft = UDim.new(0, 6)

            IcoButton.Name = "IcoButton"
            IcoButton.Parent = Button
            IcoButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            IcoButton.BackgroundTransparency = 1.000
            IcoButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
            IcoButton.BorderSizePixel = 0
            IcoButton.ClipsDescendants = true
            IcoButton.Position = UDim2.new(1, -38, 0, 12)
            IcoButton.Size = UDim2.new(0, 30, 0, 30)
            IcoButton.Image = "rbxassetid://17300168059"

            ButtonClick.Name = "ButtonClick"
            ButtonClick.Parent = Button
            ButtonClick.Active = false
            ButtonClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ButtonClick.BackgroundTransparency = 1.000
            ButtonClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ButtonClick.BorderSizePixel = 0
            ButtonClick.ClipsDescendants = true
            ButtonClick.Selectable = false
            ButtonClick.Size = UDim2.new(1, 0, 1, 0)
            ButtonClick.Font = Enum.Font.GothamBold
            ButtonClick.Text = ""
            ButtonClick.TextColor3 = Color3.fromRGB(0, 0, 0)
            ButtonClick.TextSize = 14.000

            ButtonClick.MouseButton1Click:Connect(function()
                pcall(Options.CallBack)
                Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                TweenService:Create(Button, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                }):Play()
            end)
        end

        function TabContent:CreateToggle(Options)
            Options = Options or {}
            Options.Name = Options.Name or "Toggle"
            Options.Description = Options.Description or ""
            Options.Default = Options.Default or false
            Options.CallBack = Options.CallBack or function() end

            local Toggle = Instance.new("Frame")
            local Title_3 = Instance.new("TextLabel")
            local Content_3 = Instance.new("TextLabel")
            local ToggleClick = Instance.new("TextButton")
            local CheckerFrame = Instance.new("Frame")
            local UICorner_6 = Instance.new("UICorner")
            local ImageLabel = Instance.new("ImageLabel")
            local PaddingT = Instance.new("UIPadding")
            local PaddingT2 = Instance.new("UIPadding")
            local Toggled = false
            local ToggleFunc = {}

            Toggle.Name = "Toggle"
            Toggle.Parent = TabEnable
            Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Toggle.BorderSizePixel = 0
            Toggle.Size = UDim2.new(1, 0, 0, 55)

            Title_3.Name = "Title"
            Title_3.Parent = Toggle
            Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_3.BackgroundTransparency = 1.000
            Title_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_3.BorderSizePixel = 0
            Title_3.ClipsDescendants = true
            Title_3.Position = UDim2.new(0, 0, 0, 6)
            Title_3.Size = UDim2.new(0.899497509, 0, 0, 16)
            Title_3.Font = Enum.Font.GothamBold
            Title_3.Text = Options.Name
            Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_3.TextSize = 15.000
            Title_3.TextXAlignment = Enum.TextXAlignment.Left

            PaddingT.Parent = Title_3
            PaddingT.PaddingLeft = UDim.new(0, 6)

            Content_3.Name = "Content"
            Content_3.Parent = Toggle
            Content_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Content_3.BackgroundTransparency = 1.000
            Content_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Content_3.BorderSizePixel = 0
            Content_3.Position = UDim2.new(0, 0, 0, 28)
            Content_3.Size = UDim2.new(0.899497509, 0, 0, 26)
            Content_3.Font = Enum.Font.GothamBold
            Content_3.Text = Options.Description
            Content_3.TextColor3 = Color3.fromRGB(100, 100, 100)
            Content_3.TextSize = 12.000
            Content_3.TextXAlignment = Enum.TextXAlignment.Left

            PaddingT2.Parent = Content_3
            PaddingT2.PaddingLeft = UDim.new(0, 6)

            ToggleClick.Name = "ToggleClick"
            ToggleClick.Parent = Toggle
            ToggleClick.Active = false
            ToggleClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleClick.BackgroundTransparency = 1.000
            ToggleClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ToggleClick.BorderSizePixel = 0
            ToggleClick.ClipsDescendants = true
            ToggleClick.Selectable = false
            ToggleClick.Size = UDim2.new(1, 0, 1, 0)
            ToggleClick.Font = Enum.Font.GothamBold
            ToggleClick.Text = ""
            ToggleClick.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleClick.TextSize = 14.000

            CheckerFrame.Name = "CheckerFrame"
            CheckerFrame.Parent = Toggle
            CheckerFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            CheckerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            CheckerFrame.BorderSizePixel = 0
            CheckerFrame.ClipsDescendants = true
            CheckerFrame.Position = UDim2.new(1, -38, 0, 12)
            CheckerFrame.Size = UDim2.new(0, 30, 0, 30)

            UICorner_6.Parent = CheckerFrame

            ImageLabel.Parent = CheckerFrame
            ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ImageLabel.BackgroundTransparency = 1.000
            ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ImageLabel.BorderSizePixel = 0
            ImageLabel.Size = UDim2.new(1, 0, 1, 0)
            ImageLabel.Image = "rbxassetid://17335294568"
            ImageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
            ImageLabel.Visible = Options.Default

            ToggleClick.MouseButton1Click:Connect(function()
                if Toggled == false then
                    TweenService:Create(CheckerFrame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            BackgroundColor3 = Color3.fromRGB(42, 251, 255)
                        }):Play()

                    TweenService:Create(ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 0.5
                    }):Play()

                    ImageLabel.Visible = true
                    wait(0.01)

                    TweenService:Create(ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 0
                    }):Play()
                else
                    TweenService:Create(ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 0.5
                    }):Play()

                    TweenService:Create(CheckerFrame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        }):Play()

                    ImageLabel.Visible = false
                    wait(0.01)

                    TweenService:Create(ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 0
                    }):Play()
                end
                Toggled = not Toggled
                pcall(Options.CallBack, Toggled)
            end)

            if Options.Default == true then
                TweenService:Create(CheckerFrame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = Color3.fromRGB(42, 251, 255)
                }):Play()

                TweenService:Create(ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ImageTransparency = 0.5
                }):Play()

                ImageLabel.Visible = true
                wait(0.01)

                TweenService:Create(ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ImageTransparency = 0
                }):Play()

                Toggled = Options.Default
                pcall(Options.CallBack, Toggled)
            end

            function ToggleFunc:Set(Value)
                if Value then
                    TweenService:Create(CheckerFrame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            BackgroundColor3 = Color3.fromRGB(42, 251, 255)
                        }):Play()

                    TweenService:Create(ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 0.5
                    }):Play()

                    ImageLabel.Visible = true
                    wait(0.01)

                    TweenService:Create(ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 0
                    }):Play()
                else
                    TweenService:Create(ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 0.5
                    }):Play()

                    TweenService:Create(CheckerFrame, TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        }):Play()

                    ImageLabel.Visible = false
                    wait(0.01)

                    TweenService:Create(ImageLabel, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 0
                    }):Play()
                end
                Toggled = not Toggled
                pcall(Options.CallBack, Toggled)
            end

            return ToggleFunc
        end

        function TabContent:CreateSlider(Options)
            Options = Options or {}
            Options.Name = Options.Name or "Slider"
            Options.Description = Options.Description or ""
            Options.Min = Options.Min or 1
            Options.Max = Options.Max or 100
            Options.Default = Options.Default or 50
            Options.CallBack = Options.CallBack or function() end

            local Slider = Instance.new("Frame")
            local UICorner_7 = Instance.new("UICorner")
            local Title_4 = Instance.new("TextLabel")
            local SliderFrame = Instance.new("Frame")
            local UICorner_8 = Instance.new("UICorner")
            local Draggable = Instance.new("Frame")
            local UICorner_9 = Instance.new("UICorner")
            local valueframe = Instance.new("Frame")
            local UICorner_10 = Instance.new("UICorner")
            local Value = Instance.new("TextLabel")
            local UIPadding_15 = Instance.new("UIPadding")
            local SliderNhulon = {
                Hover = false,
                MouseDown = false,
                Connection = false
            }

            Slider.Name = "Slider"
            Slider.Parent = TabEnable
            Slider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Slider.BorderSizePixel = 0
            Slider.Size = UDim2.new(1, 0, 0, 55)

            UICorner_7.CornerRadius = UDim.new(0, 3)
            UICorner_7.Parent = Slider

            Title_4.Name = "Title"
            Title_4.Parent = Slider
            Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_4.BackgroundTransparency = 1.000
            Title_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_4.BorderSizePixel = 0
            Title_4.Position = UDim2.new(0, 0, 0, 6)
            Title_4.Size = UDim2.new(1, 0, 0, 16)
            Title_4.Font = Enum.Font.GothamBold
            Title_4.Text = Options.Name
            Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_4.TextSize = 15.000
            Title_4.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_15.Parent = Title_4
            UIPadding_15.PaddingLeft = UDim.new(0, 6)

            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = Slider
            SliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Position = UDim2.new(0, 8, 0, 27)
            SliderFrame.Size = UDim2.new(0.909547746, -50, 0, 26)

            UICorner_8.CornerRadius = UDim.new(0, 3)
            UICorner_8.Parent = SliderFrame

            Draggable.Name = "Draggable"
            Draggable.Parent = SliderFrame
            Draggable.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            Draggable.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Draggable.BorderSizePixel = 0
            Draggable.Size = UDim2.new(0, 156, 1, 0)

            UICorner_9.CornerRadius = UDim.new(0, 3)
            UICorner_9.Parent = Draggable

            valueframe.Name = "valueframe"
            valueframe.Parent = SliderFrame
            valueframe.BackgroundColor3 = Color3.fromRGB(42, 251, 255)
            valueframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
            valueframe.BorderSizePixel = 0
            valueframe.Position = UDim2.new(1, 38, 0, -15)
            valueframe.Size = UDim2.new(0, 30, 0, 30)

            UICorner_10.CornerRadius = UDim.new(0, 3)
            UICorner_10.Parent = valueframe

            Value.Name = "Value"
            Value.Parent = valueframe
            Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Value.BackgroundTransparency = 1.000
            Value.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Value.BorderSizePixel = 0
            Value.Size = UDim2.new(1, 0, 1, 0)
            Value.Font = Enum.Font.GothamBold
            Value.Text = tostring(Options.Default and
            math.floor((Options.Default / Options.Max) * (Options.Max - Options.Min) + Options.Min) or 1)
            Value.TextColor3 = Color3.fromRGB(0, 0, 0)
            Value.TextSize = 12.000
            pcall(tonumber(Value.Text))

            function SliderNhulon:SetValue(v)
                if v == nil then
                    local percentage = math.clamp(
                    (mouse.X - SliderFrame.AbsolutePosition.X) / (SliderFrame.AbsoluteSize.X), 0, 1)
                    local value = math.floor(((Options.Max - Options.Min) * percentage) + Options.Min)

                    Value.Text = tostring(value)
                    Draggable.Size = UDim2.fromScale(percentage, 1)
                else
                    Value.Text = tostring(v)
                    local value = math.floor(((v - Options.Min) / (Options.Max - Options.Min)), 1)
                end
                Options.CallBack(SliderNhulon:GetValue())
            end

            function SliderNhulon:GetValue()
                return tonumber(Value.Text)
            end

            Draggable.MouseEnter:Connect(function()
                SliderNhulon.Hover = true
            end)

            Draggable.MouseLeave:Connect(function()
                SliderNhulon.Hover = false
            end)

            uis.InputBegan:Connect(function(input, gpe)
                if gpe then return end

                if input.UserInputType == Enum.UserInputType.MouseButton1 and SliderNhulon.Hover then
                    SliderNhulon.MouseDown = true

                    if not SliderNhulon.Connection then
                        SliderNhulon.Connection = Runservice.RenderStepped:Connect(function()
                            SliderNhulon:SetValue()
                        end)
                    end
                end
            end)

            uis.InputEnded:Connect(function(input, gpe)
                if gpe then return end

                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    SliderNhulon.MouseDown = false
                    if SliderNhulon.Connection then SliderNhulon.Connection:Disconnect() end
                    SliderNhulon.Connection = nil
                end
            end)
            return SliderNhulon
        end

        function TabContent:CreateDropdown(Options)
            Options = Options or {}
            Options.Name = Options.Name or "Dropdown"
            Options.Description = Options.Description or ""
            Options.List = Options.List or {}
            Options.Default = Options.Default or ""
            Options.CallBack = Options.CallBack or function() end

            local Dropdown = Instance.new("Frame")
            local Title_5 = Instance.new("TextLabel")
            local Content_4 = Instance.new("TextLabel")
            local DropClick = Instance.new("TextButton")
            local IcoDrop = Instance.new("ImageLabel")
            local ListFrame = Instance.new("Frame")
            local List = Instance.new("ScrollingFrame")
            local UIListLayout_3 = Instance.new("UIListLayout")
            local UIPadding_5 = Instance.new("UIPadding")
            local PaddingD = Instance.new("UIPadding")
            local PaddingD2 = Instance.new("UIPadding")
            local Selected = Instance.new("TextLabel")
            local Dropped = false

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = TabEnable
            Dropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Dropdown.BorderSizePixel = 0
            Dropdown.Position = UDim2.new(0, 0, 0.340940952, 0)
            Dropdown.Size = UDim2.new(1, 0, 5.98816114e-05, 55)

            Title_5.Name = "Title"
            Title_5.Parent = Dropdown
            Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_5.BackgroundTransparency = 1.000
            Title_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_5.BorderSizePixel = 0
            Title_5.ClipsDescendants = true
            Title_5.Position = UDim2.new(0, 0, 0, 6)
            Title_5.Size = UDim2.new(0.899497509, 0, 0, 16)
            Title_5.Font = Enum.Font.GothamBold
            Title_5.Text = Options.Name
            Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_5.TextSize = 15.000
            Title_5.TextXAlignment = Enum.TextXAlignment.Left

            PaddingD.Parent = Title_5
            PaddingD.PaddingLeft = UDim.new(0, 6)

            Content_4.Name = "Content"
            Content_4.Parent = Dropdown
            Content_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Content_4.BackgroundTransparency = 1.000
            Content_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Content_4.BorderSizePixel = 0
            Content_4.Position = UDim2.new(0, 0, 0, 28)
            Content_4.Size = UDim2.new(0.804020107, 0, 0, 26)
            Content_4.Font = Enum.Font.GothamBold
            Content_4.Text = Options.Description
            Content_4.TextColor3 = Color3.fromRGB(100, 100, 100)
            Content_4.TextSize = 12.000
            Content_4.TextXAlignment = Enum.TextXAlignment.Left

            PaddingD2.Parent = Content_4
            PaddingD2.PaddingLeft = UDim.new(0, 6)

            DropClick.Name = "DropClick"
            DropClick.Parent = Dropdown
            DropClick.Active = false
            DropClick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropClick.BackgroundTransparency = 1.000
            DropClick.BorderColor3 = Color3.fromRGB(0, 0, 0)
            DropClick.BorderSizePixel = 0
            DropClick.ClipsDescendants = true
            DropClick.Selectable = false
            DropClick.Size = UDim2.new(1, 0, 1, 0)
            DropClick.Font = Enum.Font.GothamBold
            DropClick.Text = ""
            DropClick.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropClick.TextSize = 14.000

            IcoDrop.Name = "IcoDrop"
            IcoDrop.Parent = Dropdown
            IcoDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            IcoDrop.BackgroundTransparency = 1.000
            IcoDrop.BorderColor3 = Color3.fromRGB(0, 0, 0)
            IcoDrop.BorderSizePixel = 0
            IcoDrop.ClipsDescendants = true
            IcoDrop.Position = UDim2.new(1, -42, 0, 10)
            IcoDrop.Size = UDim2.new(0, 35, 0, 35)
            IcoDrop.Image = "rbxassetid://16425489566"

            ListFrame.Name = "ListFrame"
            ListFrame.Parent = Dropdown
            ListFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            ListFrame.BackgroundTransparency = 1.000
            ListFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ListFrame.BorderSizePixel = 0
            ListFrame.Position = UDim2.new(0, 0, 0, 57)
            ListFrame.Size = UDim2.new(1, 0, 0.130903095, 55)
            ListFrame.Visible = false

            List.Name = "List"
            List.Parent = ListFrame
            List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            List.BackgroundTransparency = 1.000
            List.BorderColor3 = Color3.fromRGB(0, 0, 0)
            List.BorderSizePixel = 0
            List.Selectable = false
            List.Size = UDim2.new(1, 0, 1, 0)
            List.CanvasSize = UDim2.new(0, 0, 0, 0)
            List.ScrollBarThickness = 0
            List.ClipsDescendants = true
            spawn(function()
                while wait() do
                    List.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_3.AbsoluteContentSize.Y)
                end
            end)

            UIListLayout_3.Parent = List
            UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_3.Padding = UDim.new(0, 4)

            UIPadding_5.Parent = List
            UIPadding_5.PaddingBottom = UDim.new(0, 3)
            UIPadding_5.PaddingLeft = UDim.new(0, 3)
            UIPadding_5.PaddingRight = UDim.new(0, 3)
            UIPadding_5.PaddingTop = UDim.new(0, 3)

            Selected.Name = "Selected"
            Selected.Parent = Dropdown
            Selected.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Selected.BackgroundTransparency = 1.000
            Selected.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Selected.BorderSizePixel = 0
            Selected.Position = UDim2.new(1, -149, 0, 21)
            Selected.Size = UDim2.new(0, 100, 0, 16)
            Selected.Font = Enum.Font.GothamBold
            Selected.Text = Options.Default
            Selected.TextColor3 = Color3.fromRGB(255, 255, 255)
            Selected.TextSize = 14.000
            Selected.TextXAlignment = Enum.TextXAlignment.Right
            Options.CallBack(Selected.Text)

            for i, v in next, Options.List do
                local Option1 = Instance.new("TextButton")

                Option1.Name = "Option1"
                Option1.Parent = List
                Option1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Option1.BackgroundTransparency = 1.000
                Option1.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Option1.BorderSizePixel = 0
                Option1.ClipsDescendants = true
                Option1.Size = UDim2.new(1, 0, 0, 25)
                Option1.Font = Enum.Font.GothamBold
                Option1.Text = tostring(v)
                Option1.TextColor3 = Color3.fromRGB(255, 255, 255)
                Option1.TextSize = 14.000

                Option1.MouseEnter:Connect(function()
                    TweenService:Create(
                        Option1,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            TextTransparency = 0
                        }
                    ):Play()
                end)

                Option1.MouseLeave:Connect(function()
                    TweenService:Create(
                        Option1,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            TextTransparency = 0.5
                        }
                    ):Play()
                end)

                Option1.MouseButton1Click:Connect(function()
                    Dropped = false
                    ListFrame.Visible = false
                    Dropdown:TweenSize(UDim2.new(1, 0, 0, 55), "Out", "Quad", 0.3, true)
                    TweenService:Create(
                        ListFrame,
                        TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            Visible = false
                        }
                    ):Play()
                    TweenService:Create(
                        IcoDrop,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                        { ImageColor3 = Color3.fromRGB(255, 255, 255) }
                    ):Play()
                    pcall(Option1.Text)
                    Options.CallBack(Option1.Text)
                    Selected.Text = Option1.Text
                end)
            end

            DropClick.MouseButton1Click:Connect(function()
                if Dropped == false then
                    Dropped = true
                    Dropdown:TweenSize(UDim2.new(1, 0, 0.170, 55), "Out", "Quad", 0.3, true)
                    TweenService:Create(
                        ListFrame,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            Visible = true
                        }
                    ):Play()
                    TweenService:Create(
                        IcoDrop,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                        { ImageColor3 = Color3.fromRGB(32, 140, 255) }
                    ):Play()
                else
                    Dropped = false
                    Dropdown:TweenSize(UDim2.new(1, 0, 0, 55), "Out", "Quad", 0.3, true)
                    TweenService:Create(
                        ListFrame,
                        TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            Visible = false
                        }
                    ):Play()
                    TweenService:Create(
                        IcoDrop,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                        { ImageColor3 = Color3.fromRGB(255, 255, 255) }
                    ):Play()
                end
            end)
        end

        function TabContent:CreateTextBox(Options)
            Options = Options or {}
            Options.Name = Options.Name or ""
            Options.Description = Options.Description or ""
            Options.Default = Options.Default or ""
            Options.CallBack = Options.CallBack or function() end

            local TextBox = Instance.new("Frame")
            local Title_6 = Instance.new("TextLabel")
            local UIPadding_6 = Instance.new("UIPadding")
            local Content_5 = Instance.new("TextLabel")
            local UIPadding_7 = Instance.new("UIPadding")
            local Put = Instance.new("TextBox")
            local UIStroke_2 = Instance.new("UIStroke")
            local UICorner_11 = Instance.new("UICorner")
            local InputFunc = {}

            TextBox.Name = "TextBox"
            TextBox.Parent = TabEnable
            TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
            TextBox.BorderSizePixel = 0
            TextBox.Size = UDim2.new(1, 0, 0, 55)

            Title_6.Name = "Title"
            Title_6.Parent = TextBox
            Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Title_6.BackgroundTransparency = 1.000
            Title_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Title_6.BorderSizePixel = 0
            Title_6.ClipsDescendants = true
            Title_6.Position = UDim2.new(0, 0, 0, 6)
            Title_6.Size = UDim2.new(0.899497509, 0, 0, 16)
            Title_6.Font = Enum.Font.GothamBold
            Title_6.Text = Options.Name
            Title_6.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title_6.TextSize = 15.000
            Title_6.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_6.Parent = Title_6
            UIPadding_6.PaddingLeft = UDim.new(0, 6)

            Content_5.Name = "Content"
            Content_5.Parent = TextBox
            Content_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Content_5.BackgroundTransparency = 1.000
            Content_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Content_5.BorderSizePixel = 0
            Content_5.Position = UDim2.new(0, 0, 0, 28)
            Content_5.Size = UDim2.new(0.899497509, 0, 0, 26)
            Content_5.Font = Enum.Font.GothamBold
            Content_5.Text = Options.Description
            Content_5.TextColor3 = Color3.fromRGB(100, 100, 100)
            Content_5.TextSize = 12.000
            Content_5.TextXAlignment = Enum.TextXAlignment.Left

            UIPadding_7.Parent = Content_5
            UIPadding_7.PaddingLeft = UDim.new(0, 6)

            Put.Name = "Put"
            Put.Parent = TextBox
            Put.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Put.BackgroundTransparency = 1.000
            Put.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Put.BorderSizePixel = 0
            Put.Position = UDim2.new(1, -110, 0, 15)
            Put.Size = UDim2.new(0, 100, 0, 27)
            Put.Font = Enum.Font.GothamBold
            Put.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            Put.Text = Options.Default
            Put.TextColor3 = Color3.fromRGB(255, 255, 255)
            Put.TextSize = 14.000
            Put.ClipsDescendants = true
            Options.CallBack(Put.Text)

            UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            UIStroke_2.Color = Color3.fromRGB(255, 255, 255)
            UIStroke_2.Parent = Put

            UICorner_11.CornerRadius = UDim.new(0, 3)
            UICorner_11.Parent = Put

            function InputFunc:Set(Value)
                Put.Text = Value
            end

            local Inputting = false
            Put.Focused:Connect(function()
                Inputting = true
            end)
            Put.FocusLost:Connect(function()
                Inputting = false
                Put.Size = UDim2.new(0, 100, 0, 27)
                Options.CallBack(Put.Text)
            end)
            return InputFunc
        end

        return TabContent
    end

    return Tab
end

return NightLib
