# Night Hub Library Ui New

# Library :
```lua
local uilibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/SourceFullNightHub/ewihwg/main/skidhubtaotaodamchet"))()
```

# Create Window :
```lua
local windowz = uilibrary:CreateWindow("Night Hub", "Blox Fruit", true)
```

# Create Tab :
```lua
local Page1 = windowz:CreatePage("Page I")
```

# Create Section :
```lua
local Section1 = Page1:CreateSection("Section Name")
```

# Create Buttons :
```lua
Section1:CreateButton("Button Example", function () print("Button Cliked!") end)
```

# Create Toggle :
```lua
Section1:CreateToggle("Toggle Example", {Toggled = false , Description = "Iu Tvk nhìu UwU"}, function(Value) print(Value) end)
```

# Create DropDown :
```lua
Section1:CreateDropdown("Dropdown ", {List = {"Value1", "Value2", "Value3", "Value4"}, Default = "None"}, function(value) print(Value) end)
```

# Create TextBox :
```lua
Section1:CreateTextbox("TextBox", false, function(vv) print(vv) end)
```
