
local UIBase = import('UI/UIBase')
---@type MyBillboard
local MyBillboard = {}
extends(MyBillboard, UIBase)

-- create a ui instance
function MyBillboard.New(controller)
    local newUI = new(MyBillboard)
    newUI.Controller = controller
    return newUI
end

function MyBillboard:OnInit(controller)
    Log.Info('MyBillboard OnInit, do controls binding')

    self.Controller = controller

    self.TitleLabel = self:GetUIText('Title')
    self.ContentLabel = self:GetUIText('Content')
end

function MyBillboard:OnOpen()
    Log.Info('MyBillboard OnOpen, do your logic')

    local rand = math.random(1, 3)
    local billboardSetting = MyBillboardSettings.Get('Billboard'..tostring(rand))

    --todo wht 不设置语言包没办法显示文本
    self.TitleLabel.text = billboardSetting.Title
    self.ContentLabel.text = billboardSetting.Content

    Log.Error("MyBillboard:OnOpen "..billboardSetting.Title.." "..billboardSetting.Content)
end

return MyBillboard
