# Night Hub Library Ui New

# Library :
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SourceFullNightHub/ewihwg/main/skidhubtaotaodamchet"))()
```

# Create Window :
```lua
local Main = Library.CreateMain({Title = 'Night Hub', Desc = 'Decription'})
```

# Create Tab :
```lua
local Page1 = Main.CreatePage({Page_Name = 'Page 1', Page_Title = 'Main Tab'})
```

# Create Section :
```lua
local Section = Page1.CreateSection('Item')
```

# Create Buttons :
```lua
Section.CreateButton({Title = 'Button'}, function()
    print("hello there")
end)
```

# Create Toggle :
```lua
Section.CreateToggle({Title = 'Toggle', Default = true}, function(Value)
    print(Value)
end)
```

# Create DropDown :
```lua
local List1 = {"1","2"}
Section.CreateDropdown({Title = 'Dropdown', List = List1, Search = true, Selected = true}, function(Value)
  print(Value)
end) 
```

# Create TextBox :
```lua
Section.CreateBox({Title = 'Box / Text Box', Placeholder = 'Type here', Number_Only = true}, function(Value)
    print(Value)
end)
```
