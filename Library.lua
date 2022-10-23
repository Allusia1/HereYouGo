local Lib = {}

function Lib:create(bottom_title)
  local duckhook = Instance.new("ScreenGui")
  syn.protect_gui(duckhook)
  local body = Instance.new("Frame")
  local tab_list_frame = Instance.new("Frame")
  local UIListLayout = Instance.new("UIListLayout")
  local bottom_bar_frame = Instance.new("Frame")
  local made_by = Instance.new("TextLabel")
  local body_seperators = Instance.new("Frame")
  local TOP_tab_seperator = Instance.new("Frame")
  local BOTTOM_tab_seperator = Instance.new("Frame")
  local Tabs = Instance.new("Frame")

  game:GetService("UserInputService").InputBegan:Connect(function(Input, GameProcessed)
    if Input.KeyCode == Enum.KeyCode.RightControl and not GameProcessed then
      duckhook.Enabled = not duckhook.Enabled
    end
  end)

  duckhook.Name = "duckhook"
  duckhook.Parent = game.CoreGui
  body.Name = "body"
  body.Parent = duckhook
  body.BackgroundColor3 = Color3.fromRGB(24, 20, 19)
  body.BorderSizePixel = 0
  body.Position = UDim2.new(0.215509474, 0, 0.181395352, 0)
  body.Size = UDim2.new(0, 631, 0, 410)
  body.Active = true
  body.Draggable = true
  tab_list_frame.Name = "tab_list_frame"
  tab_list_frame.Parent = body
  tab_list_frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  tab_list_frame.BackgroundTransparency = 1.000
  tab_list_frame.Size = UDim2.new(0, 631, 0, 25)
  UIListLayout.Parent = tab_list_frame
  UIListLayout.FillDirection = Enum.FillDirection.Horizontal
  UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
  bottom_bar_frame.Name = "bottom_bar_frame"
  bottom_bar_frame.Parent = body
  bottom_bar_frame.BackgroundColor3 = Color3.fromRGB(29, 185, 84)
  bottom_bar_frame.BorderSizePixel = 0
  bottom_bar_frame.Position = UDim2.new(0, 0, 0.955326557, 0)
  bottom_bar_frame.Size = UDim2.new(0, 631, 0, 18)
  made_by.Name = "made_by"
  made_by.Parent = bottom_bar_frame
  made_by.BackgroundColor3 = Color3.fromRGB(24, 20, 19)
  made_by.BackgroundTransparency = 1.000
  made_by.BorderSizePixel = 0
  made_by.Position = UDim2.new(0.00792392995, 0, 0.111111112, 0)
  made_by.Size = UDim2.new(0, 621, 0, 13)
  made_by.Font = Enum.Font.Code
  made_by.Text = bottom_title
  made_by.TextStrokeTransparency = 0.000
  made_by.TextColor3 = Color3.fromRGB(255, 255, 255)
  made_by.TextSize = 14.000
  made_by.TextXAlignment = Enum.TextXAlignment.Left
  body_seperators.Name = "body_seperators"
  body_seperators.Parent = body
  body_seperators.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  body_seperators.BackgroundTransparency = 1.000
  body_seperators.BorderSizePixel = 0
  body_seperators.Position = UDim2.new(0, 0, 0.0609756112, 0)
  body_seperators.Size = UDim2.new(0, 631, 0, 366)
  TOP_tab_seperator.Name = "TOP_tab_seperator"
  TOP_tab_seperator.Parent = body_seperators
  TOP_tab_seperator.BackgroundColor3 = Color3.fromRGB(29, 185, 84)
  TOP_tab_seperator.Position = UDim2.new(0.0174326468, 0, 0.0163934417, 0)
  TOP_tab_seperator.Size = UDim2.new(0, 609, 0, 1)
  BOTTOM_tab_seperator.Name = "BOTTOM_tab_seperator"
  BOTTOM_tab_seperator.Parent = body_seperators
  BOTTOM_tab_seperator.BackgroundColor3 = Color3.fromRGB(29, 185, 84)
  BOTTOM_tab_seperator.Position = UDim2.new(0.0174326468, 0, 0.972677588, 0)
  BOTTOM_tab_seperator.Size = UDim2.new(0, 609, 0, 1)
  Tabs.Name = "Tabs"
  Tabs.Parent = body
  Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Tabs.BackgroundTransparency = 1.000
  Tabs.BorderSizePixel = 0
  Tabs.Position = UDim2.new(0.0174326468, 0, 0.100000001, 0)
  Tabs.Size = UDim2.new(0, 609, 0, 328)

  local Tab = {}

  function Tab:create(Title, isActive)
    local Tab1 = Instance.new("TextButton")
    local TABS_Tab1 = Instance.new("Frame")
    Tab1.Name = "Tab"..Title
    Tab1.Parent = tab_list_frame
    Tab1.BackgroundColor3 = isActive and Color3.fromRGB(29, 185, 84) or Color3.fromRGB(28, 153, 72)
    Tab1.BorderSizePixel = 0
    Tab1.Size = UDim2.new(0, 75, 0, 25)
    Tab1.AutoButtonColor = false
    Tab1.Font = Enum.Font.Code
    Tab1.Text = Title
    Tab1.TextColor3 = Color3.fromRGB(235, 235, 235)
    Tab1.TextSize = 14.000
    Tab1.TextStrokeTransparency = 0.000

    TABS_Tab1.Name = "TABS_Tab"..Title
    TABS_Tab1.Parent = Tabs
    TABS_Tab1.Visible = isActive
    TABS_Tab1.BackgroundColor3 = Color3.fromRGB(24, 20, 19)
    TABS_Tab1.BorderColor3 = Color3.fromRGB(28, 153, 72)
    TABS_Tab1.Size = UDim2.new(0, 609, 0, 328)

    Tab1.MouseButton1Click:Connect(function()
      Tab1.BackgroundColor3 = Color3.fromRGB(29, 185, 84)
      TABS_Tab1.Visible = true
      for i,v in next, tab_list_frame:GetChildren() do
        if v.Name:find("Tab") and v ~= Tab1 then
          v.BackgroundColor3 = Color3.fromRGB(28, 153, 72)
          warn("Disabled tab", v.Name)
        end
      end
      for i,v in next, Tabs:GetChildren() do
        if v.Name:find("TABS_Tab") and v ~= TABS_Tab1 then
          v.Visible = false
          warn("Hid tab", v.Name)
        end
      end
    end)

    local InnerTab = {amount=0}

    function InnerTab:Create()
      InnerTab.amount = InnerTab.amount + 1

      local inner_tab1_frame1 = Instance.new("ScrollingFrame")
      local UIListLayout_2 = Instance.new("UIListLayout")
      local inner_tabframe_seperator_top = Instance.new("Frame")
      inner_tab1_frame1.Name = "inner_tab1_frame1"
      inner_tab1_frame1.Parent = TABS_Tab1
      inner_tab1_frame1.Active = true
      inner_tab1_frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      inner_tab1_frame1.BackgroundTransparency = 1.000
      inner_tab1_frame1.BorderSizePixel = 0
      inner_tab1_frame1.Size = UDim2.new(0, 305, 0, 328)
      inner_tab1_frame1.BottomImage = ""
      inner_tab1_frame1.ScrollBarThickness = 5
      inner_tab1_frame1.TopImage = ""
      inner_tab1_frame1.ScrollBarImageColor3 = Color3.fromRGB(29, 185, 84)
      if(InnerTab.amount ~= 1) then
        inner_tab1_frame1.Position = UDim2.new(0.499, 0,0, 0)
      end

      UIListLayout_2.Parent = inner_tab1_frame1
      UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
      UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
      UIListLayout_2.Padding = UDim.new(0.00999999978, 0)

      inner_tabframe_seperator_top.Name = "inner_tabframe_seperator_top"
      inner_tabframe_seperator_top.Parent = inner_tab1_frame1
      inner_tabframe_seperator_top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      inner_tabframe_seperator_top.BackgroundTransparency = 1.000
      inner_tabframe_seperator_top.BorderSizePixel = 0
      inner_tabframe_seperator_top.Size = UDim2.new(0, 294, 0, 0)

      local Elements = {}

      function Elements:drawDivider(DividerName)
        local inner_tabframe_section = Instance.new("TextLabel")
        inner_tabframe_section.Name = "inner_tabframe_section"
        inner_tabframe_section.Parent = inner_tab1_frame1
        inner_tabframe_section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        inner_tabframe_section.BackgroundTransparency = 1.000
        inner_tabframe_section.Position = UDim2.new(0.172131151, 0, 0.0199999921, 0)
        inner_tabframe_section.Size = UDim2.new(0, 280, 0, 13)
        inner_tabframe_section.Font = Enum.Font.SourceSans
        inner_tabframe_section.Text = DividerName
        inner_tabframe_section.TextColor3 = Color3.fromRGB(29, 185, 84)
        inner_tabframe_section.TextSize = 16.000
        inner_tabframe_section.TextXAlignment = Enum.TextXAlignment.Left
      end

      function Elements:drawButton(ButtonName, ButtonCallBack)
        local inner_tabframe_button = Instance.new("Frame")
        local button_name = Instance.new("TextLabel")
        local button_reg = Instance.new("TextButton")

        inner_tabframe_button.Name = "inner_tabframe_button"
        inner_tabframe_button.Parent = inner_tab1_frame1
        inner_tabframe_button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        inner_tabframe_button.BackgroundTransparency = 1.000
        inner_tabframe_button.Position = UDim2.new(0.0360655747, 0, 0.07963413, 0)
        inner_tabframe_button.Size = UDim2.new(0, 283, 0, 20)

        button_name.Name = "button_name"
        button_name.Parent = inner_tabframe_button
        button_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        button_name.BackgroundTransparency = 1.000
        button_name.BorderSizePixel = 0
        button_name.Position = UDim2.new(0.00353356893, 0, 0, 0)
        button_name.Size = UDim2.new(0, 202, 0, 20)
        button_name.Font = Enum.Font.Code
        button_name.Text = ButtonName
        button_name.TextColor3 = Color3.fromRGB(255, 255, 255)
        button_name.TextSize = 14.000
        button_name.TextStrokeTransparency = 0.000
        button_name.TextXAlignment = Enum.TextXAlignment.Left

        button_reg.Name = "button_reg"
        button_reg.Parent = inner_tabframe_button
        button_reg.Active = false
        button_reg.BackgroundColor3 = Color3.fromRGB(29, 185, 84)
        button_reg.BorderColor3 = Color3.fromRGB(28, 153, 72)
        button_reg.Position = UDim2.new(0.717314482, 0, 0, 0)
        button_reg.Size = UDim2.new(0, 80, 0, 20)
        button_reg.AutoButtonColor = false
        button_reg.Font = Enum.Font.Code
        button_reg.Text = "CLICK"
        button_reg.TextColor3 = Color3.fromRGB(255, 255, 255)
        button_reg.TextSize = 14.000
        button_reg.TextStrokeTransparency = 0.000

        button_reg.MouseButton1Click:Connect(ButtonCallBack)
      end

      function Elements:drawKeybind(KeybindName, KeybindState, KeybindValue, KeybindCallback)
        local inner_tabframe_keybind = Instance.new("Frame")
        local keybind_name = Instance.new("TextLabel")
        local keybind_reg = Instance.new("TextButton")

        inner_tabframe_keybind.Name = "inner_tabframe_keybind"
        inner_tabframe_keybind.Parent = inner_tab1_frame1
        inner_tabframe_keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        inner_tabframe_keybind.BackgroundTransparency = 1.000
        inner_tabframe_keybind.Position = UDim2.new(0.0360655747, 0, 0.07963413, 0)
        inner_tabframe_keybind.Size = UDim2.new(0, 283, 0, 20)

        keybind_name.Name = "keybind_name"
        keybind_name.Parent = inner_tabframe_keybind
        keybind_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        keybind_name.BackgroundTransparency = 1.000
        keybind_name.BorderSizePixel = 0
        keybind_name.Position = UDim2.new(0.00353356893, 0, 0, 0)
        keybind_name.Size = UDim2.new(0, 242, 0, 20)
        keybind_name.Font = Enum.Font.Code
        keybind_name.Text = KeybindName
        keybind_name.TextColor3 = Color3.fromRGB(255, 255, 255)
        keybind_name.TextSize = 14.000
        keybind_name.TextStrokeTransparency = 0.000
        keybind_name.TextXAlignment = Enum.TextXAlignment.Left

        keybind_reg.Name = "keybind_reg"
        keybind_reg.Parent = inner_tabframe_keybind
        keybind_reg.Active = false
        keybind_reg.BackgroundColor3 = KeybindState and Color3.fromRGB(29, 185, 84) or Color3.fromRGB(28, 153, 72)
        keybind_reg.BorderColor3 = Color3.fromRGB(28, 153, 72)
        keybind_reg.Position = UDim2.new(0.858657241, 0, 0, 0)
        keybind_reg.Size = UDim2.new(0, 40, 0, 20)
        keybind_reg.AutoButtonColor = false
        keybind_reg.Font = Enum.Font.Code
        keybind_reg.Text = KeybindValue
        keybind_reg.TextColor3 = Color3.fromRGB(255, 255, 255)
        keybind_reg.TextSize = 14.000
        keybind_reg.TextStrokeTransparency = 0.000

        local isFocused = false

        keybind_reg.MouseButton1Click:Connect(function()
          isFocused = true
          keybind_reg.Text = "..."
        end)

        game:GetService("UserInputService").InputBegan:Connect(function(Input, GameProcessed)
          if Input.UserInputType == Enum.UserInputType.Keyboard then
            if not isFocused then
              if Input.KeyCode.Name == KeybindValue then
                KeybindCallback()
                KeybindState = not KeybindState
                keybind_reg.BackgroundColor3 = KeybindState and Color3.fromRGB(29, 185, 84) or Color3.fromRGB(28, 153, 72)
              end
            else
              isFocused = false
              if Input.KeyCode ~= Enum.KeyCode.Escape then
                keybind_reg.Text = Input.KeyCode.Name
                KeybindValue = Input.KeyCode.Name
              else
                keybind_reg.Text = "NONE"
              end
            end
          end
        end)
      end

      function Elements:drawDropdown(DropdownName, DropdownState, DropdownList, DropdownCallback)
        local inner_tabframe_dropdown = Instance.new("Frame")
        local dropdown_name = Instance.new("TextLabel")
        local dropdown_reg = Instance.new("TextButton")
        local dropdown_list = Instance.new("ScrollingFrame")
        local dropdown_list_seperator = Instance.new("Frame")
        local UIListLayout_3 = Instance.new("UIListLayout")


        inner_tabframe_dropdown.Name = "inner_tabframe_dropdown"
        inner_tabframe_dropdown.Parent = inner_tab1_frame1
        inner_tabframe_dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        inner_tabframe_dropdown.BackgroundTransparency = 1.000
        inner_tabframe_dropdown.Position = UDim2.new(0.0360655747, 0, 0.07963413, 0)
        inner_tabframe_dropdown.Size = UDim2.new(0, 283, 0, 20)

        dropdown_name.Name = "dropdown_name"
        dropdown_name.Parent = inner_tabframe_dropdown
        dropdown_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        dropdown_name.BackgroundTransparency = 1.000
        dropdown_name.BorderSizePixel = 0
        dropdown_name.Position = UDim2.new(0.00353356893, 0, 0, 0)
        dropdown_name.Size = UDim2.new(0, 242, 0, 20)
        dropdown_name.Font = Enum.Font.Code
        dropdown_name.Text = DropdownName
        dropdown_name.TextColor3 = Color3.fromRGB(255, 255, 255)
        dropdown_name.TextSize = 14.000
        dropdown_name.TextStrokeTransparency = 0.000
        dropdown_name.TextXAlignment = Enum.TextXAlignment.Left

        dropdown_reg.Name = "dropdown_reg"
        dropdown_reg.Parent = inner_tabframe_dropdown
        dropdown_reg.Active = false
        dropdown_reg.BackgroundColor3 = Color3.fromRGB(24, 20, 19)
        dropdown_reg.BorderColor3 = Color3.fromRGB(28, 153, 72)
        dropdown_reg.Position = UDim2.new(0.614840984, 0, 0, 0)
        dropdown_reg.Size = UDim2.new(0, 109, 0, 20)
        dropdown_reg.AutoButtonColor = false
        dropdown_reg.Font = Enum.Font.Code
        dropdown_reg.Text = DropdownList[DropdownState]
        dropdown_reg.TextColor3 = Color3.fromRGB(255, 255, 255)
        dropdown_reg.TextSize = 14.000
        dropdown_reg.TextStrokeTransparency = 0.000

        dropdown_list.Name = "dropdown_list"
        dropdown_list.Parent = inner_tabframe_dropdown
        dropdown_list.Active = true
        dropdown_list.BackgroundColor3 = Color3.fromRGB(24, 20, 19)
        dropdown_list.BorderColor3 = Color3.fromRGB(28, 153, 72)
        dropdown_list.Position = UDim2.new(0.614840984, 0, 1, 0)
        dropdown_list.Size = UDim2.new(0, 109, 0, 59)
        dropdown_list.Visible = false
        dropdown_list.ZIndex = 100
        dropdown_list.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        dropdown_list.CanvasSize = UDim2.new(0, 0, 20, 0)
        dropdown_list.ScrollBarThickness = 4
        dropdown_list.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        dropdown_list.ScrollBarImageColor3 = Color3.fromRGB(29, 185, 84)

        UIListLayout_3.Parent = dropdown_list
        UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_3.Padding = UDim.new(0, 2)

        dropdown_list_seperator.Name = "dropdown_list_seperator"
        dropdown_list_seperator.Parent = dropdown_list
        dropdown_list_seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        dropdown_list_seperator.BackgroundTransparency = 1.000
        dropdown_list_seperator.Position = UDim2.new(0.0412844047, 0, 0, 0)
        dropdown_list_seperator.Size = UDim2.new(0, 100, 0, 0)

        local current_element

        for i = 1, #DropdownList do
          local dropdown_list_item = Instance.new("TextButton")
          dropdown_list_item.Name = "dropdown_list_item"
          dropdown_list_item.Parent = dropdown_list
          dropdown_list_item.BackgroundColor3 = i == DropdownState and Color3.fromRGB(29, 185, 84) or Color3.fromRGB(24, 20, 19)
          dropdown_list_item.BorderSizePixel = 0
          dropdown_list_item.Position = UDim2.new(0.0366972461, 0, 0.0210526325, 0)
          dropdown_list_item.Size = UDim2.new(0, 101, 0, 15)
          dropdown_list_item.ZIndex = 500
          dropdown_list_item.Font = Enum.Font.Code
          dropdown_list_item.Text = tostring(DropdownList[i])
          dropdown_list_item.TextColor3 = Color3.fromRGB(255, 255, 255)
          dropdown_list_item.TextSize = 14.000
          dropdown_list_item.TextStrokeTransparency = 0.000

          if i == DropdownState then
            current_element = dropdown_list_item
          end

          dropdown_list_item.MouseButton1Click:Connect(function()
            dropdown_reg.Text = DropdownList[i]
            DropdownCallback(DropdownList[i])
            dropdown_list.Visible = not dropdown_list.Visible
            current_element.BackgroundColor3 = Color3.fromRGB(24, 20, 19)
            current_element = dropdown_list_item
            current_element.BackgroundColor3 = Color3.fromRGB(29, 185, 84)
          end)
        end

        dropdown_reg.MouseButton1Click:Connect(function()
          dropdown_list.Visible = not dropdown_list.Visible
        end)
      end

      function Elements:drawToggle(ToggleName, ToggleState, ToggleCallback)
        local inner_tabframe_toggle = Instance.new("Frame")
        local toggle_name = Instance.new("TextLabel")
        local toggle_reg = Instance.new("TextButton")

        inner_tabframe_toggle.Name = "inner_tabframe_toggle"
        inner_tabframe_toggle.Parent = inner_tab1_frame1
        inner_tabframe_toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        inner_tabframe_toggle.BackgroundTransparency = 1.000
        inner_tabframe_toggle.Position = UDim2.new(0.0360655747, 0, 0.07963413, 0)
        inner_tabframe_toggle.Size = UDim2.new(0, 283, 0, 20)
        

        toggle_name.Name = "toggle_name"
        toggle_name.Parent = inner_tabframe_toggle
        toggle_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        toggle_name.BackgroundTransparency = 1.000
        toggle_name.BorderSizePixel = 0
        toggle_name.Position = UDim2.new(0.00353356893, 0, 0, 0)
        toggle_name.Size = UDim2.new(0, 242, 0, 20)
        toggle_name.Font = Enum.Font.Code
        toggle_name.Text = ToggleName
        toggle_name.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggle_name.TextSize = 14.000
        toggle_name.TextStrokeTransparency = 0.000
        toggle_name.TextXAlignment = Enum.TextXAlignment.Left

        toggle_reg.Name = "toggle_reg"
        toggle_reg.Parent = inner_tabframe_toggle
        toggle_reg.Active = false
        toggle_reg.BackgroundColor3 = ToggleState and Color3.fromRGB(29, 185, 84) or Color3.fromRGB(24, 20, 19)
        toggle_reg.Position = UDim2.new(0.92932862, 0, 0, 0)
        toggle_reg.Size = UDim2.new(0, 20, 0, 20)
        toggle_reg.AutoButtonColor = false
        toggle_reg.Font = Enum.Font.Code
        toggle_reg.Text = ""
        toggle_reg.BorderColor3 = Color3.fromRGB(28, 153, 72)
        toggle_reg.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggle_reg.TextSize = 14.000
        toggle_reg.TextStrokeTransparency = 0.000

        toggle_reg.MouseButton1Click:Connect(function()
          ToggleState = not ToggleState
          toggle_reg.BackgroundColor3 = ToggleState and Color3.fromRGB(29, 185, 84) or Color3.fromRGB(24, 20, 19)
          ToggleCallback(ToggleState)
        end)
      end

      function Elements:drawNumberSelector(SelectorName, SelectorState, SelectorMin, SelectorMax, SelectorStep, SelectorCallback)
        local inner_tabframe_selector = Instance.new("Frame")
        local selector_name = Instance.new("TextLabel")
        local selector_plus = Instance.new("TextButton")
        local selector_minus = Instance.new("TextButton")
        local selector_display = Instance.new("TextButton")

        inner_tabframe_selector.Name = "inner_tabframe_selector"
        inner_tabframe_selector.Parent = inner_tab1_frame1
        inner_tabframe_selector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        inner_tabframe_selector.BackgroundTransparency = 1.000
        inner_tabframe_selector.Position = UDim2.new(0.0360655747, 0, 0.07963413, 0)
        inner_tabframe_selector.Size = UDim2.new(0, 283, 0, 20)

        selector_name.Name = "selector_name"
        selector_name.Parent = inner_tabframe_selector
        selector_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        selector_name.BackgroundTransparency = 1.000
        selector_name.BorderSizePixel = 0
        selector_name.Position = UDim2.new(0.00353356893, 0, 0, 0)
        selector_name.Size = UDim2.new(0, 137, 0, 20)
        selector_name.Font = Enum.Font.Code
        selector_name.Text = SelectorName
        selector_name.TextColor3 = Color3.fromRGB(255, 255, 255)
        selector_name.TextSize = 14.000
        selector_name.TextStrokeTransparency = 0.000
        selector_name.TextXAlignment = Enum.TextXAlignment.Left

        selector_plus.Name = "selector_plus"
        selector_plus.Parent = inner_tabframe_selector
        selector_plus.Active = false
        selector_plus.BackgroundColor3 = Color3.fromRGB(29, 185, 84)
        selector_plus.BorderColor3 = Color3.fromRGB(28, 153, 72)
        selector_plus.Position = UDim2.new(0.92932862, 0, 0, 0)
        selector_plus.Size = UDim2.new(0, 18, 0, 20)
        selector_plus.AutoButtonColor = false
        selector_plus.Font = Enum.Font.Code
        selector_plus.Text = "+"
        selector_plus.TextColor3 = Color3.fromRGB(255, 255, 255)
        selector_plus.TextSize = 14.000
        selector_plus.TextStrokeTransparency = 0.000

        selector_minus.Name = "selector_minus"
        selector_minus.Parent = inner_tabframe_selector
        selector_minus.Active = false
        selector_minus.BackgroundColor3 = Color3.fromRGB(29, 185, 84)
        selector_minus.BorderColor3 = Color3.fromRGB(28, 153, 72)
        selector_minus.Position = UDim2.new(0.858657241, 0, 0, 0)
        selector_minus.Size = UDim2.new(0, 18, 0, 20)
        selector_minus.AutoButtonColor = false
        selector_minus.Font = Enum.Font.Code
        selector_minus.Text = "-"
        selector_minus.TextColor3 = Color3.fromRGB(255, 255, 255)
        selector_minus.TextSize = 14.000
        selector_minus.TextStrokeTransparency = 0.000

        selector_display.Name = "selector_display"
        selector_display.Parent = inner_tabframe_selector
        selector_display.Active = false
        selector_display.BackgroundColor3 = Color3.fromRGB(24, 20, 19)
        selector_display.BorderColor3 = Color3.fromRGB(28, 153, 72)
        selector_display.Position = UDim2.new(0.487632513, 0, 0, 0)
        selector_display.Size = UDim2.new(0, 105, 0, 20)
        selector_display.AutoButtonColor = false
        selector_display.Font = Enum.Font.Code
        selector_display.Text = tostring(SelectorState)
        selector_display.TextColor3 = Color3.fromRGB(255, 255, 255)
        selector_display.TextSize = 14.000
        selector_display.TextStrokeTransparency = 0.000

        selector_minus.MouseButton1Click:Connect(function()
          if SelectorState - SelectorStep >= SelectorMin then
            SelectorState = SelectorState - SelectorStep
            selector_display.Text = SelectorState
            SelectorCallback(SelectorState)
          end
        end)
        selector_plus.MouseButton1Click:Connect(function()
          if SelectorState + SelectorStep <= SelectorMax then
            SelectorState = SelectorState + SelectorStep
            selector_display.Text = SelectorState
            SelectorCallback(SelectorState)
          end
        end)
      end

      return Elements
    end

    return InnerTab
  end

  return Tab
end

-- local Window = Lib:create("Awesome Cheat By Ave and Inori") do
--     local Main = Window:create("Main", true) do
--         local MainPanel = Main:Create() do
--             MainPanel:drawDivider("Ultra Section")
--             MainPanel:drawToggle("Awesome Toggle", false, function(State)
--                 print("Toggled", State)
--             end)
--             MainPanel:drawDropdown("God Cheat", 1, {"Ave", "Inori"}, function(State)
--                 print("Hi", State)
--             end)
--             MainPanel:drawNumberSelector("Can't afford a slider", 0, 0, 100, 10, function(State)
--                 print(State)
--             end)
--             MainPanel:drawButton("Hello", function()
--                 print("HELLO!!!!")
--             end)
--             MainPanel:drawKeybind("Awesome Bind", false, "F", function(State)
--                 print("is pressed in?", State)
--             end)
--         end
--     end
-- end

return Lib
