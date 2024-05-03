# Night Hub Library Ui New

# Library :
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SourceFullNightHub/ewihwg/main/l"))()
```

# Create Window :
```lua
local Windows = Library:CreateWindow({Title = 'Night Hub', Creator = '! Nightx'})
```
# Create Notify :
```lua
Library:MakeNotify({
   Name = "Night Hub",
   Content = "Is This Notify",
   Time = 5,
}) 
```

# Create Tab :
```lua
local Tab = Windows:MakeTab({Name = 'Tab', Icon = 'rbxassetid://17184558565'})
```

# Create Section :
```lua
local Section = Tab:CreateSection('Section')
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
    List = {"1", "2", "3"},
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
```
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
