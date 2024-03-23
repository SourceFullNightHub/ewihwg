# Night Hub Library Ui New

# Library :
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SourceFullNightHub/ewihwg/main/skidhubtaotaodamchet"))()
```

# Create Window :
```lua
local Main = Library.CreateMain({Title = 'Blox Fruit', Desc = '- Blox Fruit'})
```
# Create Notify :
```lua
Library.CreateNoti({
   Title = "Night Hub,
   Desc = "Notify",
   ShowTime = 5,
}) 
```

# Create Tab :
```lua
local Page1 = Main.CreatePage({Page_Name = 'Page1', Page_Title = ''})
```

# Create Section :
```lua
local Section1 = Page1.CreateSection('Section')
```

# Create Buttons :
```lua
Section1.CreateButton({Title = 'Buttons'}, function()
    print("Hi")  
end)
```

# Create Toggle :
```lua
Section1.CreateToggle({Title = 'Toggle', Default = false}, function(Value)
    print(Value)
end)
```

# Create DropDown :
```lua
Section1.CreateDropdown({Title = 'DropDown', List = {"1", "2", "3", "4"}, Search = true, Selected = true}, function(Value)
    print(Value)
end)
```

# Create Slider :
```lua
Section1.CreateSlider({Title = "Slider", Min = 1, Max = 100, Default = 1, Precise = false}, function(Value)
    print(Value)
end)
```

# Create Key Bind :
```lua
Section2.CreateBind({Title = 'Key Bind', Key = Enum.KeyCode.RightControl}, function()
	    print("Key Bind")
end)
```

# Create TextBox :
```lua
Section11.CreateBox({Title = 'Sellect Amount Honey', Placeholder = 'Type here', Number_Only = true}, function(Value)
   print(Value)
end)
```
