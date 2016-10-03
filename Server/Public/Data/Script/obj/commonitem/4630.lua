-- 猪肉宠粮 (改成正确T阯)
-- 增加宠物生命值

-- 宠物通用功能脚本
x334630_g_petCommonId = PETCOMMON

--******************************************************************************
-- 以下部分C 喧ngC 修改to� 鸬 部分
--******************************************************************************

--脚本号 (改成正确脚本号)
x334630_g_scriptId = 334630

-- 增加值 (根据要求改写具体数值)
x334630_g_HPValue = 13780			-- 生命值增加值
x334630_g_MaxHPValue = 0		-- 最大生命值增加值
x334630_g_LifeValue = 0			-- 寿命增加值
x334630_g_HappinessValue = 0	-- 快乐度增加值

--标准效果ID (改成宠物吃宠粮to� 鸬 特效)
--g_ImpactID = 0

--******************************************************************************
-- 以上部分C 喧ngC 修改to� 鸬 部分
--******************************************************************************

--脚本

--**********************************
--必须Tr� v� 1 才能正确执行以下流程
--**********************************
function x334630_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x334630_OnConditionCheck( sceneId, selfId )
	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	--  餴琺到当前正T読 使用to� 鸬 物品to� 鸬 tr� tay n鋓
	nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	ret = CallScriptFunction( x334630_g_petCommonId, "IsPetCanUseFood", sceneId, selfId, nIndex )
	return ret
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x334630_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x334630_OnActivateOnce( sceneId, selfId )
	if x334630_g_HPValue > 0 then
		CallScriptFunction( x334630_g_petCommonId, "IncPetHP", sceneId, selfId, x334630_g_HPValue )
	end

	if x334630_g_MaxHPValue > 0 then
		CallScriptFunction( x334630_g_petCommonId, "IncPetMaxHP", sceneId, selfId, x334630_g_MaxHPValue )
	end

	if x334630_g_LifeValue > 0 then
		CallScriptFunction( x334630_g_petCommonId, "IncPetLife", sceneId, selfId, x334630_g_LifeValue )
	end

	if x334630_g_HappinessValue > 0 then
		CallScriptFunction( x334630_g_petCommonId, "IncPetHappiness", sceneId, selfId, x334630_g_HappinessValue )
	end

--	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, g_ImpactID, 0)
	return 1
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x334630_OnActivateEachTick( sceneId, selfId )
	return 1
end

-- C醝 n鄖 函数没有什么用,但喧ng必须有
function x334630_CancelImpacts( sceneId, selfId )
	return 0
end
