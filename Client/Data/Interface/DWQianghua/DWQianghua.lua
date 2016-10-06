
local MAX_OBJ_DISTANCE = 3.0
local g_CaredNpc = -1
local g_DWQIANGHUA_Item = -1
local g_DWQIANGHUA_DemandMoney = 0
local g_DWQIANGHUA_GRID_SKIP = 96
-- 金蚕丝, 强化用的道具, 按照 绑定 -> 元宝交易 -> 随便交易 顺序使用
local g_DWQIANGHUA_ToolItem = {20310168, 20310166, 20310167}
local g_DWQIANGHUA_Tool_Num = tonumber(1)
local g_DWQIANGHUA_NUM_LOW = tonumber(1)
local g_DWQIANGHUA_NUM_UP = tonumber(100000)

local g_DWQIANGHUA_Action_Type = 2
local g_DWQIANGHUA_RScript_ID = 809272
local g_DWQIANGHUA_RScript_Name = "DoDiaowenAction"

local g_DWQianghua_Frame_UnifiedPosition;

--=========================================================
-- 注册窗口关心的所有事件
--=========================================================
function DWQianghua_PreLoad()
	this:RegisterEvent("UI_COMMAND")
	this:RegisterEvent("UPDATE_DWQIANGHUA")
	this:RegisterEvent("OBJECT_CARED_EVENT")
	this:RegisterEvent("PACKAGE_ITEM_CHANGED")
	this:RegisterEvent("RESUME_ENCHASE_GEM")
	this:RegisterEvent("UNIT_MONEY")
	this:RegisterEvent("MONEYJZ_CHANGE")

	this:RegisterEvent("CONFIRM_DWQIANGHUA")
	
	this:RegisterEvent("ADJEST_UI_POS")
	this:RegisterEvent("VIEW_RESOLUTION_CHANGED")
end

--=========================================================
-- 载入初始化
--=========================================================
function DWQianghua_OnLoad()
	g_DWQIANGHUA_Item = -1
	g_DWQIANGHUA_DemandMoney = 0
	DWQianghua_DemandMoney:SetProperty("MoneyNumber", tostring(g_DWQIANGHUA_DemandMoney))
	g_DWQIANGHUA_Tool_Num = tonumber(1)
	DWQianghua_NumericalValue:SetProperty("Text", tostring(g_DWQIANGHUA_Tool_Num))
	-- 始终可以点击 OK 按钮, 为了方便提示玩家信息
	DWQianghua_OK:Enable()
	
	g_DWQianghua_Frame_UnifiedPosition=DWQianghua_Frame:GetProperty("UnifiedPosition");
end

--=========================================================
-- 事件处理
--=========================================================
function DWQianghua_OnEvent(event)
	if (event == "UI_COMMAND" and tonumber(arg0) == 3000156) then
		local xx = Get_XParam_INT(0)
		g_CaredNpc = DataPool:GetNPCIDByServerID(xx)
		if g_CaredNpc == -1 then
			PushDebugMessage("D� li畊 c黙 server truy玭 tr� l読 c� v 皤")
			return
		end
		BeginCareObject_DWQianghua()
		DWQianghua_Clear()
		DWQianghua_UpdateBasic()
		this:Show()
	elseif (event == "OBJECT_CARED_EVENT" and this:IsVisible()) then
		if (tonumber(arg0) ~= g_CaredNpc) then
			return
		end
		if ((arg1 == "distance" and tonumber(arg2) > MAX_OBJ_DISTANCE) or arg1=="destroy") then
			DWQianghua_Close()
		end
	elseif (event == "PACKAGE_ITEM_CHANGED" and this:IsVisible()) then
		if (arg0~= nil and -1 == tonumber(arg0)) then
			return
		end
		-- 可以改成允许接着强化, 那就不要在这里移除物品
		if tonumber(arg0) == g_DWQIANGHUA_Item then
			-- 强化后不将装备返还到包裹, 支持持续强化 - 2009-12-07
			--DWQianghua_Resume_Equip()
			DWQianghua_UpdateBasic()
		end
	elseif (event == "UPDATE_DWQIANGHUA") then
		--加载这里很容易导致界面处理不过来, 这个事件特别多
		--DWQianghua_UpdateBasic()
		if arg0 ~= nil then
			DWQianghua_Update(arg0)
			DWQianghua_UpdateBasic()
		end
	elseif (event == "UNIT_MONEY" or event =="MONEYJZ_CHANGE") then
		DWQianghua_UpdateBasic()
	elseif (event == "RESUME_ENCHASE_GEM" and this:IsVisible()) then
		if arg0 ~= nil and tonumber(arg0) == (g_DWQIANGHUA_GRID_SKIP + 1) then
			DWQianghua_Resume_Equip()
			DWQianghua_UpdateBasic()
		end
	elseif (event == "CONFIRM_DWQIANGHUA") then
		DWQianghua_OK_Clicked(1)
		
	elseif (event == "ADJEST_UI_POS" ) then
		DWQianghua_Frame_On_ResetPos()
		
	elseif (event == "VIEW_RESOLUTION_CHANGED") then
		DWQianghua_Frame_On_ResetPos()
	end
end

--=========================================================
-- 更新基本显示信息
-- 在这里计算金钱并显示
--=========================================================
function DWQianghua_UpdateBasic(nToolNum)
	DWQianghua_SelfMoney:SetProperty("MoneyNumber", Player:GetData("MONEY"))
	DWQianghua_SelfJiaozi:SetProperty("MoneyNumber", Player:GetData("MONEY_JZ"))

	if nToolNum == nil then
		nToolNum = g_DWQIANGHUA_Tool_Num
	end
	DWQianghua_SetToolNumAndText(nToolNum)

	-- 计算所需金钱
	g_DWQIANGHUA_DemandMoney = 0
	DWQianghua_DemandMoney:SetProperty("MoneyNumber", tostring(g_DWQIANGHUA_DemandMoney))
end

--=========================================================
-- 重置界面
--=========================================================
function DWQianghua_Clear()
	if g_DWQIANGHUA_Item ~= -1 then
		DWQianghua_Object:SetActionItem(-1)
		LifeAbility:Lock_Packet_Item(g_DWQIANGHUA_Item, 0)
		g_DWQIANGHUA_Item = -1
	end

	g_DWQIANGHUA_DemandMoney = 0
	DWQianghua_UpdateBasic(g_DWQIANGHUA_NUM_LOW)
	DWQianghua_NumericalValue:SetProperty("DefaultEditBox", "True")
	DWQianghua_NumericalValue:SetSelected(0, -1)
end

--=========================================================
-- 更新界面
--=========================================================
function DWQianghua_Update(itemIndex)
	local index = tonumber(itemIndex)
	local theAction = EnumAction(index, "packageitem")

	if theAction:GetID() ~= 0 then
		-- 判断是否为安全时间
		if (tonumber(DataPool:GetLeftProtectTime()) > 0) then
			PushDebugMessage("#{JJTZ_090826_26}")
			return
		end

		local ret = LifeAbility:CanEquipDiaowen_Enchase(index)
		if ret == -1 or ret == -2 then
			-- 不是一个已经蚀刻了雕纹的装备
			PushDebugMessage("#{ZBDW_091105_11}")
			return
		elseif ret == -3 then
			-- 装备上的雕纹已经强化满级, 不能再强化
			PushDebugMessage("Hoa v錸 tr阯 trang b� c醕 h� kh鬾g th� c叨ng h骯 n鎍.")
			return
		end

		-- 雕纹强化不判断装备是否加锁了 - 2009-12-07
		-- 判断物品是否加锁(在这个逻辑之前程序已经判断了)
--		if PlayerPackage:IsLock(index) == 1 then
--			PushDebugMessage("#{ZBDW_091105_3}")
--			return
--		end

		-- 如果空格内已经有对应物品了, 替换之
		if g_DWQIANGHUA_Item ~= -1 then
			LifeAbility:Lock_Packet_Item(g_DWQIANGHUA_Item, 0)
		end

		DWQianghua_Object:SetActionItem(theAction:GetID())
		LifeAbility:Lock_Packet_Item(index, 1)
		g_DWQIANGHUA_Item = index

		-- 设定 OK 为总是可以点击, 这样方便检验
		-- 判断物品是否满足要求来设定功能button
		-- DWQianghua_Check_AllItem()
	else
		DWQianghua_Clear()
	end
end

--=========================================================
-- 增加金蚕丝的数量
--=========================================================
function DWQianghua_Addition_Click()
	DWQianghua_UpdateBasic(g_DWQIANGHUA_Tool_Num + 1)
end

--=========================================================
-- 减少金蚕丝的数量
--=========================================================
function DWQianghua_Decrease_Click()
	DWQianghua_UpdateBasic(g_DWQIANGHUA_Tool_Num - 1)
end

--=========================================================
-- 金蚕丝数量改变
--=========================================================
function DWQianghua_ToolNumChange()
	local num = DWQianghua_NumericalValue:GetProperty("Text")
	-- 输入框改变了, 不要再改变输入框的内容, 不然用户就没法再输入框输入数字了
	-- 代码主动修改的文本
	if num == nil or (not num) or num == "" or tonumber(num) < g_DWQIANGHUA_NUM_LOW then
		g_DWQIANGHUA_Tool_Num = g_DWQIANGHUA_NUM_LOW
		DWQianghua_NumericalValue:SetProperty("Text", tostring(g_DWQIANGHUA_Tool_Num))
		return
	end
	-- 如果用户删除输入框的所有内容, tonumber 的结果比较诡异, 无法自动设置为某个值
	num = tonumber(num)
	if num == g_DWQIANGHUA_Tool_Num then
		return
	end
	-- 玩家输入文本: 首先对有效 num 进行保存, 不然可能影响玩家输入
	if tonumber(num) >= g_DWQIANGHUA_NUM_LOW and tonumber(num) <= g_DWQIANGHUA_NUM_UP then
		g_DWQIANGHUA_Tool_Num = tonumber(num)
	elseif tonumber(num) > g_DWQIANGHUA_NUM_UP then
		g_DWQIANGHUA_Tool_Num = g_DWQIANGHUA_NUM_UP
		DWQianghua_NumericalValue:SetProperty("Text", tostring(g_DWQIANGHUA_Tool_Num))
		--DWQianghua_SetToolNumAndText(g_DWQIANGHUA_NUM_UP)
	else
		g_DWQIANGHUA_Tool_Num = g_DWQIANGHUA_NUM_LOW
		DWQianghua_NumericalValue:SetProperty("Text", tostring(g_DWQIANGHUA_Tool_Num))
		--DWQianghua_SetToolNumAndText(g_DWQIANGHUA_NUM_LOW)
	end
	--很容易导致死循环, 由于金钱和强化数量无关, 不需要更新了.
	--DWQianghua_UpdateBasic(num)
end

--=========================================================
-- 金蚕丝数量的输入框失去焦点?
--=========================================================
function DWQianghua_TextLost()
	DWQianghua_ToolNumChange()
end

--=========================================================
-- 更改金蚕丝数量并设置变量
-- 为了保证这两个操作始终统一
--=========================================================
function DWQianghua_SetToolNumAndText(count)
	local num = tonumber(count)
	-- 注意这里不要和 DWQianghua_ToolNumChange() 产生死循环了
	if count == nil or count == "" or num < g_DWQIANGHUA_NUM_LOW then
		-- 输入太小的数
		g_DWQIANGHUA_Tool_Num = g_DWQIANGHUA_NUM_LOW
	elseif num > g_DWQIANGHUA_NUM_UP then
		g_DWQIANGHUA_Tool_Num = g_DWQIANGHUA_NUM_UP
	elseif num == g_DWQIANGHUA_Tool_Num then
		return
	else
		g_DWQIANGHUA_Tool_Num = num
	end

	DWQianghua_NumericalValue:SetProperty("Text", tostring(g_DWQIANGHUA_Tool_Num))
end

--=========================================================
-- 取出窗口内放入的物品
--=========================================================
function DWQianghua_Resume_Equip()
	if this:IsVisible() then
		if g_DWQIANGHUA_Item ~= -1 then
			LifeAbility:Lock_Packet_Item(g_DWQIANGHUA_Item, 0)
			DWQianghua_Object:SetActionItem(-1)
			g_DWQIANGHUA_Item = -1
		end
	end

	-- 重新初始化金蚕丝的数量
	DWQianghua_UpdateBasic(g_DWQIANGHUA_NUM_LOW)
end

--=========================================================
-- 判断是否所有物品都已放好
-- 只在点击 OK 按钮的时候调用这个函数
--=========================================================
function DWQianghua_Check_AllItem()
	DWQianghua_UpdateBasic()

	if g_DWQIANGHUA_Item == -1 then
		g_DWQIANGHUA_DemandMoney = 0
		DWQianghua_DemandMoney:SetProperty("MoneyNumber", tostring(g_DWQIANGHUA_DemandMoney))
		return 1
	end

	-- 判断装备是否能够强化(没有蚀刻雕纹或者强化到顶级了返回 < 0)
	local ret = LifeAbility:CanEquipDiaowen_Enchase(g_DWQIANGHUA_Item)
	if ret == -1 or ret == -2 then
		return 2
	end
	if ret < 0 then
		return 3
	end

	-- 判断金蚕丝数量, 输入的金蚕丝数量
	-- 在 Server 判断

	-- 判断金钱是否足够
	local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
	if selfMoney < g_DWQIANGHUA_DemandMoney then
		return 44
	end

	DWQianghua_OK:Enable()
	return 0
end


local EB_FREE_BIND = 0;				-- 无绑定限制
local EB_BINDED = 1;				-- 已经绑定
local EB_GETUP_BIND =2			-- 拾取绑定
local EB_EQUIP_BIND =3			-- 装备绑定
--=========================================================
-- 确定执行功能
--=========================================================
function DWQianghua_OK_Clicked(okFlag)
	local ret = DWQianghua_Check_AllItem()
	if ret == 1 or ret == 2 then
		PushDebugMessage("#{ZBDW_091105_12}")
		return
	elseif ret == 3 then
		PushDebugMessage("Hoa v錸 tr阯 trang b� c醕 h� kh鬾g th� c叨ng h骯 n鎍.")
		return
	elseif ret == 44 then
		PushDebugMessage("#{GMGameInterface_Script_PlayerMySelf_Info_Money_Not_Enough}")
		return
	end

	if ret == 0 then
		local toolNumInBag = 0		-- 背包里强化材料的个数
		for i, tbIndex in ipairs(g_DWQIANGHUA_ToolItem) do
			toolNumInBag = toolNumInBag + PlayerPackage:CountAvailableItemByIDTable(tonumber(tbIndex))
		end
		-- 判断强化材料是否足够
		if tonumber(toolNumInBag) < g_DWQIANGHUA_Tool_Num then
			PushDebugMessage("#{ZBDW_091105_13}")
			return
		end

		-- 检查绑定情况
		local equipBindState = PlayerPackage:GetItemBindStatusByIndex(g_DWQIANGHUA_Item)
		local isNeedConfirm = 0
		if equipBindState ~= EB_BINDED then
			for i, tbIndex in ipairs(g_DWQIANGHUA_ToolItem) do
				local index, bindState = PlayerPackage:FindFirstBindedItemIdxByIDTable(tonumber(tbIndex))
				if bindState == EB_BINDED then
					isNeedConfirm = 1
					break
				end
			end
		end

		--[黄曙光 TT65953 非绑定的重楼戒重楼玉与绑定雕纹使用时，不弹出绑定提示的提示框 ]
			local equipTableIndex	= PlayerPackage : GetItemTableIndex( g_DWQIANGHUA_Item )
			local isEquipBind	= GetItemBindStatus( g_DWQIANGHUA_Item )
			if(equipTableIndex == 10422016 or equipTableIndex == 10423024) then
				if ( 0 == isEquipBind ) then
					isNeedConfirm = 0;
				end
			end
		--[/黄曙光 TT65953 非绑定的重楼戒重楼玉与绑定雕纹使用时，不弹出绑定提示的提示框 ]

		-- 执行雕纹强化功能
		if isNeedConfirm ~= 1 or (okFlag ~= nil and okFlag == 1) then
			-- 如果装备是不绑定的, 查看背包里有无绑定的强化材料
			Clear_XSCRIPT()
				Set_XSCRIPT_Function_Name(g_DWQIANGHUA_RScript_Name)
				Set_XSCRIPT_ScriptID(g_DWQIANGHUA_RScript_ID)
				Set_XSCRIPT_Parameter(0, g_DWQIANGHUA_Action_Type)
				Set_XSCRIPT_Parameter(1, g_DWQIANGHUA_Item)
				-- 必须要加 tonumber, 否则可能莫名其妙的死掉....
				Set_XSCRIPT_Parameter(2, tonumber(g_DWQIANGHUA_Tool_Num))
				Set_XSCRIPT_ParamCount(3)
			Send_XSCRIPT()
		elseif okFlag == nil then
			-- 显示确认窗口
			if LifeAbility:ConfirmDiaowenQianghua(0) < 0 then
				-- 出错了? 诡异事件, 暂时不予理会呃....
			end
		end
	end

	-- 重新设置升级个数, 不然似乎界面什么都没有变化呢
	DWQianghua_UpdateBasic(g_DWQIANGHUA_NUM_LOW)
end

--=========================================================
-- 关闭界面
--=========================================================
function DWQianghua_Close()
	this:Hide()
	return
end

--=========================================================
-- 界面隐藏
--=========================================================
function DWQianghua_OnHiden()
	StopCareObject_DWQianghua()
	DWQianghua_Clear()
	return
end

--=========================================================
-- 开始关心NPC，
-- 在开始关心之前需要先确定这个界面是不是已经有“关心”的NPC，
-- 如果有的话，先取消已经有的“关心”
--=========================================================
function BeginCareObject_DWQianghua()
	AxTrace(0, 0, "LUA___CareObject g_CaredNpc =" .. g_CaredNpc)
	this:CareObject(g_CaredNpc, 1, "DWQianghua")
	return
end

--=========================================================
-- 停止对某NPC的关心
--=========================================================
function StopCareObject_DWQianghua()
	this:CareObject(g_CaredNpc, 0, "DWQianghua")
	g_CaredNpc = -1
	return
end

--=========================================================
-- 玩家金钱变化
--=========================================================
function DWQianghua_UserMoneyChanged()
	local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
	-- 判断金钱够不够
	if selfMoney < g_DWQIANGHUA_DemandMoney then
		--DWQianghua_OK:Disable()
		return -1
	end
	return 1
end

function DWQianghua_Frame_On_ResetPos()
  DWQianghua_Frame:SetProperty("UnifiedPosition", g_DWQianghua_Frame_UnifiedPosition);
end
