# Night Hub Library Ui New

# Library :
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SourceFullNightHub/ewihwg/main/l"))()
```

# Create Window :
```lua
local Windows = Library:CreateWindow({Title = 'Night Hub', Cre = '! Nightx'})
```
# Create Notify :
```lua
Library:Notify({
   Title = "Night Hub",
   Content = "Is This Notify",
   Time = 5,
}) 
```

# Create Tab :
```lua
local Tab = Windows:CreateTab({Name = 'Tab', Icon = 'rbxassetid://17184558565'})
```

# Create Section :
```lua
local Section = Tab:CreateSection({Text = 'Section'})
```

# Create Buttons :
```lua
Tab:CreateButton({
    Name = "Button",
    Description = "Is This Description",
    CallBack = function()
        print('Hello World')
    end
})
```

# Create Toggle :
```lua
Tab:CreateToggle({
    Name = "Toggle",
    Description = "Is This Description",
    Default = false,
    CallBack = function(Value)
        print(Value)
    end
})
```

# Create DropDown :
```lua
Tab:CreateDropdown({
    Name = "Dropdown",
    Description = "Is This Description",
    Options = {"1", "2", "3"},
    Default = "1",
    CallBack = function(Value)
        print(Value)
    end
})
```

# Create Slider :
```lua
Tab:CreateSlider({
    Name = "Slider",
    Min = 1,
    Max = 100,
    Default = 50,
    CallBack = function(Value)
        print(Value)
    end
})
```

# Create Paragraph :
```lua
local Paragra = Tab:CreateParagraph({Title = "Paragraph", Content = "Description"})
```

# Create Create TextBox :
```lua
Tab:CreateTextBox({
    Name = "TextBox",
    Description = "Is This Description",
    Default = "Hi",
    CallBack = function(Value)
        print(Value)
    end
})
```
