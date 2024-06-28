# Night Hub Library Ui New

# Library :
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SourceFullNightHub/ewihwg/main/l"))()
```

# Create Window :
```lua
local Windows = Library:CreateWindow({Title = 'Night Hub'})
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
local Tab = Windows:CreateTab({Name = 'Tab'})
```

# Create Section :
```lua
Tab:CreateSection({Text = 'Section'})
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
local ToggleShit = Tab:CreateToggle({
    Name = "Toggle",
    Description = "Is This Description",
    Default = false,
    Settings = false,
    CallBack = function(Value)
        print(Value)
    end
})
```

# Settings Toggle
```lua
ToggleShit:CreateToggle({
    Name = "Toggle",
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
# Label
```lua
Tab:CreateLabel({Text = "Label"})
```
# Section Large
```lua
Tab:CreateSectionContent({
    Text = "Section Large"
})
```
# Create Paragraph :
```lua
Tab:CreateParagraph({Title = "Paragraph", Content = "Description"})
```

# Create Create TextBox :
```lua
Tab:CreateTextBox({
    Name = "TextBox",
    Default = "Hi",
    CallBack = function(Value)
        print(Value)
    end
})
```
